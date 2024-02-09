import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryList{
  final num categoryId;
  final String taskNumber;
  final String categoryName;
  final double percent;
  final Color color;
  CategoryList(this.categoryId,this.categoryName, this.percent, this.color, this.taskNumber);
}

 final List<CategoryList> categories = [
  CategoryList(1,"Business", 0.8, Colors.yellow,"30"),
  CategoryList(2,"Productivity", 0.2,Colors.green,"50"),
  CategoryList(3,"Entertainment", 0.3,Colors.blue,"20"),
  CategoryList(4,"Food", 0.8,Colors.yellow,"10"),
];