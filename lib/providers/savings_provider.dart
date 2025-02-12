import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/hive_service.dart';
import '../models/savings_model.dart';

final savingsProvider =
StateNotifierProvider<SavingsNotifier, List<SavingsModel>>((ref) {
  return SavingsNotifier();
});

class SavingsNotifier extends StateNotifier<List<SavingsModel>> {
  final HiveService _hiveService = HiveService();

  SavingsNotifier() : super([]) {
    loadSavings();
  }

  /// Load savings from Hive when the app starts
  void loadSavings() {
    state = _hiveService.getAllSavings();
  }

  /// Add savings with a 50-50 split into CompA and CompB
  void addSavings(double amount) {
    final newEntry = SavingsModel(
      compA: amount / 2,
      compB: amount / 2,
      year: DateTime.now().year,
      withdrawn: 0,
    );

    _hiveService.addSavings(newEntry);
    state = _hiveService.getAllSavings(); // Refresh state
  }

  /// Withdraw from either CompA or CompB
  void withdraw(int index, double amount, String component) {
    var updatedSavings = state[index];

    double newCompA = updatedSavings.compA;
    double newCompB = updatedSavings.compB;

    if (component == 'A' && newCompA >= amount) {
      newCompA -= amount;
    } else if (component == 'B' && newCompB >= amount) {
      newCompB -= amount;
    } else {
      return; // Prevents negative balance
    }

    updatedSavings = SavingsModel(
      compA: newCompA,
      compB: newCompB,
      year: updatedSavings.year,
      withdrawn: updatedSavings.withdrawn + amount,
    );

    _hiveService.updateSavings(index, updatedSavings);
    state = _hiveService.getAllSavings();
  }
}
