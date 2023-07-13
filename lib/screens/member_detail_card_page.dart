import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:presenter/screens/edit_member_screen.dart';
import 'package:presenter/configs/palette.dart';
import 'package:presenter/widgets/devjeans_image.dart';

class MemberDetailCardPage extends StatefulWidget {
  const MemberDetailCardPage({
    Key? key,
    required this.randomColor,
    required this.characterImagePath,
    required this.name,
    required this.hashtags,
    required this.introduction,
    required this.motto,
    required this.blogAddress,
  }) : super(key: key);

  final Color randomColor;
  final String characterImagePath;
  final String name;
  final List<String> hashtags;
  final String introduction;
  final String motto;
  final String blogAddress;

  @override
  State<MemberDetailCardPage> createState() => _MemberDetailCardPageState();
}

class _MemberDetailCardPageState extends State<MemberDetailCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        title: const Text("팀원 정보"),
        backgroundColor: Palette.primaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            NavigatorState nav = Navigator.of(context);
            nav.pop();
          },
          icon: const Icon(
            Icons.expand_more_rounded,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditMemberScreen(
                    name: widget.name,
                    hashtags: [
                      widget.hashtags[0],
                      widget.hashtags[1],
                      widget.hashtags[2],
                    ],
                    introduction: widget.introduction,
                    motto: widget.motto,
                    blogAddress: widget.blogAddress,
                    characterImagePath: widget.characterImagePath,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, right: 16),
                    child: Text(
                      widget.name, //이름
                      style: TextStyle(
                        color: widget.randomColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: widget.randomColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DevJeansImage(imagePath: widget.characterImagePath),
              Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 8),
                child: Wrap(
                  spacing: 8,

                  /// 해시태그 아이템을 하나씩 가져옵니다.
                  children: widget.hashtags.map((e) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "#$e",
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w700,
                            color: widget.randomColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      width: 170,
                      height: 170,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "자기소개 한마디",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SizedBox(
                                width: 150,
                                height: 130,
                                child: Text(
                                  //자기소개 데이터 넣는 곳
                                  widget.introduction, //80자 정도 가능!
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      width: 170,
                      height: 170,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "좌우명",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SizedBox(
                                width: 150,
                                height: 130,
                                child: Text(
                                  //좌우명 데이터 넣는 곳
                                  widget.motto,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15, //80자 정도 가능!
                                  ),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.randomColor,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          try {
                            //자신의 블로그 주소
                            launchUrl(
                              Uri.parse(
                                widget.blogAddress,
                              ),
                            );
                          } catch (e) {
                            debugPrint("에러가 발생했어요: $e");
                          }
                        },
                        icon: const Icon(
                          Icons.link_rounded,
                          color: Palette.onPrimaryColor,
                          size: 30,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          try {
                            //자신의 블로그 주소
                            launchUrl(
                              Uri.parse(widget.blogAddress),
                            );
                          } catch (e) {
                            debugPrint("에러가 발생했어요: $e");
                          }
                        },
                        child: SizedBox(
                          width: 260,
                          child: Text(
                            //블로그 주소 데이터 넣는 곳.
                            widget.blogAddress,
                            style: const TextStyle(
                              overflow: TextOverflow.clip,
                              fontSize: 18,
                              color: Palette.onPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
