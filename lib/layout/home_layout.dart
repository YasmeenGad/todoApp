import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/screens/settings/seetings_tap.dart';
import 'package:todo/screens/tasks/task_tap.dart';

import 'package:todo/shared/styles/colors.dart';
import 'package:todo/widgets/add_task_btm_sheet.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  static const String routeName = "/homeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> taps = [
    TaskTap(),
    SettingsTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSheet();
        },
        child: Icon(Icons.add),
      ),
      body: taps[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          index = value;
        }),
        currentIndex: index,
        iconSize: 33.sp,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }

  void showSheet() {
    showModalBottomSheet(
        backgroundColor: Get.isDarkMode ? bgNavdark : lightColor,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.h),
        )),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBtmSheet(),
          );
        });
  }
}
