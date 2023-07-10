import 'dart:convert';

import 'package:flutter/material.dart';

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
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              SizedBox(
                //???
                width: 240, // ????
                height: 240, // ?????
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
                          elevation: 8,
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
            ],
          ),
        ],
      ),
    );
  }
}
