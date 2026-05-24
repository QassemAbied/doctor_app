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
}
