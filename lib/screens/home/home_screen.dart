import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofc_port/base/base_view_view_model.dart';
import 'package:ofc_port/res/app_colors.dart';
import 'package:ofc_port/res/style.dart';
import 'package:ofc_port/screens/home/home_binding.dart';

class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: merriweatherRegular.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.liteColor,
                        ),
                      ),
                      Text(
                        "Anastasia",
                        style: merriweatherRegular.copyWith(
                          fontSize: 28.sp,
                          color: AppColors.mainDarkColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.message();
                    },
                    child: Container(
                      height: 46.w,
                      width: 46.w,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        size: 24.r,
                        color: AppColors.litesColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40.w),
                      height: 78.h,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.storyList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 14.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Container(
                                width: 80.w,
                                height: 80.w,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.pinkLightColor,
                                      blurRadius: 80.r,
                                      offset: const Offset(0, 20),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  controller.storyList[index],
                                width: 80.w,
                                height: 80.w,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.sliderHome.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: GestureDetector(
                            onTap: (){
                              controller.profile();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 300.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.pinkLightColor,
                                    blurRadius: 80.r,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                controller.sliderHome[index],
                                width: double.infinity,
                                height: 300.h,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
