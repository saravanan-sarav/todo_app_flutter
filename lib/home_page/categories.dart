import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/single_child_scroll_view.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app/home_page/category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "Categories",
        ),
        const ListViewWidget()
      ],
    );
  }
}
