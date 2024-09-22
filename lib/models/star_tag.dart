class Tag {
  final String id;
  final String label;
  final String cover;

  Tag({required this.id, required this.label, required this.cover});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      label: json['label'],
      cover: json['cover'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': label,
      'cover': cover,
    };
  }
}
