import 'package:flutter/material.dart';
import 'package:paise_bachao_yojna/Models/expense_class.dart';
import 'package:intl/intl.dart';

class ExpensItem extends StatelessWidget {
  ExpensItem(this.expense, {super.key});
  final ExpenseData expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        children: [
          Text(
            expense.title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text("\$${expense.amount.toString()}"),
              Spacer(),
              Row(children: [
                Icon(categoryIcon[expense.category],
                    color: Color.fromARGB(255, 246, 143, 143)),
                Text(DateFormat.yMMMd().format(expense.date)),
              ])
            ],
          ),
        ],
      ),
    ));
  }
}
