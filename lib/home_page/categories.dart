import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app/app_color/app_colors.dart';
import 'package:todo_app/model/categories.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
        child: Text(
          "Categories",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.grey),
        ),
      ),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Row(children: [
                for (int i = 0; i < categories.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Card(
                      elevation: 3,
                      child: SizedBox(
                        width: 230,
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tasks ${categories[i].taskNumber}",
                                        style: const TextStyle(
                                            color: AppColor.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        categories[i].categoryName,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 10),
                                child: LinearPercentIndicator(
                                  barRadius: const Radius.circular(20),
                                  width: 180.0,
                                  lineHeight: 3.0,
                                  percent: categories[i].percent,
                                  progressColor: categories[i].color,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ])))
    ]);
  }
}
