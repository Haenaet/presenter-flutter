import 'dart:math';

import 'package:flutter/material.dart';
import 'package:presenter/models/member.dart';
import 'package:presenter/screens/member_detail_card_page.dart';
import 'package:provider/provider.dart';

import 'package:presenter/configs/palette.dart';

class MemberList extends StatefulWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  State<MemberList> createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  List<String> profileList = [
    'LEE SE RYEONG',
    'LEE SE RYEONG',
    'LEE SE RYEONG',
    'LEE SE RYEONG',
    'LEE SE RYEONG',
  ];

  final List<Color> colorCollection = [
    Colors.green,
    Colors.indigo,
    Colors.lime,
    Colors.pink,
    Colors.orange,
    Colors.purple,
    Colors.lightBlue,
  ];

  final List<int> usedColorIndex = [];

  int getRandomNumber() {
    while (true) {
      int randomNumber = Random().nextInt(colorCollection.length);
      if (usedColorIndex.length == profileList.length) {
        //profileList 길이랑 같으면 break로 빠져나옴 어차피 5개만 만들거니까
        break;
      }

      if (!usedColorIndex.contains(randomNumber)) {
        //usedcolorindex에 randomnumber가 없으면
        usedColorIndex.add(randomNumber); // 추가하기
        return randomNumber;
      }
    }
    return 0; //이미 모든 색을 호출하고있을땐 그냥 그린 반환. 5개만 만들거라서!!
  }



   Route _createRoute() {
    //네비게이션 이벤트 함수
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MemberDetailCardPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      return Consumer<MemberService>(
      builder: (context, memberService , child ) {
        List<Map<String, dynamic>> memberList = memberService.memberList;
        
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: memberList.length,
          itemBuilder: (context, index) {
            String memberName = memberList[index]['name'];

            return Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorCollection[getRandomNumber()],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    bottomLeft: Radius.circular(35.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListTile(
                    title : Text(memberName,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                     onTap:()  async{
                      // await Navigator.push(context, MaterialPageRoute(builder: (_) => MemberDetailPage(),),);
                      await Navigator.of(context).push(_createRoute());
                     }
                  ), 
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //TODO: 팀원 정보 추가 화면으로 이동하도록 구현해야 해요.
          debugPrint("팀원 정보 추가 화면으로 이동");
        },
        backgroundColor: Palette.onPrimaryColor,
        elevation: 1,
        label: const Text(
          "추가하기",
          style: TextStyle(
            color: Palette.primaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: const Icon(
          Icons.add_rounded,
          size: 30.0,
          color: Palette.primaryColor,
        ),
      ),
    );
  },
  );
}
}
