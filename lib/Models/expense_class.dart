import 'package:flutter/material.dart';

enum Category { food, travel, leisure, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class ExpenseData {
  ExpenseData(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category});
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
//expenses-list of expense;
//expense-single list ;
//enums:if we want fixed amount of allowed values for perticulat variable;
