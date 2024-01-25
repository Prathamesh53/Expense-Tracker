import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<String> labels;
  final List<double> data;

  SimpleBarChart(this.labels, this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(data.length, (index) {
          return Row(
            children: [
              // X-axis label
              Container(
                child: Center(child: Text("\$" + data[index].toString())),
                width: data[index] *
                    30.0, // Adjust the scaling factor based on your data
                height: 40.0, // Adjust the height of each bar
                margin: EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.blue,
              ),
              SizedBox(width: 8.0),
              // Y-axis label
              Text(labels[index]),
            ],
          );
        }),
      ),
    );
  }
}
