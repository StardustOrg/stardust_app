class UserApp {
  final String uid;

  UserApp({
    required this.uid,
  });
}

class StarUser {
  final String uid;
  final String username;
  final String email;
  final String? icon, cover;

  StarUser({
    required this.uid,
    required this.username,
    required this.email,
    this.icon,
    this.cover,
  });
}
