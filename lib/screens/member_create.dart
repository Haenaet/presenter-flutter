import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:presenter/configs/palette.dart';
import 'package:presenter/models/member.dart';
import 'package:presenter/providers/member_provider.dart';
import 'package:presenter/screens/team_screen.dart';
import 'package:presenter/widgets/devjeans_picker.dart';
import 'package:presenter/widgets/member_create_widget.dart';

class MemberCreatePage extends StatefulWidget {
  const MemberCreatePage({Key? key}) : super(key: key);

  @override
  State<MemberCreatePage> createState() => _MemberCreatePageState();
}

class _MemberCreatePageState extends State<MemberCreatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController mottoController = TextEditingController();
  TextEditingController blogController = TextEditingController();
  TextEditingController mbtiController = TextEditingController();
  TextEditingController strengthController = TextEditingController();
  TextEditingController foodController = TextEditingController();

  String defaultDevJeans = "캐릭터선택";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    styleController.dispose();
    mottoController.dispose();
    blogController.dispose();
    mbtiController.dispose();
    strengthController.dispose();
    foodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final memberProvider = Provider.of<MemberProvider>(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: const Visibility(
          // 멤버 데이터가 Null 인 경우 true / 멤버 데이터를 받으면 false
          // member == null
          visible: false,
          replacement: Text(
            "멤버 수정하기",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(
            "멤버 추가하기",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          Visibility(
            // 멤버 데이터를 받으면 true / 멤버 데이터 Null 인 경우 false
            visible: false, // member != null true
            child: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                showDeleteDialog(context);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DevJeansPicker(
                onChanged: (value) {
                  setState(() {
                    defaultDevJeans = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              const TitleLabel(titleText: "이름"),
              const SizedBox(height: 8.0),
              CustomTextField(
                controller: nameController,
                hintText: "이름을 입력해주세요.",
                maxLength: 20,
              ),
              const TitleLabel(titleText: "해시 태그"),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HashTagContainer(
                    hintText: "MBTI",
                    controller: mbtiController,
                  ),
                  const SizedBox(width: 10.0),
                  HashTagContainer(
                    controller: strengthController,
                    hintText: "장점",
                  ),
                  const SizedBox(width: 10.0),
                  HashTagContainer(
                    controller: foodController,
                    hintText: "음식",
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const TitleLabel(titleText: "나의 스타일"),
              const SizedBox(height: 8.0),
              CustomTextField(
                controller: styleController,
                hintText: "나의 스타일을 입력해주세요.",
                maxLength: 200,
                maxLines: 4,
              ),
              const TitleLabel(titleText: "좌우명"),
              const SizedBox(height: 8.0),
              CustomTextField(
                controller: mottoController,
                hintText: "좌우명을 입력해주세요.",
              ),
              const TitleLabel(titleText: "블로그 주소"),
              const SizedBox(height: 8.0),
              CustomTextField(
                controller: blogController,
                hintText: "블로그 주소를 입력해주세요.",
              ),
              const SizedBox(height: 10.0),
              Center(
                child: CustomButton(
                  label: "추가",
                  color: Palette.spartaColor,
                  textColor: Palette.onPrimaryColor,
                  onPressed: () {
                    final member = Member(
                      name: nameController.text,
                      hashtags: [
                        mbtiController.text,
                        strengthController.text,
                        foodController.text
                      ],
                      introduction: styleController.text,
                      motto: mottoController.text,
                      blogAddress: blogController.text,
                      characterImagePath: getImageUrl(defaultDevJeans),
                    );
                    memberProvider.addMember(member);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("멤버를 추가했어요!"),
                      ),
                    );

                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const TeamScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getImageUrl(String value) {
    switch (value) {
      case '빵찾아삼만리':
        return 'assets/images/빵찾아삼만리.png';
      case '커피는내친구':
        return 'assets/images/커피는내친구.png';
      case '내가만든쿠키':
        return 'assets/images/내가만든쿠키.png';
      case '나는포기하지않아':
        return 'assets/images/나는포기하지않아.png';
      case '콜라는제로레몬이최고야':
        return 'assets/images/콜라는제로레몬이최고야.png';
      case '초밥킬러':
        return 'assets/images/초밥킬러.png';
      case '캐릭터선택':
        return 'assets/images/대표캐릭터.png';
      default:
        return 'assets/images/대표캐릭터.png';
    }
  }
}
