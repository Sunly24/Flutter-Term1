import 'package:flutter/material.dart';
import '../../models/expense.dart';

class StatisticCard extends StatelessWidget {
  final Map<Category, double> categoryTotals;

  const StatisticCard({super.key, required this.categoryTotals});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categoryTotals.entries.map((entry) {
            return Column(
              children: [
                Text(
                  '${entry.value.toStringAsFixed(2)}\$',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Icon(
                  _getCategoryIcon(entry.key),
                  size: 30,
                  color: Colors.black,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.fastfood;
      case Category.travel:
        return Icons.flight_takeoff;
      case Category.work:
        return Icons.work;
      case Category.leisure:
        return Icons.movie;
      default:
        return Icons.category;
    }
  }
}
