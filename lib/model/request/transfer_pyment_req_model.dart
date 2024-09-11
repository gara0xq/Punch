class TransferPaymentReqModel {
  String receiverAccountNumber, senderAccountNumber, paymentType;
  DateTime paymentDate;
  int paymentAmount;

  TransferPaymentReqModel({
    required this.receiverAccountNumber,
    required this.senderAccountNumber,
    required this.paymentDate,
    required this.paymentAmount,
    this.paymentType = "test",
  });

  factory TransferPaymentReqModel.fromJson(Map<String, dynamic> json) =>
      TransferPaymentReqModel(
        receiverAccountNumber: json["receiverAccountNumber"],
        senderAccountNumber: json["senderAccountNumber"],
        paymentDate: DateTime.parse(json["paymentDate"]),
        paymentAmount: json["paymentAmount"],
        paymentType: json["paymentType"],
      );

  Map<String, dynamic> toJson() => {
        "receiverAccountNumber": receiverAccountNumber,
        "senderAccountNumber": senderAccountNumber,
        "paymentDate": paymentDate.toString(),
        "paymentAmount": paymentAmount,
        "paymentType": paymentType,
      };
}
