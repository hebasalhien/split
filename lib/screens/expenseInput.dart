
import 'package:flutter/material.dart';
import 'package:split/screens/breakDowns.dart';

class ExpenseInputPage extends StatefulWidget {
  const ExpenseInputPage({super.key});

  @override
  _ExpenseInputPageState createState() => _ExpenseInputPageState();
}

class _ExpenseInputPageState extends State<ExpenseInputPage> {
  final TextEditingController amountController = TextEditingController();
  final List<TextEditingController> participantControllers = [];
  final List<TextEditingController> percentageControllers = [];

  void addParticipantField() {
    setState(() {
      participantControllers.add(TextEditingController());
      percentageControllers.add(TextEditingController());
    });
  }

  void navigateToBreakdownPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpenseBreakdownPage(
          amount: double.tryParse(amountController.text) ?? 0,
          participants: participantControllers
              .map((controller) => controller.text)
              .toList(),
          percentages: percentageControllers
              .map((controller) => double.tryParse(controller.text) ?? 0)
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Input',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Total Amount',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...List.generate(participantControllers.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(

                          controller: participantControllers[index],
                          decoration: const InputDecoration(
                            labelText: 'Participant Name',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: percentageControllers[index],
                          decoration: const InputDecoration(
                            labelText: 'Percentage (%)',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 12,)
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: addParticipantField,
                    child: const Text('Add Participant',style: TextStyle(color: Colors.white),),
                  ),
                  ElevatedButton(
                    onPressed: navigateToBreakdownPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text('Confirm',style: TextStyle(color:Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
