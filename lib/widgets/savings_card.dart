import 'package:flutter/material.dart';

class SavingsCard extends StatelessWidget {
  final double compA;
  final double compB;

  const SavingsCard({super.key, required this.compA, required this.compB});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('CompA: \$${compA.toStringAsFixed(2)}'),
            Text('CompB: \$${compB.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}