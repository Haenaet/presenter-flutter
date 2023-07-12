import 'package:flutter/material.dart';
import 'package:presenter/configs/palette.dart';

class TeamIntroWidget extends StatelessWidget {
  const TeamIntroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Palette 클래스에 있는 primaryColor 사용 예시
      backgroundColor: Palette.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "👥 팀의 키워드",
                  style: TextStyle(
                    // TODO: Palette 클래스에 있는 onPrimaryColor 사용 예시
                    color: Palette.onPrimaryColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "#화목",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      width: 70.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Text(
                          "#열정",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "#도전",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const TeamContents(
              title: "🤙 우리의 약속",
              one: "1. 우리 모두 평등한 발언권을 가지도록 노력해요.",
              two: "2. 모든 팀원의 바람을 들어주고 존중하도록 해요.",
              three: "3. 침묵은 금물! 리액션을 잘 해주도록 해요.",
              four: "4. 서로 간 예의, 매너를 지키도록 해요.",
              five: "5. 죄송합니다, 아!, 어? 사용은 자제하도록 해요.",
            ),
            const SizedBox(height: 30.0),
            const TeamContents(
              title: "🎉 팀의 목표",
              one: "1. 완성하는 날까지 싸우지 말고 사이좋게 지내자!",
              two: "2. 팀의 이름처럼 꼭 프로젝트를 완성 해내자!",
              three: "3. 팀원 모두에게 좋은 프로젝트가 되도록하자!",
            ),
          ],
        ),
      ),
    );
  }
}

class TeamContents extends StatelessWidget {
  const TeamContents({
    Key? key,
    this.title,
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
  }) : super(key: key);

  final String? title;
  final String? one;
  final String? two;
  final String? three;
  final String? four;
  final String? five;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Palette.tertiaryColor,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$one",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  "$two",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 4.0),
                three != null
                    ? Text(
                        "$three",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 4.0),
                four != null
                    ? Text(
                        "$four",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 4.0),
                five != null
                    ? Text(
                        "$five",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
