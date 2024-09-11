class SignupReqModel {
  String username;
  String password;
  String firstname;
  String lastname;
  String email;
  String language;

  SignupReqModel({
    required this.username,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.language,
  });

  factory SignupReqModel.fromJson(Map<String, dynamic> json) => SignupReqModel(
        username: json["username"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "language": language,
      };
}
