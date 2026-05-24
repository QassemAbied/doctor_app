import 'package:supabase_flutter/supabase_flutter.dart';

class SupAbaseHelper {
 static Future<void> init()async{
    Supabase.initialize(
        url: 'https://vhejwizndupndavahiow.supabase.co',
        anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZoZWp3aXpuZHVwbmRhdmFoaW93Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzOTM3NDYsImV4cCI6MjA5NDk2OTc0Nn0.NBsd6lqoKfsqg3RxAG9SNc-eQ-5PNX0ZCfMvBYt5Xn0',
    );
  }
}