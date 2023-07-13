import 'package:flutter/material.dart';

import 'package:presenter/configs/palette.dart';

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("삭제하시겠습니까?"),
        actions: [
          // 취소 버튼
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 팝업 닫기
            },
            child: const Text(
              "취소",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          // 확인 버튼
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 팝업 닫기
            },
            child: const Text(
              "확인",
            ),
          ),
        ],
      );
    },
  );
}

class TitleLabel extends StatelessWidget {
  const TitleLabel({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.maxLength,
    this.maxLines,
    this.enabled,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled ?? true,
      controller: controller,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Palette.onPrimaryColor,
      ),
      maxLength: maxLength ?? 34, // 텍스트 최대 길이
      maxLines: maxLines ?? 1, // 텍스트 최대 줄
      cursorColor: Palette.spartaColor, // 텍스트 필드 입력 시 커서 색깔
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.tertiaryColor,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(width: 3, color: Palette.spartaColor),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}

class HashTagContainer extends StatelessWidget {
  const HashTagContainer({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 20,
      height: 45.0,
      decoration: BoxDecoration(
        color: Palette.onPrimaryColor,
        border: Border.all(
          color: Palette.onPrimaryColor,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextField(
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Palette.onPrimaryColor,
        ),
        controller: controller,
        cursorColor: Palette.spartaColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Palette.tertiaryColor,
          prefix: const Text(
            "# ",
            style: TextStyle(color: Palette.onPrimaryColor),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      height: 40,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: color),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
