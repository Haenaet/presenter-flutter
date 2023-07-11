import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MemberDetailPage extends StatefulWidget {
  const MemberDetailPage({Key? key});

  @override
  State<MemberDetailPage> createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  @override
  void initState() {
    super.initState();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => MemberDetailCardPage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    List<String> animal = ['# 귀여움', '# 요다', '# 스타워즈'];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('상세 페이지'),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            print('뒤로 가기');
          },
          icon: Icon(
            Icons.navigate_before,
            size: 40,
          ),
        ),
        actions: [
          Icon(
            Icons.update_rounded,
            size: 30,
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
                      'Yoda',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 620,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 0, 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://iglootoy.com/web/product/big/202112/a5627ce1ef1612190c6f7d9b10ffaf1e.jpg',
                    height: 160,
                    width: 160,
                  ),
                ),
              ),
              SizedBox(
                //??? ... 물어볼 것.
                width: 240, // ????
                height: 200, // ?????
                child: Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      String animals = animal[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 28, top: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 14,
                                ),
                                child: Text(
                                  animals,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 12,
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
                      width: 160,
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '간단한 자기소개',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    width: 140,
                                    height: 120,
                                    child: Text(
                                      '안녕하세요 나는 ???입니다. 여름이라 많이 덥네요~.~',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      width: 160,
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '좌우명',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    width: 140,
                                    height: 120,
                                    child: Text(
                                      '안녕하세요 나는 ???입니다 열심히 하겠습니다!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: IconButton(
                          onPressed: () {
                            try {
                              launchUrl(Uri.parse(
                                  'https://github.com/Haenaet/presenter-flutter'));
                            } catch (e) {
                              print('error!');
                            }
                          },
                          icon: Icon(
                            Icons.web_rounded,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          try {
                            launchUrl(Uri.parse(
                                'https://github.com/Haenaet/presenter-flutter'));
                          } catch (e) {
                            print('error!');
                          }
                        },
                        child: Container(
                          width: 240,
                          child: Text(
                            'https://github.com/Haenaet/presenter-flutter',
                            style: TextStyle(
                              overflow: TextOverflow.clip,
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
