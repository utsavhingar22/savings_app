import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/savings_provider.dart';

class HistoryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingsList = ref.watch(savingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Savings History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: savingsList.isEmpty
            ? const Center(child: Text('No Savings Data Available'))
            : Column(
          children: [
            const Text(
              'Yearly Savings and Withdrawals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildChart(savingsList),
          ],
        ),
      ),
    );
  }

  /// Chart Widget
  Widget _buildChart(List savingsList) {
    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: savingsList.map((e) {
            return BarChartGroupData(x: e.year, barRods: [
              BarChartRodData(toY: e.compA, color: Colors.blue, width: 16),
              BarChartRodData(toY: e.compB, color: Colors.green, width: 16),
            ]);
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, _) => Text(value.toInt().toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
