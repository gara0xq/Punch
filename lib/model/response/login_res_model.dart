class LoginResModel {
  bool success;
  Data data;

  LoginResModel({
    required this.success,
    required this.data,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  String userAccountId;
  String username;
  String firstName;
  String lastName;
  String email;
  String language;

  Data({
    required this.userAccountId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.language,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userAccountId: json["userAccountID"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "userAccountID": userAccountId,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "language": language,
      };
}
