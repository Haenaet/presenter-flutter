import 'package:flutter/material.dart';

import 'package:presenter/widgets/devjeans_image.dart';

/// -[DevJeansPicker] 클래스는 개발진스 이미지를 선택할 수 있는 위젯입니다.
/// -캐릭터 이미지는 개발진스 사이트에서 미리 커스터마이징한 이미지입니다.
class DevJeansPicker extends StatefulWidget {
  const DevJeansPicker({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  State<DevJeansPicker> createState() => _DevJeansPickerState();
}

class _DevJeansPickerState extends State<DevJeansPicker> {
  /// -[defaultDevJeans]는 현재 선택된 캐릭터 이미지를 나타냅니다.
  String defaultDevJeans = "캐릭터선택";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /// -[AnimatedSwitcher]는 화면에서 변경되는 위젯에 애니메이션을 적용할 수 있게 해줍니다.
        AnimatedSwitcher(
          /// -[duration]은 애니메이션의 지속시간을 나타냅니다.
          duration: const Duration(milliseconds: 500),

          /// -[transitionBuilder]는 애니메이션을 적용할 위젯을 지정합니다.
          transitionBuilder: (Widget child, Animation<double> animation) {
            /// -[FadeTransition]은 애니메이션을 위젯에 적용할 수 있게 해줍니다.
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: DevJeansImage(
            imagePath: getImageUrl(defaultDevJeans),
            key: ValueKey(defaultDevJeans),
          ),
        ),
        DropdownButton<String>(
          value: defaultDevJeans,
          borderRadius: BorderRadius.circular(26.0),
          elevation: 2,
          dropdownColor: const Color(0xff333333),
          style: const TextStyle(
            color: Color(0xffF5F5F5),
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
          items: const [
            DropdownMenuItem(
              value: "캐릭터선택",
              child: Text('캐릭터 선택'),
            ),
            DropdownMenuItem(
              value: '나는포기하지않아',
              child: Text('나는 포기하지 않아'),
            ),
            DropdownMenuItem(
              value: '빵찾아삼만리',
              child: Text('빵 찾아 삼만리'),
            ),
            DropdownMenuItem(
              value: '커피는내친구',
              child: Text('커피는 나의 친구'),
            ),
            DropdownMenuItem(
              value: '내가만든쿠키',
              child: Text('내가 만든 쿠키'),
            ),
            DropdownMenuItem(
              value: '콜라는제로레몬이최고야',
              child: Text('제로레몬이 최고야'),
            ),
            DropdownMenuItem(
              value: '초밥킬러',
              child: Text('나는야 초밥킬러'),
            ),
          ],
          onChanged: (String? value) {
            setState(() {
              defaultDevJeans = value!;

              /// 체인지 콜백 함수는 정의하는 구조가 매우 까다롭네요.
              widget.onChanged(value);
            });
          },
        ),

        const SizedBox(width: 22.0),
      ],
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
      case '캐릭터선택':
        return 'assets/images/대표캐릭터.png';
      case '콜라는제로레몬이최고야':
        return 'assets/images/콜라는제로레몬이최고야.png';
      case '초밥킬러':
        return 'assets/images/초밥킬러.png';
      default:
        return 'assets/images/대표캐릭터.png';
    }
  }
}
