/// - [Member]클래스는 멤버의 정보를 가질 수 있습니다.
/// - 포함 정보는 [name], [hashtags], [introduction], [motto], [blogAddress]입니다.
class Member {
  final String name;
  final String characterImage;
  final List<String> hashtags;
  final String introduction;
  final String motto;
  final String blogAddress;

  Member({
    required this.name,
    required this.characterImage,
    required this.hashtags,
    required this.introduction,
    required this.motto,
    required this.blogAddress,
  });
}
