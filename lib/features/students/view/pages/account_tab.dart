import 'package:flutter/material.dart';
import 'package:project_badriyya/features/students/view/widgets/transaction_history_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Text(
              'Account balance:\u20B9400',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Expanded(
          flex: 10,
          child: SizedBox(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TransactionHistoryWidget(
                      transaction: index % 2 == 0, amount: index * 100 + 100);
                }),
          ),
        ),
      ],
    );
  }
}
