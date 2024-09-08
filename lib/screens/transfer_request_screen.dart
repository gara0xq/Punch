import 'package:flutter/material.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/controller/entry_controller.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/input_form_field.dart';
import 'package:punch/widgets/sub_screens_background.dart';

class TransferRequestScreen extends StatelessWidget {
  GlobalKey<FormState> transfeAmountState = GlobalKey();
  GlobalKey<FormState> requestAccountState = GlobalKey();
  AuthController _authController = AuthController();
  EntryController _entryController = EntryController();

  TransferRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SubScreensBackground(
        child: Padding(
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
                    text: "\$285,856.20",
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                                color: Colors.grey.shade600, width: 1),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: CustomText(
                                //change 00000ext to _entryController.getUser().toString()
                                text: "00000",
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                        InputFormField(
                            formKey: transfeAmountState,
                            validator: (value) =>
                                _authController.numberValidation(value!),
                            labelText: "Amount of Transfer Request"),
                        InputFormField(
                          formKey: requestAccountState,
                          validator: (value) =>
                              _authController.numberValidation(value!),
                          labelText: "Requestee’s Account No.",
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(25),
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
        ),
      ),
    );
  }
}
