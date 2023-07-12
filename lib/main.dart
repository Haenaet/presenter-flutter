import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:presenter/models/member.dart';
import 'package:presenter/screens/team_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MemberService(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "해냈조",
      theme: ThemeData(fontFamily: "Pretendard"),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const TeamScreen(),
    );
  }
}
