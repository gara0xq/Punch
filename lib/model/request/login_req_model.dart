class LoginReqModel {
  String username;
  String password;

  LoginReqModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
