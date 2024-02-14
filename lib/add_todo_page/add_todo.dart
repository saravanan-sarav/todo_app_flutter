import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/add_todo_page/navigationBar.dart';
import 'package:todo_app/app_color/app_colors.dart';
import 'package:todo_app/custom_widget/TextFieldWidget.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController textEditingController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool radioButtonSelected = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 30.0, bottom: 50),
              child: NavigationBarWidget(),
            ),
            TextFieldWidget(
                obscureText: false,
                hintText: "Enter the Task...",
                textEditingController: textEditingController),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 20),
              child: Text(
                "Selected Date : ${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.pressed)) {
                              // Color when pressed
                              return Colors.white10; // Change color as desired
                            }
                            // Default color
                            return Colors.white; // Change color as desired
                          }),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 20),
                    child: Transform.scale(
                      scale: 2,
                      child: Radio(
                        value: radioButtonSelected,
                        groupValue: radioButtonSelected,
                        onChanged: (value) {
                          radioButtonSelected = !radioButtonSelected;
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 80.0, left: 100, right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.create_new_folder,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.flag_outlined,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.nightlight_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (textEditingController.text.isNotEmpty) {
              Task task = Task(tasks.length + 1, 2, textEditingController.text,
                  false, AppColor.generateRandomColor(), _selectedDate);
              Navigator.pop(context, task);
            } else {
              Fluttertoast.showToast(
                msg: 'Please enter any task to add...',
                toastLength: Toast.LENGTH_SHORT,
                // Duration for how long the toast should be shown
                gravity: ToastGravity.TOP,
                // Position of the toast
                backgroundColor: Colors.black,
                // Background color of the toast
                textColor: Colors.white, // Text color of the toast message
              );
            }
          },
          shape: const StadiumBorder(),
          backgroundColor: Colors.blue,
          child:  Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  AppLocalizations.of(context)!.create_button,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}



