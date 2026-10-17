import 'package:url_launcher/url_launcher.dart';

Future<bool> launchPhoneCall(String phoneNumber) {
  final uri = Uri(scheme: 'tel', path: phoneNumber);
  return launchUrl(uri);
}
