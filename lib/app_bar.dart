
import 'package:flutter/material.dart';
import 'package:todo_app/app_color/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GestureDetector(
        onTap: null,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(child: Icon(Icons.menu,size: 40.0,color: AppColor.grey),height: 100.0,),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
