import 'package:flutter/material.dart';
import 'package:todo_app/app_color/app_colors.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodayTaskWidget extends StatefulWidget {
  const TodayTaskWidget({super.key, required this.tasksList});

  final List<Task> tasksList;

  @override
  State<TodayTaskWidget> createState() => _TodayTaskWidgetState();
}

class _TodayTaskWidgetState extends State<TodayTaskWidget> {
  late List<Task> tasksList;

  @override
  void initState() {
    super.initState();
    tasksList = widget.tasksList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
        child: Text(
          AppLocalizations.of(context)!.today_Task,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.grey),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: Key(tasksList[index].taskName),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  setState(() {
                    tasksList.removeAt(index);
                  });
                },
                background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.white10,
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: AppColor.grey,
                        ),
                        Text(
                          "  This Item is deleted ",
                          style: TextStyle(color: Colors.grey, fontSize: 25),
                        )
                      ],
                    )),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              tasksList[index].isCompleted =
                                  !tasksList[index].isCompleted;
                              setState(() {});
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              // color: Colors.green,
                              decoration: tasksList[index].isCompleted
                                  ? BoxDecoration(
                                      color: tasksList[index].color,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: tasksList[index].color,
                                        // Customize border color
                                        width: 3.0,
                                      ),
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: tasksList[index].color,
                                        // Customize border color
                                        width: 3.0,
                                      ),
                                    ),
                              child: tasksList[index].isCompleted
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color:
                                          Colors.white, // Customize tick color
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            tasksList[index].taskName,
                            maxLines: null,
                            // Maximum number of lines before wrapping
                            overflow: TextOverflow.clip,
                            style: !tasksList[index].isCompleted
                                ? const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  )
                                : const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                            "${tasksList[index].createdDate.day}-${tasksList[index].createdDate.month}-${tasksList[index].createdDate.year}"),
                      )
                    ],
                  ),
                ));
          },
          reverse: true,
        ),
      )
    ]);
  }
}
