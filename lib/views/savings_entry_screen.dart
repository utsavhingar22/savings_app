import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/savings_model.dart';
import '../providers/savings_provider.dart';

class SavingsEntryScreen extends ConsumerWidget {
  const SavingsEntryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Enter Savings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Annual Savings'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final savingsAmount = double.tryParse(_controller.text) ?? 0;
                ref.read(savingsProvider.notifier).addSavings(savingsAmount); // Pass only the amount
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
