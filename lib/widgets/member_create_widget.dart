import 'package:flutter/material.dart';

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("삭제하시겠습니까?"),
        actions: [
          // 취소 버튼
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 팝업 닫기
            },
            child: Text(
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
            child: Text(
              "확인",
            ),
          ),
        ],
      );
    },
  );
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String _selectedEmoji = '😀';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedEmoji,
      decoration: const InputDecoration(
        labelText: '이모지',
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3, // 테두리 사이즈
            color: Colors.white, // 테두리 색깔
          ),
        ),
        // 텍스트 필드를 눌렀을 때 아래 테두리 설정
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.white,
          ),
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: '😀',
          child: Text('😄'),
        ),
        DropdownMenuItem(
          value: '😄',
          child: Text('😄'),
        ),
        DropdownMenuItem(
          value: '😊',
          child: Text('😊'),
        ),
        DropdownMenuItem(
          value: '😎',
          child: Text('😎'),
        ),
        DropdownMenuItem(
          value: '🙂',
          child: Text('🙂'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _selectedEmoji = value!;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '이모지를 선택해주세요.';
        }
        return null;
      },
    );
  }
}

class TitleLabel extends StatelessWidget {
  const TitleLabel({
    super.key,
    required this.titleText,
  });

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
    super.key,
    required this.hintText,
    this.maxLength,
    this.maxLines,
  });

  final String hintText;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength ?? 34, // 텍스트 최대 길이
      maxLines: maxLines ?? 1, // 텍스트 최대 줄
      cursorColor: Colors.black, // 텍스트 필드 입력 시 커서 색깔
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
          borderSide: BorderSide(width: 3, color: Colors.pink),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}

class HashTagContainer extends StatelessWidget {
  const HashTagContainer({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 3 - 20,
      height: 40,
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefix: const Text(
            "# ",
            style: TextStyle(color: Colors.black),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
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

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 40,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(color: Colors.pink),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.pink),
        ),
        child: const Text(
          "저장",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          print("저장 버튼을 눌렀습니다!");
        },
      ),
    );
  }
}
