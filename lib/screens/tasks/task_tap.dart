import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/screens/edit_task.dart';
import 'package:todo/shared/styles/colors.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 335.h,
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
                  child: Text("1".tr,
                      style: Theme.of(context).textTheme.bodyLarge),
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
                    onDateSelected: (date) =>
                        setState(() => selectedDate = date),
                    leftMargin: 20.w,
                    monthColor: Get.isDarkMode ? bgColordark : lightColor,
                    dayColor: Get.isDarkMode
                        ? lightColor
                        : blackColor.withOpacity(0.7),

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
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(16),
                horizontal: ScreenUtil().setWidth(16)),
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
                          Text("17".tr,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.toNamed(EditTask.routeName);
                            },
                            child: Icon(
                              Icons.edit,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                      subtitle: Row(children: [
                        Icon(CupertinoIcons.clock, size: 20.sp),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "${selectedDate}".substring(0, 10),
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ]),
                      trailing: MaterialButton(
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
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
          )
        ],
      ),
    );
  }
}
