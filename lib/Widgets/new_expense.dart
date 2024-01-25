//TextEditing Controller used to save the input data in memory
//tryParse convert string to integer
//string.trim remove all empty spaces
//showDialogue=>if we want to show some message
//showDatepicker
// very very important see how we pass our ne expense in our expense list
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:paise_bachao_yojna/Models/expense_class.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.newexpense});
  void Function(ExpenseData expense) newexpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  DateTime? selectedDate = null;

  void _date_picker() async {
    final picked_date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
    setState(() {
      selectedDate = picked_date;
    });
  }

  void isValid() {
    final entered_amount = double.tryParse(amontcontroller.text);
    if (selectedDate == null ||
        titlecontroller.text.trim().isEmpty ||
        entered_amount == null ||
        entered_amount < 0) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Invalid Input"),
                content: Text(
                    "Please cheak a valid title,amount,date and categorywas entered or not."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text("Okay"))
                ],
              ));
    } else {
      ExpenseData item = ExpenseData(
          amount: entered_amount,
          category: map[_dropdownvalue]!,
          date: selectedDate!,
          title: titlecontroller.text);
      widget.newexpense(item);
    }
    return;
  }

  String _dropdownvalue = "food";
  var items = [
    'food',
    'travel',
    'leisure',
    'work',
  ];
  var map = {
    'food': Category.food,
    'travel': Category.travel,
    'leisure': Category.leisure,
    'work': Category.work,
  };
  final titlecontroller = TextEditingController();
  final amontcontroller = TextEditingController();
  @override
  void dispose() {
    titlecontroller.dispose();
    amontcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
        ),
        TextField(
          controller: titlecontroller,
          decoration: InputDecoration(label: Text("Title")),
          maxLength: 50,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: amontcontroller,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(prefixText: "\$", label: Text("Amount")),
                maxLength: 50,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedDate == null
                      ? "No Date Selected"
                      : DateFormat.yMMMd().format(selectedDate!)),
                  IconButton(
                      onPressed: _date_picker, icon: Icon(Icons.calendar_month))
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            DropdownButton(
              value: _dropdownvalue,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownvalue = newValue!;
                });
              },
            ),
            Spacer(),
            ElevatedButton(onPressed: isValid, child: Text("Save Expense")),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close")),
          ],
        )
      ],
    );
  }
}
