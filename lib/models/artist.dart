class Artist {
  String name, icon, cover, id;

  List<Artist?> members;

  Artist({
    required this.name,
    required this.icon,
    required this.cover,
    required this.id,
    this.members = const [],
  });
}
