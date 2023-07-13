import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:presenter/models/member.dart';

class MemberProvider extends ChangeNotifier {
  /// [_members]는 [Member]의 리스트이고, 선언과 동시에 초기화 합니다.
  List<Member> _members = [];

  /// [members]는 [_members]의 값들을 가져옵니다.
  List<Member> get members => _members;

  MemberProvider() {
    loadMemberList();
  }

  /// - [loadMemberList]함수는 [SharedPreferences]에서 멤버 리스트를 가져옵니다.
  /// - 만약 멤버 리스트가 없다면 빈 리스트를 반환합니다.
  Future<void> loadMemberList() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final memberList = sharedPrefs.getStringList("members");

    if (memberList != null) {
      _members = memberList
          .map(
            (e) => Member.fromJson(json.decode(e)),
          )
          .toList();
    } else {
      _members = [];
    }

    notifyListeners();
  }

  Future<void> addMember(Member member) async {
    try {
      _members.add(member);
      await saveMemberToSharedPrefs();
      notifyListeners();
    } catch (e) {
      debugPrint("멤버를 추가하는데 실패했어요: $e");
      return;
    }
  }

  Future<void> updateMember(Member member) async {
    try {
      final index =
          _members.indexWhere((element) => element.name == member.name);
      _members[index] = member;
      await saveMemberToSharedPrefs();
      notifyListeners();
    } catch (e) {
      debugPrint("멤버를 수정하는데 실패했어요: $e");
      return;
    }
  }

  /// [saveMemberToSharedPrefs]함수는 [SharedPreferences]에 멤버를 저장합니다.
  Future<void> saveMemberToSharedPrefs() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final memberList = _members.map((e) => json.encode(e.toJson())).toList();

    await sharedPrefs.setStringList("members", memberList);
  }

  /// [deleteMember]함수는 [name]을 받아서 해당하는 멤버를 삭제합니다.
  Future<void> deleteMember(String name) async {
    try {
      _members.removeWhere((element) => element.name == name);
      await saveMemberToSharedPrefs();
      notifyListeners();
    } catch (e) {
      debugPrint("멤버를 삭제하는데 실패했어요: $e");
      return;
    }
  }
}
