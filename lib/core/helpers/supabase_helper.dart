import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupAbaseHelper {
 static Future<void> init()async{
    Supabase.initialize(
        url:  dotenv.env['SUB_URL']!,
        anonKey:  dotenv.env['SUB_ANONKEY']!,
    );
  }
}