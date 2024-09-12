import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:punch/widgets/apps_box.dart';
import 'package:easy_localization/easy_localization.dart';

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
                      title: "transfer".tr(),
                      onPressed: () {
                        Get.toNamed('/transfer_request');
                      },
                    ),
                    AppsBox(
                      image: 'assets/icons/add.png',
                      scale: 0.6,
                      title: "add_money".tr(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppsBox(
                      image: 'assets/icons/list.png',
                      scale: 1.5,
                      title: "transactions".tr(),
                      onPressed: () {
                        Get.toNamed('/history');
                      },
                    ),
                    AppsBox(
                      image: 'assets/icons/bills.png',
                      scale: 1.3,
                      title: "pay_bills".tr(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppsBox(
                      image: 'assets/icons/mycards.png',
                      scale: 1.2,
                      title: "my_cards".tr(),
                    ),
                    AppsBox(
                      image: 'assets/icons/offers.png',
                      scale: 1.2,
                      title: "offers".tr(),
                      
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
