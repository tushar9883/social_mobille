import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ofc_port/base/base_view_view_model.dart';
import 'package:ofc_port/res/app_colors.dart';
import 'package:ofc_port/res/style.dart';
import 'package:ofc_port/screens/splash/splash_binding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends BaseView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.mainColor,
          child: Column(
            children: [
              SizedBox(
                height: 326.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/image/splash.svg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider.builder(
                            itemCount: controller.itemsText.length,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                padding: EdgeInsets.only(left: 40.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller.itemsText[index].toString(),
                                        maxLines: 2,
                                        style: merriweatherRegular.copyWith(
                                          fontSize: 28.sp,
                                          overflow: TextOverflow.visible,
                                          color: AppColors.khakhiColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            carouselController:
                                controller.buttonCarouselController,
                            options: CarouselOptions(
                              height: 100.h,
                              autoPlay: true,
                              viewportFraction: 1.0,
                              initialPage: 0,
                              onPageChanged: (index, reason) {
                                controller.sliderCurrent = index;
                                controller.update();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Row(
                              children: [
                                AnimatedSmoothIndicator(
                                  activeIndex: controller.sliderCurrent,
                                  count: 3,
                                  effect: const JumpingDotEffect(
                                    dotColor: AppColors.mainLightColor,
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    activeDotColor: AppColors.mainDarkColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/image/diamond.png',
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300.h,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: (){
                         controller.getStart();
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          height: 68.h,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/image/get_start.svg',
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),

                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Get Start",
                                        style: circeBold.copyWith(
                                          fontSize: 21.sp,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/image/arrow_start.svg',
                                        fit: BoxFit.contain,
                                        width: 52.w,
                                        height: 20.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
