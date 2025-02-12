import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/savings_provider.dart';

class WithdrawalScreen extends ConsumerStatefulWidget {
  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends ConsumerState<WithdrawalScreen> {
  final TextEditingController _controller = TextEditingController();
  int selectedIndex = 0;
  String selectedComponent = 'A'; // Default to CompA

  @override
  Widget build(BuildContext context) {
    final savingsList = ref.watch(savingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Withdraw Savings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<int>(
              value: selectedIndex,
              items: List.generate(
                savingsList.length,
                    (index) => DropdownMenuItem(
                  value: index,
                  child: Text('Year ${savingsList[index].year}'),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedIndex = value ?? 0;
                });
              },
            ),
            DropdownButton<String>(
              value: selectedComponent,
              items: const [
                DropdownMenuItem(value: 'A', child: Text('Withdraw from CompA')),
                DropdownMenuItem(value: 'B', child: Text('Withdraw from CompB')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedComponent = value ?? 'A';
                });
              },
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Withdrawal Amount'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final amount = double.tryParse(_controller.text) ?? 0;
                ref.read(savingsProvider.notifier).withdraw(selectedIndex, amount, selectedComponent as String);
                Navigator.pop(context);
              },
              child: const Text('Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
