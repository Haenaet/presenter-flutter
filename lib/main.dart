import 'package:flutter/material.dart';
import 'package:presenter/screens/member_create.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MemberCreate(),
    );
  }
}
