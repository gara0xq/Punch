class SignupResModel {
  bool success;
  Data data;

  SignupResModel({
    required this.success,
    required this.data,
  });

  factory SignupResModel.fromJson(Map<String, dynamic> json) => SignupResModel(
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
  String balance;

  Data({
    required this.userAccountId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.language,
    required this.balance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userAccountId: json["userAccountID"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        language: json["language"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "userAccountID": userAccountId,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "language": language,
        "balance": balance,
      };
}
