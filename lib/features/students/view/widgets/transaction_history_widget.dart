import 'package:flutter/material.dart';

class TransactionHistoryWidget extends StatelessWidget {
  final bool transaction;
  final int amount;
  const TransactionHistoryWidget(
      {super.key, required this.transaction, required this.amount});

  @override
  Widget build(BuildContext context) {
    String type = 'Deposited';
    String money = "-$amount";
    Color color = const Color.fromRGBO(184, 0, 0, 1);

    if (transaction) {
      type = 'Withdrawel';
      money = "+$amount";
      color = const Color.fromRGBO(0, 187, 12, 1);
    }

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(type,
                style: const TextStyle(
                  fontSize: 24,
                )),
            const Expanded(child: SizedBox()),
            Column(
              children: [
                Text(money,
                    style: TextStyle(
                        color: color,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "10/10/2024",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
