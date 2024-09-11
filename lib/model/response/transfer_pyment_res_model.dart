
class TransferPaymentResModel {
    bool success;
    Data data;

    TransferPaymentResModel({
        required this.success,
        required this.data,
    });

    factory TransferPaymentResModel.fromJson(Map<String, dynamic> json) => TransferPaymentResModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    String paymentId;
    String receiverAccountNumber;
    String senderAccountNumber;
    String paymentAmount;
    DateTime paymentDate;
    String paymentType;

    Data({
        required this.paymentId,
        required this.receiverAccountNumber,
        required this.senderAccountNumber,
        required this.paymentAmount,
        required this.paymentDate,
        required this.paymentType,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentId: json["paymentID"],
        receiverAccountNumber: json["receiverAccountNumber"],
        senderAccountNumber: json["senderAccountNumber"],
        paymentAmount: json["paymentAmount"],
        paymentDate: DateTime.parse(json["paymentDate"]),
        paymentType: json["paymentType"],
    );

    Map<String, dynamic> toJson() => {
        "paymentID": paymentId,
        "receiverAccountNumber": receiverAccountNumber,
        "senderAccountNumber": senderAccountNumber,
        "paymentAmount": paymentAmount,
        "paymentDate": paymentDate.toIso8601String(),
        "paymentType": paymentType,
    };
}
