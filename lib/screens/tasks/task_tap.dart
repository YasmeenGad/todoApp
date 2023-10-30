import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/edit_task.dart';
import 'package:todo/shared/firebase/firebase_func.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/cupertino.dart';

class TaskTap extends StatefulWidget {
  const TaskTap({super.key});

  @override
  State<TaskTap> createState() => _TaskTapState();
}

class _TaskTapState extends State<TaskTap> {
  late DateTime selectedDate;
  void _resetSelectedDate() {
    selectedDate = DateTime.now();
  }

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 305.h,
              decoration: BoxDecoration(color: Colors.transparent),
            ),
            Container(
              width: double.infinity,
              height: 250.h,
              decoration: BoxDecoration(color: primaryColor),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(50),
                    horizontal: ScreenUtil().setWidth(30)),
                child:
                    Text("1".tr, style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            Positioned(
              top: 120.h,
              child: SizedBox(
                width: 412.h,
                child: CalendarTimeline(
                  showYears: true,
                  initialDate: selectedDate,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 8)),
                  onDateSelected: (date) => setState(() => selectedDate = date),
                  leftMargin: 20.w,
                  monthColor: Get.isDarkMode ? bgColordark : lightColor,
                  dayColor:
                      Get.isDarkMode ? lightColor : blackColor.withOpacity(0.7),

                  activeDayColor: Get.isDarkMode ? lightColor : primaryColor,
                  activeBackgroundDayColor:
                      Get.isDarkMode ? bgNavdark : lightColor,
                  dotsColor: primaryColor,
                  // selec"tableDayPredicate: (date) => date.day != 23,
                  locale: Get.locale?.languageCode == 'ar' ? 'ar' : 'en',
                ),
              ),
            ),
          ],
        ),
        StreamBuilder(
            stream: FirebaseFunctions.getTasks(selectedDate),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
              List<TaskModel> tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return Expanded(
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(16),
                            horizontal: ScreenUtil().setWidth(16)),
                        child: Slidable(
                          startActionPane:
                              ActionPane(motion: DrawerMotion(), children: [
                            SlidableAction(
                              onPressed: (context) {
                                FirebaseFunctions.deleteTasks(tasks[index].id!);
                              },
                              label: "Delete",
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                Get.toNamed(EditTask.routeName);
                              },
                              label: "Edit",
                              icon: Icons.edit,
                              backgroundColor: Colors.blue,
                            )
                          ]),
                          child: Container(
                            width: 352.w,
                            height: 115.h,
                            decoration: BoxDecoration(
                              color: Get.isDarkMode ? bgNavdark : lightColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(8),
                                  horizontal: ScreenUtil().setWidth(13)),
                              child: Row(children: [
                                Container(
                                  width: 4.w,
                                  height: 62.h,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Text(tasks[index].title!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                      ],
                                    ),
                                    subtitle: Row(children: [
                                      Icon(CupertinoIcons.clock, size: 20.sp),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Text(
                                        "${selectedDate}".substring(0, 10),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )
                                    ]),
                                    trailing: MaterialButton(
                                      color: primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.check_outlined,
                                        size: 25.sp,
                                        color: lightColor,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }))
      ],
    );
  }
}
