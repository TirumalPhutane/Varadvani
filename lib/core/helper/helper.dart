import 'package:url_launcher/url_launcher.dart';

class Helper {
  static dynamic launchUrlFromApp(String url, [LaunchMode? mode]) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: mode ?? LaunchMode.platformDefault)) {
      throw Exception('Could not launch $url');
    }
  }
}
