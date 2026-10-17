import 'package:flutter/material.dart';

String getLetter(BuildContext context, String name1) {
  final name = name1.trim();
  if (name.startsWith('ال') && name.length > 2) {
    return name[2];
  }
  return name.isNotEmpty ? name[0] : '';
}
