import 'package:flutter/material.dart';

class Task {
  num taskId;
  num categoryId;
  String taskName;
  bool isCompleted;
  Color color;

  Task(this.taskId, this.categoryId, this.taskName, this.isCompleted,
      this.color);
}

List<Task> tasks = [
  Task(1, 1, "Meeting", true, Colors.green),
  Task(2, 2, "Cooking", false, Colors.red),
  Task(3, 3, "Shopping", true, Colors.purple),
  Task(4, 2, "Walk for 10 minutes", false, Colors.blue),
  Task(5, 1, "Drink water", true, Colors.orange),
  Task(6, 4, "Google the thing", true, Colors.pink),
  Task(7, 4, "Dancing", false, Colors.yellow),
  Task(8, 4, "Rolling", false, Colors.black),
];
