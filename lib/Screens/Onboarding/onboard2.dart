import 'package:enentapp/Screens/Onboarding/onboard3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:enentapp/Screens/Auth/login_screen.dart';


class Onboard2 extends StatelessWidget {
  const Onboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 65.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/onboard2.png'),
                   fit: BoxFit.fill )),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 53.h,
              width: double.infinity,
              padding: EdgeInsets.only(top: 22.h,left: 7.w,right: 7.w,bottom: 7.h),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/base.png'),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 8.h,
                      width: 60.w,
                      // color: Colors.white,
                      child: Text(
                        ' Explore Upcoming and Nearby Events ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Container(
                    height: 8.h,
                    width: 65.w,
                    // color: Colors.white,
                    child: Text(
                      'In publishing and graphic design, Lorem is a placeholder text commonly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 10.sp),
                    ),
                  ),
                  Expanded(

                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(LoginScreen(),transition: Transition.rightToLeft);
                            },
                            child: Text('Skip',style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 12.sp),),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Image.asset('assets/images/oval1.png',height: 1.h,),
                            SizedBox(width: 2.w,),
                            Image.asset('assets/images/oval.png',height: 1.h),
                              SizedBox(width: 2.w,),

                              Image.asset('assets/images/oval1.png',height: 1.h)


                          ],),

                          InkWell(
                            onTap: (){
                              Get.to(Onboard3(),transition: Transition.rightToLeft);
                            },
                            child: Text('Next',style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 12.sp),),
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
