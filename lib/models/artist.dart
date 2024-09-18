class Artist {
  String name, icon, cover, id;
  String? groupId;

  List<Artist?> members;

  Artist({
    required this.name,
    required this.icon,
    required this.cover,
    required this.id,
    this.groupId,
    this.members = const [],
  });
}
