import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/savings_provider.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingsList = ref.watch(savingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Savings History')),
      body: savingsList.isEmpty
          ? const Center(child: Text('No Savings Data Available'))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildChart(savingsList),
            const SizedBox(height: 20),
            _buildLegend(),
            const SizedBox(height: 20),
            _buildHistoryList(savingsList),
          ],
        ),
      ),
    );
  }

  /// Chart Widget with smooth animations
  Widget _buildChart(List savingsList) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Yearly Savings & Withdrawals',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: savingsList.map((e) => e.compA + e.compB).reduce((a, b) => a > b ? a : b) * 1.2,
                barGroups: savingsList.map((e) {
                  return BarChartGroupData(
                    x: e.year,
                    barRods: [
                      BarChartRodData(
                        toY: e.compA,
                        color: Colors.blueAccent,
                        width: 16,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      BarChartRodData(
                        toY: e.compB,
                        color: Colors.greenAccent,
                        width: 16,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40, // Ensures space for labels
                      getTitlesWidget: (value, _) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true, checkToShowHorizontalLine: (value) => value % 10000 == 0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Legend for better understanding
  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _legendItem(Colors.blueAccent, 'CompA'),
        const SizedBox(width: 10),
        _legendItem(Colors.greenAccent, 'CompB'),
      ],
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  /// History list with a sleek card design
  Widget _buildHistoryList(List savingsList) {
    return Column(
      children: savingsList.map((e) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                e.year.toString(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              'Total Savings: ${(e.compA + e.compB).toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'CompA: ${e.compA.toStringAsFixed(2)}  |  CompB: ${e.compB.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      }).toList(),
    );
  }
}
