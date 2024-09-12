class SignupModel {
  final String username;
  final String password;
  final String lastname;
  final String firstname;
  final String email;
  final String language = "en";
  SignupModel({
    required this.username,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.email,
  });
  Map<String, dynamic> tojson() {
    return {
      "username": username,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "language": language
    };
  }
}
