import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_control/pages/home_page.dart';
import 'package:remote_control/pages/settings.dart';
import 'package:remote_control/data/data.dart';

void main() {
  runApp(
    ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
          title: "PC-REMOTE",
          darkTheme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/settings': (context) => SettingsPage(),
          }),
    ),
  );
}

//
