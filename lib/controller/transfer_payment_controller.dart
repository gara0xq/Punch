import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:punch/model/request/transfer_pyment_req_model.dart';
import 'package:punch/model/response/transfer_pyment_res_model.dart';

class TransferPaymentController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  Future<TransferPaymentResModel> transferData(
      TransferPaymentReqModel model) async {
    _loading.value = false;
    final response = await http.post(
      Uri.parse(
          'https://ptechapp-5ab6d15ba23c.herokuapp.com/payments/transfer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(model.toJson()),
    );
    log("that is 1" + jsonEncode(model.toJson()));
    log("that is 2" + response.body);

    if (response.statusCode == 200) {
      _loading.value = true;
      return TransferPaymentResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to transfer data.');
    }
  }
}
