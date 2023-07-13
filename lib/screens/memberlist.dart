import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:presenter/screens/member_create.dart';
import 'package:presenter/screens/member_detail_card_page.dart';
import 'package:presenter/models/member.dart';
import 'package:presenter/providers/member_provider.dart';
import 'package:presenter/configs/palette.dart';

class MemberList extends StatefulWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  State<MemberList> createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  /// [colorCollection]은 팀원 리스트의 배경색을 랜덤하게 지정하기 위한 임의의 색상 리스트입니다.
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

  /// [usedColorIndex]는 [colorCollection]의 색상 중에서 사용된 색상의 인덱스를 저장합니다.
  int getRandomNumber() {
    if (usedColorIndex.length == colorCollection.length) {
      usedColorIndex.clear(); // 모든 색상이 사용되었으면 사용된 인덱스 초기화
    }

    while (true) {
      int randomNumber = Random().nextInt(colorCollection.length);
      if (!usedColorIndex.contains(randomNumber)) {
        usedColorIndex.add(randomNumber);
        return randomNumber;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadMembers();
  }

  Future<void> loadMembers() async {
    final memberProvider = Provider.of<MemberProvider>(context, listen: false);
    await memberProvider.loadMemberList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberProvider>(
      builder: (context, memberProvider, child) {
        List<Member> memberList = memberProvider.members;
        // int userColorIndex = getRandomNumber();
        if (memberList.isEmpty) {
          return Scaffold(
            backgroundColor: Palette.primaryColor,
            body: const Center(
              child: Text(
                "팀원 목록이 비었어요",
                style: TextStyle(
                  color: Palette.onPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MemberCreatePage()),
                );
                debugPrint("팀원 정보 추가 화면으로 이동했어요.");
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
        } else {
          return Scaffold(
            backgroundColor: Palette.primaryColor,
            body: ListView.builder(
              itemCount: memberList.length,
              itemBuilder: (context, index) {
                int userColorIndex = getRandomNumber();
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    bottom: 12.0,
                    top: 12.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (_) => MemberDetailCardPage(
                            randomColor: colorCollection[userColorIndex],
                            name: memberList[index].name,
                            hashtags: memberList[index].hashtags,
                            introduction: memberList[index].introduction,
                            characterImagePath:
                                memberList[index].characterImagePath,
                            motto: memberList[index].motto,
                            blogAddress: memberList[index].blogAddress,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorCollection[getRandomNumber()],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          bottomLeft: Radius.circular(35.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          memberList[index].name,
                          style: const TextStyle(
                            color: Palette.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => const MemberCreatePage()),
                );
                debugPrint("팀원 정보 추가 화면으로 이동했어요.");
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
        }
      },
    );
  }
}
