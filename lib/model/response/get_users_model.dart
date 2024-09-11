class GetUsersModel {
  String userAccountId;
  String username;
  String password;
  String firstName;
  String lastName;
  String email;
  String language;
  String balance;

  GetUsersModel({
    required this.userAccountId,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.language,
    required this.balance,
  });

  factory GetUsersModel.fromJson(Map<String, dynamic> json) => GetUsersModel(
        userAccountId: json["userAccountID"],
        username: json["username"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        language: json["language"],
        balance: json["balance"],
      );
}
