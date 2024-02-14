import 'package:flutter/material.dart';
import 'package:todo_app/app_color/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  final Function() openDrawer;

  const AppBarWidget({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: 35.0,
              color: AppColor.grey,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
                child: GestureDetector(
                  onTap: null,
                  child: Icon(
                    Icons.search,
                    size: 35.0,
                    color: AppColor.grey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: null,
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 35.0,
                  color: AppColor.grey,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
