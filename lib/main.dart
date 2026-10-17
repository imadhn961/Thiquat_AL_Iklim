import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thiquat_al_iklim/core/services/shared_prefrences.dart';
import 'package:thiquat_al_iklim/firebase_options.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://vqqkaguvnonslzuwqycn.supabase.co',
    anonKey: 'sb_publishable_ja59rJTQ2UwTqvkne4tZuA_sdr7esaS',
  );
  await SharedPreferencesService.init();
  runApp(const App());
}
