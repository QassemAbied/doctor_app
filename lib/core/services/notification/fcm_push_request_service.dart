import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FcmPushService {
  static String supabaseUrl = dotenv.env['SUPABASE_URL']!;
  static String anonKey = dotenv.env['SUPABASE_ANON_KEY']!;

  static Future<void> sendNotification({
    required String doctorUserId,
    required String title,
    required String body,
  }) async {
    final response = await http.post(
      Uri.parse('$supabaseUrl/functions/v1/send-notification'),
      headers: {
        'Authorization': 'Bearer $anonKey',
        'apikey': anonKey,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "doctorUserId": doctorUserId,
        "title": title,
        "body": body,
      }),
    );

    log("STATUS => ${response.statusCode}");
    log("BODY => ${response.body}");
  }
}
