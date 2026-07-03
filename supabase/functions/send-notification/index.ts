import { createClient } from "jsr:@supabase/supabase-js@2";
import { initializeApp, cert, getApps } from "npm:firebase-admin/app";
import { getMessaging } from "npm:firebase-admin/messaging";

const serviceAccount = JSON.parse(
  Deno.env.get("FIREBASE_SERVICE_ACCOUNT")!,
);

if (getApps().length === 0) {
  initializeApp({
    credential: cert(serviceAccount),
  });
}

const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
);

Deno.serve(async (req) => {
  try {
    const { doctorUserId, title, body } = await req.json();

    // ===========================
    // Insert notification
    // ===========================
    const { error: insertError } = await supabase
      .from("notifications")
      .insert({
        user_id: doctorUserId,
        title,
        body,
        is_read: false,
      });

    if (insertError) {
      console.error(insertError);

      return new Response(
        JSON.stringify({
          success: false,
          step: "insert notification",
          error: insertError.message,
        }),
        {
          status: 500,
          headers: {
            "Content-Type": "application/json",
          },
        },
      );
    }

    // ===========================
    // Get Doctor FCM Token
    // ===========================
    const { data: user, error: userError } = await supabase
      .from("users")
      .select("fcm_token")
      .eq("id", doctorUserId)
      .single();

    if (userError) {
      console.error(userError);

      return new Response(
        JSON.stringify({
          success: false,
          step: "get doctor token",
          error: userError.message,
        }),
        {
          status: 500,
          headers: {
            "Content-Type": "application/json",
          },
        },
      );
    }

    if (!user?.fcm_token) {
      return new Response(
        JSON.stringify({
          success: false,
          step: "doctor token",
          error: "Doctor has no FCM token",
        }),
        {
          status: 400,
          headers: {
            "Content-Type": "application/json",
          },
        },
      );
    }

    // ===========================
    // Send Push Notification
    // ===========================
    const messageId = await getMessaging().send({
      token: user.fcm_token,
      notification: {
        title,
        body,
      },
      android: {
        priority: "high",
      },
    });

    return new Response(
      JSON.stringify({
        success: true,
        messageId,
      }),
      {
        status: 200,
        headers: {
          "Content-Type": "application/json",
        },
      },
    );
  } catch (e) {
    console.error(e);

    return new Response(
      JSON.stringify({
        success: false,
        step: "catch",
        error: e instanceof Error ? e.message : String(e),
      }),
      {
        status: 500,
        headers: {
          "Content-Type": "application/json",
        },
      },
    );
  }
});