class UserPaymentModel {
  String paymentId;
  String receiverAccountNumber;
  String senderAccountNumber;
  String paymentAmount;
  DateTime paymentDate;
  String paymentType;

  UserPaymentModel({
    required this.paymentId,
    required this.receiverAccountNumber,
    required this.senderAccountNumber,
    required this.paymentAmount,
    required this.paymentDate,
    required this.paymentType,
  });

  factory UserPaymentModel.fromJson(Map<String, dynamic> json) =>
      UserPaymentModel(
        paymentId: json["paymentID"],
        receiverAccountNumber: json["receiverAccountNumber"],
        senderAccountNumber: json["senderAccountNumber"],
        paymentAmount: json["paymentAmount"],
        paymentDate: DateTime.parse(json["paymentDate"]),
        paymentType: json["paymentType"],
      );
}
