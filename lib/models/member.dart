/// - [Member]클래스는 멤버의 정보를 가질 수 있습니다.
/// - 포함 정보는 [name], [characterImagePath], [hashtags], [introduction], [motto], [blogAddress]입니다.
class Member {
  final String name;
  final String characterImagePath;
  final List<String> hashtags;
  final String introduction;
  final String motto;
  final String blogAddress;

  Member({
    required this.name,
    required this.characterImagePath,
    required this.hashtags,
    required this.introduction,
    required this.motto,
    required this.blogAddress,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      name: json["name"],
      hashtags: List<String>.from(json["hashtags"]),
      introduction: json["introduction"],
      motto: json["motto"],
      blogAddress: json["blogAddress"],
      characterImagePath: json["characterImagePath"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "hashtags": hashtags,
      "introduction": introduction,
      "motto": motto,
      "blogAddress": blogAddress,
      "characterImagePath": characterImagePath,
    };
  }
}
