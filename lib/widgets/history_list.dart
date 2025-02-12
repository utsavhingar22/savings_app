import 'package:flutter/material.dart';
import '../models/savings_model.dart';

class HistoryList extends StatelessWidget {
  final List<SavingsModel> savingsHistory;

  HistoryList({required this.savingsHistory});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savingsHistory.length,
      itemBuilder: (context, index) {
        final savings = savingsHistory[index];
        return ListTile(
          title: Text('Year: ${savings.year}'),
          subtitle: Text('Saved: \$${(savings.compA + savings.compB).toStringAsFixed(2)}, Withdrawn: \$${savings.withdrawn.toStringAsFixed(2)}'),
        );
      },
    );
  }
}
