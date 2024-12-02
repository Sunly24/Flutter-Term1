import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onExpenseRemoved,
      required this.onExpenseRestored});

  final List<Expense> expenses;

  final Function(Expense) onExpenseRemoved;
  final Function(Expense) onExpenseRestored;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: expenses.isEmpty
          ? Center(
              child: Text(
                'No expenses found. Start adding some!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];

                return Dismissible(
                  key: Key(expense.id),
                  onDismissed: (direction) {
                    onExpenseRemoved(expense);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${expense.title} deleted.'),
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            onExpenseRestored(expense);
                          },
                        ),
                      ),
                    );
                  },
                  child: ExpenseItem(expense),
                );
              },
            ),
    );
  }
}
