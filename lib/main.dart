import 'package:flutter/material.dart';

import 'package:presenter/screens/team_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "해냈조",
      debugShowCheckedModeBanner: false,
      home: TeamScreen(),
    );
  }
}
