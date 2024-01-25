//we use modal sheet widget here to pop up the sheet which takes input from user
//scaffold messenger =>used to show any message after some work(for eg to undo expense item after removinf it)
//LIST=> add:position doesn't matter, insert->add element at perticular position.

import 'package:flutter/material.dart';
import 'package:paise_bachao_yojna/Models/expense_class.dart';
import 'package:paise_bachao_yojna/Widgets/expenses_list.dart';
import 'package:paise_bachao_yojna/Widgets/new_expense.dart';
import 'package:paise_bachao_yojna/Widgets/bar_chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseData> _registeredexpense = [
    ExpenseData(
        title: "UDEMY COURCE",
        amount: 500.51,
        date: DateTime.now(),
        category: Category.work),
    ExpenseData(
        title: "MOVIE",
        amount: 220.22,
        date: DateTime(2023, 12, 25),
        category: Category.leisure)
  ];

  void _addnewexpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            newexpense: addExpense,
          );
        });
  }

  void addExpense(ExpenseData expense) {
    setState(() {
      _registeredexpense.add(expense);
    });
  }

  void removeExpense(ExpenseData expense) {
    var expenseindex = _registeredexpense.indexOf(expense);
    setState(() {
      _registeredexpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Expense Deleted"),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredexpense.insert(expenseindex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(onPressed: _addnewexpense, icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: SimpleBarChart(
                  ["Work", "Leisure", "Travel", "Food"], [1, 2, 3, 4])),
          Expanded(
              child: ExpensesList(
            expenses: _registeredexpense,
            onRemoveExpense: removeExpense,
          )),
        ]));
  }
}
