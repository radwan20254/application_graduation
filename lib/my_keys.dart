import 'package:flutter_dotenv/flutter_dotenv.dart';

String androidApiKey = dotenv.env['ANDROID_MAP_API_KEY']!;
String iosApiKey = dotenv.env['IOS_MAP_API_KEY']!;