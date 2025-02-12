import 'package:hive/hive.dart';
import '../models/savings_model.dart';

class HiveService {
  final Box<SavingsModel> _box = Hive.box<SavingsModel>('savingsBox');

  /// Get all savings
  List<SavingsModel> getAllSavings() {
    return _box.values.toList();
  }

  /// Add a new savings entry
  void addSavings(SavingsModel savings) {
    _box.add(savings);
  }

  /// Update savings entry at a given index
  void updateSavings(int index, SavingsModel updatedSavings) {
    _box.putAt(index, updatedSavings);
  }
}
