class User{
  final int id;
  final String name;
  final String email;
  final String emailVifiedAt;

  User(this.id, this.name, this.email, this.emailVifiedAt);

  static List<User> jsonDecode(List<dynamic> jsonList) {
    return (jsonList as List).map((i) => User.fromJson(i)).toList();
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    json["id"],
    json["name"],
    json["email"],
    json["email_verified_at"],
  );
}