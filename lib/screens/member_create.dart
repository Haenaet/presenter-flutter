import 'package:flutter/material.dart';

import 'package:presenter/widgets/member_create_widget.dart';

class MemberCreatePage extends StatelessWidget {
  const MemberCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "멤버 추가하기",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              print("취소 버튼을 클릭했습니다.");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleLabel(
                titleText: "GitHub ID",
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                hintText: "깃허브 아이디를 입력해주세요.",
              ),
              const TitleLabel(
                titleText: "이름",
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                hintText: "이름을 입력해주세요.",
              ),
              const TitleLabel(
                titleText: "해시 태그",
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HashTagContainer(
                    hintText: "MBTI",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HashTagContainer(
                    hintText: "장점",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  HashTagContainer(
                    hintText: "음식",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const TitleLabel(
                titleText: "나의 스타일",
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                hintText: "나의 스타일을 입력해주세요.",
              ),
              const TitleLabel(
                titleText: "좌우명",
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                hintText: "좌우명을 입력해주세요.",
              ),
              const TitleLabel(
                titleText: "블로그 주소",
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextField(
                hintText: "블로그 주소를 입력해주세요.",
              ),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "저장",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    print("저장 버튼을 눌렀습니다!");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
