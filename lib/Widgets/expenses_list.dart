import 'package:flutter/material.dart';

import 'package:paise_bachao_yojna/Models/expense_class.dart';
import 'package:paise_bachao_yojna/Widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<ExpenseData> expenses;
  final void Function(ExpenseData expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        child: ExpensItem(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
      ),
    );
  }
}
