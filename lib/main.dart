import 'package:flutter/material.dart';
import 'package:presenter/models/member.dart';
import 'package:presenter/screens/memberlist.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (context) => MemberService()),],
    child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MemberList(),
    );
  }
}
