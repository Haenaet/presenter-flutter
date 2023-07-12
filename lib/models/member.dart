import 'package:flutter/material.dart';

class Member {

  Member({required this.name,
          required this.hashTag,
          required this.introduce,
          required this.motto, 
          required this.blogAddress
});

  final String name;
  final List<String> hashTag;
  final String introduce;
  final String motto;
  dynamic blogAddress;
}

class MemberService extends ChangeNotifier {

  List<Map<String, dynamic>> memberList = [
    { 'name' : 'Jin mirae' ,
      'hashTag' : ['# entj','# 요다','#스타워즈'] ,
      'introduce' : '안녕하세요 나는 ???입니다.' ,
      'motto' : '열심히 하겠습니다.' ,
      'blogAddress' : 'https://github.com/Haenaet/presenter-flutter' ,
    },
    { 'name' : 'Kim yujin' ,
      'hashTag' : ['# entj','# 요다','#스타워즈'] ,
      'introduce' : '안녕하세요 나는 ???입니다.' ,
      'motto' : '열심히 하겠습니다.' ,
      'blogAddress' : 'https://github.com/Haenaet/presenter-flutter' ,
    },
    { 'name' : 'Lee seryeong' ,
      'hashTag' : ['# entj','# 요다','#스타워즈'] ,
      'introduce' : '안녕하세요 나는 ???입니다.' ,
      'motto' : '열심히 하겠습니다.' ,
      'blogAddress' : 'https://github.com/Haenaet/presenter-flutter' ,
    },
    { 'name' : 'Choi hongsik' ,
      'hashTag' : ['# entj','# 요다','#스타워즈'] ,
      'introduce' : '안녕하세요 나는 ???입니다.' ,
      'motto' : '열심히 하겠습니다.' ,
      'blogAddress' : 'https://github.com/Haenaet/presenter-flutter' ,
    },
    { 'name' : 'Park seongwon' ,
      'hashTag' : ['# entj','# 요다','#스타워즈'] ,
      'introduce' : '안녕하세요 나는 ???입니다.' ,
      'motto' : '열심히 하겠습니다.' ,
      'blogAddress' : 'https://github.com/Haenaet/presenter-flutter' ,
    },
  ];



  
}