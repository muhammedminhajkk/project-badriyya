import 'package:flutter/material.dart';

class ExamResultWidget extends StatelessWidget {
  const ExamResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          width: 400,
          color: Colors.amber,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 200,
            width: 400,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
