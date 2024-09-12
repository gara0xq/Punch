import 'package:flutter/material.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/card_box.dart';
import 'package:punch/widgets/fast_action_button.dart';
import 'package:punch/widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double box_dimantion = width / 3 - 40;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset("assets/images/main_bg.png"),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 70),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway",
                      ),
                    ),
                    Text(
                      'EGP 5,200',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 16, 16, 237),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.remove_red_eye_outlined, size: 20),
                        SizedBox(width: 5),
                        Text(
                          'Current Balance',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FastActionButton(
                      color: Color(0xFF4C52EE),
                      title: "My Cards",
                      image: "assets/icons/add.png",
                    ),
                    FastActionButton(
                      color: Color(0xff20748C),
                      title: "My Cards",
                      image: "assets/icons/transaction.png",
                    ),
                    FastActionButton(
                      color: Colors.white,
                      title: "My Cards",
                      image: "assets/icons/bill.png",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 7, spreadRadius: -1),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Cards",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Raleway",
                            ),
                          ),
                          Text(
                            "See More >",
                            style: TextStyle(
                              color: Color(0xFF1B8CB0),
                              fontSize: 14,
                              fontFamily: "Raleway",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardBox(
                            box_dimantion: box_dimantion,
                            gradiant_color: const Color(0xFFFF088C),
                            alignment: Alignment.bottomLeft,
                            card_name: "S-Card",
                            image: "assets/icons/visa.png",
                            card_num: "****4754",
                          ),
                          CardBox(
                            box_dimantion: box_dimantion,
                            gradiant_color: const Color(0xFFA31CFF),
                            alignment: Alignment.topRight,
                            card_name: "M-Card",
                            image: "assets/icons/masterCard.png",
                            card_num: "****8988 ",
                          ),
                          CardBox(
                            box_dimantion: box_dimantion,
                            gradiant_color: const Color(0xFF1ABAE4),
                            alignment: Alignment.centerRight,
                            card_name: "X-Card",
                            image: "assets/icons/visa.png",
                            card_num: "****6319",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 7, spreadRadius: -1),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transactions",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Raleway",
                            ),
                          ),
                          Text(
                            "See More >",
                            style: TextStyle(
                              color: Color(0xFF1B8CB0),
                              fontSize: 14,
                              fontFamily: "Raleway",
                            ),
                          ),
                        ],
                      ),
                      TransactionItem(
                        icon: Icon(Icons.discord),
                        title: 'Discord',
                        status: 'Failed',
                        amount: 'USD 20.00',
                        date: 'November 25, 2023',
                        backgroundColor: Colors.purple[100]!,
                      ),
                      TransactionItem(
                        icon: Icon(Icons.email),
                        title: 'Gmail',
                        status: 'Completed',
                        amount: 'USD 86.00',
                        date: 'October 18, 2023',
                        backgroundColor: Colors.purple[100]!,
                      ),
                      TransactionItem(
                        icon: Icon(Icons.facebook),
                        title: 'Facebook',
                        status: 'Completed',
                        amount: 'EGP 3500.00',
                        date: 'April 21, 2023',
                        backgroundColor: Colors.purple[100]!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Apps",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
