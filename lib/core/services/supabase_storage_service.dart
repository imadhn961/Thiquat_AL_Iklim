import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thiquat_al_iklim/core/services/storage.dart';

class SupabaseStorageService implements Storage {
  SupabaseStorageService({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  @override
  Future<String> uploadFile({
    required String bucket,
    required String path,
    required File file,
  }) async {
    await _client.storage
        .from(bucket)
        .upload(path, file, fileOptions: const FileOptions(upsert: true));
    return _client.storage.from(bucket).getPublicUrl(path);
  }
}
