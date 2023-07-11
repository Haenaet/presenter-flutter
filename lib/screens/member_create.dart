import 'package:flutter/material.dart';

import 'package:presenter/widgets/member_create_widget.dart';

class MemberCreatePage extends StatelessWidget {
  MemberCreatePage({super.key});

  TextEditingController contentController = TextEditingController();

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
              showDeleteDialog(context);
            },
          ),
          TextButton(
            onPressed: () {
              print("완료 버튼을 클릭했습니다.");
            },
            child: Text(
              "완료",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropDownWidget(),
              SizedBox(
                height: 20,
              ),
              TitleLabel(
                titleText: "이름",
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                hintText: "이름을 입력해주세요.",
                maxLength: 4,
              ),
              TitleLabel(
                titleText: "해시 태그",
              ),
              SizedBox(
                height: 8,
              ),
              Row(
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
              SizedBox(
                height: 20,
              ),
              TitleLabel(
                titleText: "나의 스타일",
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                hintText: "나의 스타일을 입력해주세요.",
                maxLength: 200,
                maxLines: 4,
              ),
              TitleLabel(
                titleText: "좌우명",
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                hintText: "좌우명을 입력해주세요.",
              ),
              TitleLabel(
                titleText: "블로그 주소",
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextField(
                hintText: "블로그 주소를 입력해주세요.",
              ),
              Center(
                child: SaveButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
