import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/widgets/apps_box.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset("assets/images/main_bg.png"),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppsBox(
                      image: 'assets/icons/transaction.png',
                      title: "Transfer",
                      onPressed: () {
                        Get.toNamed('/transfer_request');
                      },
                    ),
                    AppsBox(
                      image: 'assets/icons/add.png',
                      scale: 0.6,
                      title: "Add Money",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppsBox(
                      image: 'assets/icons/list.png',
                      scale: 1.5,
                      title: "Transactions",
                      onPressed: () {
                        Get.toNamed('/history');
                      },
                    ),
                    AppsBox(
                      image: 'assets/icons/bills.png',
                      scale: 1.3,
                      title: "Pay Bills",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppsBox(
                      image: 'assets/icons/mycards.png',
                      scale: 1.2,
                      title: "My Cards",
                    ),
                    AppsBox(
                      image: 'assets/icons/offers.png',
                      scale: 1.2,
                      title: "Offers",
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
