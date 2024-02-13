import 'package:flutter/material.dart';
import 'package:todo_app/model/DateTimeFormat.dart';

class Task {
  num taskId;
  num categoryId;
  String taskName;
  bool isCompleted;
  Color color;
  DateTime createdDate;

  Task(this.taskId, this.categoryId, this.taskName, this.isCompleted,
      this.color, this.createdDate);
}

List<Task> tasks = [
  Task(1, 1, "Meeting", true, Colors.green,
      DateTimeConverter.parseDate("31-10-2023")),
  Task(2, 2, "Cooking", false, Colors.red,
      DateTimeConverter.parseDate("23-01-2024")),
  Task(3, 3, "Shopping", true, Colors.purple,
      DateTimeConverter.parseDate("21-01-2024")),
  Task(4, 2, "Walk for 10 minutes", false, Colors.blue,
      DateTimeConverter.parseDate("19-01-2022")),
  Task(5, 1, "Drink water", true, Colors.orange,
      DateTimeConverter.parseDate("12-01-2024")),
  Task(6, 4, "Google the thing", true, Colors.pink,
      DateTimeConverter.parseDate("14-01-2024")),
  Task(7, 4, "Dancing", false, Colors.yellow,
      DateTimeConverter.parseDate("10-10-2023")),
  Task(8, 4, "Rolling", false, Colors.black,
      DateTimeConverter.parseDate("11-01-2024")),
];
