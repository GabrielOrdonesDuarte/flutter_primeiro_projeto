import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app_widget.dart';

Future main() async {
  await dotenv.load(fileName: ".env_prod");
  runApp(const AppWidget());
}
