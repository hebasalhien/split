
import 'package:flutter/material.dart';

class ExpenseBreakdownPage extends StatelessWidget {
  final double amount;
  final List<String> participants;
  final List<double> percentages;

  const ExpenseBreakdownPage({super.key,
    required this.amount,
    required this.participants,
    required this.percentages,
  });

  @override
  Widget build(BuildContext context) {
    List<String> breakdown = [];
    for (int i = 0; i < participants.length; i++) {
      double share = (amount * (percentages[i] / 100)).toDouble();
      breakdown.add('${participants[i]} owes \$${share.toStringAsFixed(2)}');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Breakdown',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...breakdown.map((text) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            )),
            const Divider(),
            Text(
              'Total: \$${amount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
