import 'package:flutter/material.dart';
import 'package:presenter/screens/memberlist.dart';

import 'package:presenter/widgets/member_detail_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      return const MaterialApp(home: MemberList());
  }
}
