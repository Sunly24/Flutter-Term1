import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter/W8-S1-Review/lib/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  IconData getCategoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.restaurant;
      case Category.travel:
        return Icons.flight;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Icon(getCategoryIcon(expense.category), color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  DateFormat.yMd().format(expense.date),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
