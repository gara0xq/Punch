class Loginmodel {
  final String username;
  final String password;
  Loginmodel({required this.username, required this.password});
  Map<String, dynamic> tojson() {
    return {"username": username, "password": password};
  }
}
