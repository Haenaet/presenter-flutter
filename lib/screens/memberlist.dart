import 'dart:math';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            itemCount: profileList.length,
            itemBuilder: (context, index) {
              String member = profileList[index];
              return Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 85,
                  width: 90,
                  decoration: BoxDecoration(
                    color: colorCollection[getRandomNumber()],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      bottomLeft: Radius.circular(35.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      member,
                      style: const TextStyle(
                        fontSize: 45,
                        color: Colors.black,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //TODO: 팀원 정보 추가 화면으로 이동하도록 구현해야 해요.
          debugPrint("팀원 정보 추가 화면으로 이동");
        },
        backgroundColor: Colors.white,
        elevation: 1,
        label: const Text(
          "추가하기",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(
          Icons.add_rounded,
          size: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
