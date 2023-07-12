import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MemberDetailCardPage extends StatefulWidget {
  const MemberDetailCardPage({Key? key}) : super(key: key);

  @override
  _MemberDetailCardPageState createState() => _MemberDetailCardPageState();
}

class _MemberDetailCardPageState extends State<MemberDetailCardPage> {
  @override
  Widget build(BuildContext context) {
    List<String> animal = ['# 귀여움', '# 요다', '# 스타워즈']; //dummy 데이터

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('상세 페이지'),
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            print('뒤로 가기');
            /* 경우 1)
            int count = 0;
             Navigator.of(context).popUntil((_) => count++ >= 2);
             이전 페이지는 MemberDetailPage이므로 팀페이지로 돌아갈려면 팝 2번 소요.
             */
            /* 경우 2)
            NavigatorState nav = Navigator.of(context);
            nav.pop();
            nav.pop(); 이전페이지 이동*/
          },
          icon: Icon(
            Icons.navigate_before,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //수정페이지 이동.
              //Navigator.push(context, MaterialPageRoute(builder: (context) => 수정페이지() ));
            },
            icon: Icon(
              Icons.update_rounded,
              size: 28,
            ),
          ),
        ],
      ),
      body: Stack(
        // 주의
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
                      'Yoda', //이름
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
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
                  height: 600,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 0, 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    //자신의 이미지 바꾸는 곳
                    // -> Image.asset(뉴진스 캐릭터);
                    'https://iglootoy.com/web/product/big/202112/a5627ce1ef1612190c6f7d9b10ffaf1e.jpg',
                    height: 160,
                    width: 160,
                  ),
                ),
              ),
              ...animal.map((e) {
                //해시태그 부분 -> animal 이 부분을 수정해야 함. 해시태그 데이터 넣는 곳
                return Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
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
                            Text(
                              '자기소개',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                width: 150,
                                height: 130,
                                child: Text(
                                  //자기소개 데이터 넣는 곳
                                  '안녕하세요 나는 ???입니다.', //80자 정도 가능!
                                  style: TextStyle(
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
                            Text(
                              '좌우명',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                width: 150,
                                height: 130,
                                child: Text(
                                  //좌우명 데이터 넣는 곳
                                  '안녕하세요 나는 ???입니다 열심히 하겠습니다!',
                                  style: TextStyle(
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
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          try {
                            //자신의 블로그 주소
                            launchUrl(Uri.parse(
                                'https://github.com/Haenaet/presenter-flutter'));
                          } catch (e) {
                            print('error!');
                          }
                        },
                        icon: Icon(
                          Icons.web_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          try {
                            //자신의 블로그 주소
                            launchUrl(Uri.parse(
                                'https://github.com/Haenaet/presenter-flutter'));
                          } catch (e) {
                            print('error!');
                          }
                        },
                        child: Container(
                          width: 230,
                          child: Text(
                            //블로그 주소 데이터 넣는 곳.
                            'https://github.com/Haenaet/presenter-flutter',
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              fontSize: 15,
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
