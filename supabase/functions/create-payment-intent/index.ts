import Stripe from "https://esm.sh/stripe@14.25.0?target=denonext";

const stripe = new Stripe(
  Deno.env.get("STRIPE_SECRET_KEY")!,
  {
    apiVersion: "2025-05-28.basil",
  },
);

Deno.serve(async (req) => {
  try {
    const { amount } = await req.json();

    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount * 100,
      currency: "egp",
    });

    return new Response(
      JSON.stringify({
        clientSecret: paymentIntent.client_secret,
      }),
      {
        headers: {
          "Content-Type": "application/json",
        },
      },
    );
  } catch (e) {
    console.error(e);

    return new Response(
      JSON.stringify({
        error: e.toString(),
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