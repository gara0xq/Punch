import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/controller/home_controller.dart';
import 'package:punch/controller/prefs_controller.dart';
import 'package:punch/controller/transfer_payment_controller.dart';
import 'package:punch/model/request/transfer_pyment_req_model.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/input_form_field.dart';
import 'package:punch/widgets/sub_screens_background.dart';

// ignore: must_be_immutable
class TransferRequestScreen extends StatelessWidget {
  GlobalKey<FormState> transfeAmountState = GlobalKey();
  GlobalKey<FormState> requestAccountState = GlobalKey();

  TextEditingController transfeAmountController = TextEditingController();
  TextEditingController requestAccountController = TextEditingController();

  AuthController _authController = Get.put(AuthController());
  TransferPaymentController _transferPaymentController =
      Get.put(TransferPaymentController());
  PrefsController _prefsController = Get.find<PrefsController>();

  TransferRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SubScreensBackground(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return !controller.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40),
                              Center(
                                child: CustomText(
                                  text: "Transfer Request",
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 70),
                              CustomText(
                                text: "Available Balance",
                                color: Colors.grey.shade600,
                                fontSize: 18,
                              ),
                              CustomText(
                                text: controller.CurrentUserModel.balance,
                                color: blue,
                                fontSize: 35,
                              ),
                              SizedBox(height: 30),
                              CustomText(
                                text:
                                    "Pleaser enter the receiver's bank account\nnumber or phone number with the amount of\ntransfer request in below field.",
                                color: Colors.grey.shade600,
                              ),
                              SizedBox(height: 30),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                height: 380,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        border: Border.all(
                                            color: Colors.grey.shade600,
                                            width: 1),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: CustomText(
                                            text: _prefsController
                                                .getUser()
                                                .toString(),
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InputFormField(
                                      controller: transfeAmountController,
                                      formKey: transfeAmountState,
                                      validator: (value) => _authController
                                          .numberValidation(value!),
                                      labelText: "Amount of Transfer Request",
                                    ),
                                    InputFormField(
                                      controller: requestAccountController,
                                      formKey: requestAccountState,
                                      validator: (value) => _authController
                                          .numberValidation(value!),
                                      labelText: "Requestee’s Account No.",
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await _transferPaymentController
                                            .transferData(
                                          TransferPaymentReqModel(
                                            senderAccountNumber:
                                                _prefsController.getUser()!,
                                            receiverAccountNumber:
                                                requestAccountController.text,
                                            paymentDate: DateTime.now(),
                                            paymentAmount: int.parse(
                                                transfeAmountController.text),
                                          ),
                                        );
                                        if (_transferPaymentController
                                            .loading.value) {
                                          Get.toNamed("/home");
                                          Get.snackbar(
                                            "Congrates",
                                            "Transfer Done Successfully",
                                            backgroundColor: Colors.white,
                                            boxShadows: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 1,
                                                blurRadius: 10,
                                              )
                                            ],
                                          );
                                          controller.fetchCurrentUserData();
                                        } else {
                                          Get.snackbar("Error", "");
                                        }
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: blue,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: "Send",
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
