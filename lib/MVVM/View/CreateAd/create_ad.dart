import 'dart:io';

import 'package:event_app/MVVM/view_model/ad_view_model.dart';
import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/Widget/input_text_field.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class CreateAd extends StatefulWidget {
  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  final TextEditingController desccontroller = TextEditingController();
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final adVM = Get.put(AdViewModel());


  final titleFocusNode = FocusNode();
  final desFocusNode = FocusNode();
  final priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text('Create Ad',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
        
                          fontSize: 15.sp)),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Image.asset('assets/images/card_img.png',fit: BoxFit.fill,),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Title",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              InputTextField(myController: titlecontroller,
                  focusNode: titleFocusNode,
                  onFieldSubmittedValue: (value){},
                  keyBoardType: TextInputType.text, obscureText: false,
                  hint: 'Name of AD ', onValidator: (value){}),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              InputTextField(myController: pricecontroller,
                  focusNode: priceFocusNode,
                  onFieldSubmittedValue: (value){},
                  keyBoardType: TextInputType.text, obscureText: false,
                  hint: 'Amount', onValidator: (value){}),
              Text(
                "Description",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
        
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: desccontroller,
        
                  maxLines: 10,
                  decoration: InputDecoration(
                    fillColor: AppColors.signinoptioncolor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
        
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorStyle: TextStyle(),
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(116, 118, 136, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
        
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
        
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusColor: Colors.black,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: adVM.pickImage,
                child: Obx(() {
                  return Container(
                    height: 20.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h),
                      color: AppColors.signinoptioncolor,
                      image: adVM.selectedImage.value != null
                          ? DecorationImage(
                        image: FileImage(adVM.selectedImage.value!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: adVM.selectedImage.value == null
                        ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Choose File',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Image.asset(
                            'assets/images/choose_file.png',
                            height: 3.h,
                            color: AppColors.whiteColor,
                          ),
                        ],
                      ),
                    )
                        : Container(), // Empty child because image is already shown via decoration
                  );
                }),
              ),

              SizedBox(
                height: 2.h,
              ),
              Obx(() => adVM.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ButtonWidget(
                text: 'Upload Ad',
                borderRadius: 4.h,
                textColor: AppColors.whiteColor,
                backgroundColor: AppColors.blueColor,
                onPressed: () {
                  adVM.uploadAd(
                    title: titlecontroller.text.trim(),
                    description: desccontroller.text.trim(),
                    targetAmount: pricecontroller.text.trim(),
                  );
                },
              )),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      child: Column(
                    children: [
                      Container(
                        height: 10.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/icon.png'))),
                        child: Icon(
                          Icons.check,
                          color: Color(0xff3D50DF),
                          size: 40.sp,
                        ),
                      ),
                      Container(
                        height: 20.h,

                        padding:
                            EdgeInsets.only(top: 2.h, left: 3.w, right: 3.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/container.png'))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Successfully Create AD',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),

                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>DonationScreen()
                                //     ));
                              },
                              child: Container(
                                height: 6.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: Color(0xff5669FF),
                                  borderRadius: BorderRadius.circular(2.h),
                                ),
                                child: Center(
                                  child: Text('Got it',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ));
      },
    );
  }
}
