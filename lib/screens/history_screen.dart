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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              SizedBox(height: 40),
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
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 150,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: blue,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Intcome",
                              fontSize: 18,
                            ),
                            Image.asset('assets/icons/inArrow.png', scale: 13),
                          ],
                        ),
                        CustomText(
                          fontSize: 18,
                          text: "\$20,362",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 70,
                    width: 150,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff00A0D2),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Outcome",
                              fontSize: 18,
                            ),
                            Image.asset('assets/icons/outArrow.png', scale: 13),
                          ],
                        ),
                        CustomText(
                          fontSize: 18,
                          text: "\$6,830",
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, i) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 10)
                          ]),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        subtitle: Text("hello"),
                        title: Text("hello"),
                        trailing: Image.asset(
                          'assets/icons/inArrow.png',
                          scale: 13,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
