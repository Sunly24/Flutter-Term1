import 'package:flutter/material.dart';
import 'package:test_flutter/W8-W2-PRACTICE/EX-1-2-3/screens/expenses/statistic_card.dart';
import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onExpenseRemoved(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void restoreExpense(Expense expense) {
    setState(() {
      _registeredExpenses.insert(0, expense);
    });
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  Map<Category, double> _calculateTotals(List<Expense> expenses) {
    final totals = <Category, double>{};
    for (var category in Category.values) {
      totals[category] = expenses
          .where((expense) => expense.category == category)
          .fold(0.0, (sum, expense) => sum + expense.amount);
    }
    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = _calculateTotals(_registeredExpenses);

    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAddPressed,
            )
          ],
          backgroundColor: Colors.blue[700],
          title: const Text('Ronan-The-Best Expenses App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatisticCard(categoryTotals: categoryTotals),
            Expanded(
              child: ExpensesList(
                expenses: _registeredExpenses,
                onExpenseRemoved: onExpenseRemoved,
                onExpenseRestored: restoreExpense,
              ),
            ),
          ],
        ));
  }
}
