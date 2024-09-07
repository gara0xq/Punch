import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final String status;
  final String amount;
  final String date;
  final Color backgroundColor;

  TransactionItem({
    required this.icon,
    required this.title,
    required this.status,
    required this.amount,
    required this.date,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Added padding
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            child: icon,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(
                    color: status == 'Completed' ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
