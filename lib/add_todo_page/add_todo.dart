import 'package:flutter/material.dart';
import 'package:todo_app/add_todo_page/navigationBar.dart';
import 'package:todo_app/custom_widget/TextFieldWidget.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _textEditingController = TextEditingController();

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
            TextFieldWidget(obscureText: false, hintText: "Enter the Task..."),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 15),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
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
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 50,
                    child: Radio(value: radioButtonSelected, groupValue: radioButtonSelected, onChanged: (value) {
                      radioButtonSelected = !radioButtonSelected;
                    },),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
