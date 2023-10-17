import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/theming.dart';

class SettingsTap extends StatelessWidget {
  RxBool isSwitched = false.obs;
  RxBool istranslated = false.obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 157.h,
                decoration: BoxDecoration(color: primaryColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(50),
                      horizontal: ScreenUtil().setWidth(30)),
                  child: Text("16".tr,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 75.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(30),
                horizontal: ScreenUtil().setWidth(15)),
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
            width: double.infinity,
            decoration: BoxDecoration(
                color:
                    Get.isDarkMode ? bgColordark.withOpacity(0.5) : lightColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 4,
                  )
                ],
                borderRadius: BorderRadius.circular(30)),
            child: Column(children: [
              ListTile(
                title: Text(
                  "2".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: primaryColor),
                ),
                subtitle: Text(
                  "3".tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Get.isDarkMode
                          ? lightColor
                          : blackColor.withOpacity(0.5)),
                ),
                trailing: Icon(
                  Icons.light_mode,
                  color: primaryColor,
                ),
              ),
              Divider(
                thickness: 1,
                color: primaryColor,
                endIndent: 50,
                indent: 50,
              ),
              ListTile(
                  title: Text(
                    "4".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: primaryColor),
                  ),
                  trailing: Obx(
                    () => Switch(
                        value: isSwitched.value,
                        onChanged: (val) {
                          isSwitched.value = val;
                          if (isSwitched == true) {
                            if (!Get.isDarkMode) {
                              Get.changeTheme(MyThemeData.customdarkTheme);
                            }
                          } else {
                            Get.changeTheme(MyThemeData.customlightTheme);
                          }
                        }),
                  )),
              Divider(
                thickness: 1,
                color: primaryColor,
                endIndent: 50,
                indent: 50,
              ),
              ListTile(
                title: Text(
                  "5".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: primaryColor),
                ),
                subtitle: Text(
                  "6".tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Get.isDarkMode
                          ? lightColor
                          : blackColor.withOpacity(0.5)),
                ),
                trailing: Icon(
                  Icons.language_outlined,
                  color: primaryColor,
                ),
              ),
              Divider(
                thickness: 1,
                color: primaryColor,
                endIndent: 50,
                indent: 50,
              ),
              ListTile(
                  title: Text(
                    "7".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: primaryColor),
                  ),
                  subtitle: Text(
                    "8".tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Get.isDarkMode
                            ? lightColor
                            : blackColor.withOpacity(0.5)),
                  ),
                  trailing: Obx(
                    () => Switch(
                        value: istranslated.value,
                        onChanged: (val) {
                          istranslated.value = val;
                          if (istranslated == true) {
                            Get.updateLocale(Locale("ar"));
                          } else {
                            Get.updateLocale(Locale("en"));
                          }
                        }),
                  )),
            ]),
          )
        ],
      ),
    );
  }
}
