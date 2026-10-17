import 'dart:io';

abstract class Storage {
  Future<String> uploadFile({
    required String bucket,
    required String path,
    required File file,
  });
}
