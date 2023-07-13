import 'package:flutter/material.dart';

/// -[DevJeansImage] 클래스는 개발진스에서 만들어진 이미지를 표시합니다.
/// -개발진스 이미지는 미리 커스터마이징화 되어있는 이미지입니다.
class DevJeansImage extends StatelessWidget {
  const DevJeansImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  /// -[imagePath]는 이미지의 경로를 나타냅니다.
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 170.0,
      height: 170.0,
      fit: BoxFit.cover,
    );
  }
}
