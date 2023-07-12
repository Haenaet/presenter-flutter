import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xff1A1A1A),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              itemCount: profileList.length,
              itemBuilder: (context, index) {
                String profile = profileList[index];

                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 80,
                    width: 90,
                    decoration: BoxDecoration(
                      color: colorCollection[getRandomNumber()],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        profileList[index],
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          elevation: 1,
          child: const Icon(
            Icons.add_rounded,
            size: 40,
          ),
        ),
      ),
    );
  }
}
