import 'package:flutter/material.dart';

class Task {
  final num categoryId;
  final String taskName;
  final bool isCompleted;
  final Color color;

  Task(this.categoryId, this.taskName, this.isCompleted, this.color);
}

List<Task> tasks = [
  Task(1, "Meeting", true, Colors.green),
  Task(2, "Cooking", false, Colors.red),
  Task(3, "Shopping", true, Colors.purple),
  Task(2, "Walk for 10 minutes", false, Colors.blue),
  Task(1, "Drink water", true, Colors.orange),
  Task(4, "Google the thing", true, Colors.pink),
  Task(4, "Dancing", false, Colors.yellow),
  Task(4, "Rolling", false, Colors.black),
];
