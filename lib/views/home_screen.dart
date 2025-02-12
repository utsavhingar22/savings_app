import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savings/views/savings_entry_screen.dart';
import 'package:savings/views/withdrawal_screen.dart';
import '../providers/savings_provider.dart';
import 'history_screen.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingsList = ref.watch(savingsProvider);

    double totalCompA = savingsList.fold(0, (sum, item) => sum + item.compA);
    double totalCompB = savingsList.fold(0, (sum, item) => sum + item.compB);

    return Scaffold(
      appBar: AppBar(title: const Text('Savings App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _animatedBalanceCard('CompA Balance', totalCompA),
          _animatedBalanceCard('CompB Balance', totalCompB),
          const SizedBox(height: 20),
          _buildActionButton(context, 'Add Savings', const SavingsEntryScreen()),
          _buildActionButton(context, 'Withdraw', WithdrawalScreen()),
          _buildActionButton(context, 'View History', HistoryScreen()),
        ],
      ),
    );
  }

  /// Animated Balance Card
  Widget _animatedBalanceCard(String title, double balance) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('\$${balance.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  /// Reusable Action Button
  Widget _buildActionButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        child: Text(text),
      ),
    );
  }
}
