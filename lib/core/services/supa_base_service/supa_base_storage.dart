import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupABaseStorage {
  final instance = Supabase.instance.client;

  Future<String> uploadImage(File file) async {
    final fileExt = path.extension(file.path);

    final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExt';

    await instance.storage.from('profiles').upload(fileName, file);

    final imageUrl = instance.storage.from('profiles').getPublicUrl(fileName);

    return imageUrl;
  }

  Future<String?> sendImageChat(File file) async {
    final fileExt = path.extension(file.path);

    final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExt';

    await instance.storage.from('chat-images').upload(fileName, file);

    final imageUrl = instance.storage
        .from('chat-images')
        .getPublicUrl(fileName);

    return imageUrl;
  }

  Future<String?> uploadVoice(File file) async {
    final fileExt = path.extension(file.path);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExt.m4a';

    await instance.storage.from('voice-messages').upload(fileName, file);

    return instance.storage.from('voice-messages').getPublicUrl(fileName);
  }
}
