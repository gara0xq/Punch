import 'package:flutter/material.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/sub_screens_background.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SubScreensBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      text: "History",
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          text: "Date",
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/calender.png",
                              scale: 8,
                            ),
                            SizedBox(width: 5),
                            CustomText(
                              text: "May",
                              color: Colors.black,
                              fontSize: 18,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 100,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                              text: "Date",
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/calender.png",
                                  scale: 8,
                                ),
                                SizedBox(width: 5),
                                CustomText(
                                  text: "May",
                                  color: Colors.black,
                                  fontSize: 18,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 70,
                        width: 100,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                              text: "Date",
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/calender.png",
                                  scale: 8,
                                ),
                                SizedBox(width: 5),
                                CustomText(
                                  text: "May",
                                  color: Colors.black,
                                  fontSize: 18,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
