import 'dart:convert';

class User {
  int id;
  String username;
  String email;
  String token;

  User(
      {required this.id,
      required this.email,
      required this.username,
      required this.token});

  factory User.fromReqBody(String body) {
    print("Before Object Creation");
    print(body);
    Map<String, dynamic> json = jsonDecode(body);
    return User(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        token: json["access_token"]);
  }

  void printAttributes() {
    print("ID: ${this.id}\n");
    print("Email: ${this.email}\n");
    print("Username: ${this.username}\n");
    print("Token: ${this.token}\n");
  }
}
