
import 'dart:io';

import 'package:event_app/MVVM/view_model/event_view_model.dart';
import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/Widget/input_text_field.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:event_app/app/config/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent>  {

  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  final TextEditingController cityccontroller = TextEditingController();
  final TextEditingController addessccontroller = TextEditingController();
  final TextEditingController categoryccontroller = TextEditingController();
  final TextEditingController priceccontroller = TextEditingController();

  final TextEditingController sdateController = TextEditingController();
  final TextEditingController edateController = TextEditingController();

  final eventFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final categoryFocusNode = FocusNode();
  final priceFocusNode = FocusNode();

  final eventController = Get.put(EventController());


  String _endTime = 'End Time';
  String _startTime = 'Start Time';


  File? imageFile;
  bool showspinner = false;
  int _wordCount = 0;
  final int _maxWords = 30;


  void updateWordCount() {
    String text = titlecontroller.text.trim();
    List<String> words = text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
    setState(() {
      _wordCount = words.length;
    });
  }



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
                  Text('Create an Event',
                      style: TextStyles.profiletext)
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text('Title',
                  style: TextStyles.regularwhite),
              SizedBox(height: 1.h,),
              InputTextField(myController: titlecontroller,
                  focusNode: eventFocusNode,
                  onFieldSubmittedValue: (value){},
                  keyBoardType: TextInputType.text, obscureText: false,
                  hint: 'Name of Event', onValidator: (value){}),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _wordCount > _maxWords ? '$_maxWords/$_maxWords' : '$_wordCount/$_maxWords',
                  style: TextStyle(
                    color: _wordCount > _maxWords ? Colors.red : Colors.grey,
                  ),
                ),
              ),

              SizedBox(height: 3.h,),

              Text('Description',
                  style: TextStyles.regularwhite),
              SizedBox(
                height: 2.h,
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
              Text('Price',
                  style: TextStyles.regularwhite),
              SizedBox(
                height: 2.h,
              ),
              InputTextField(myController: priceccontroller,
                  focusNode: priceFocusNode,
                  onFieldSubmittedValue: (value){},
                  keyBoardType: TextInputType.text, obscureText: false,
                  hint: 'Price of Event', onValidator: (value){}),
              SizedBox(
                height: 2.h,
              ),
              Text('City',
                  style: TextStyles.regularwhite),
              SizedBox(
                height: 2.h,
              ),
              InputTextField(myController: cityccontroller,
                  focusNode: cityFocusNode,
                  onFieldSubmittedValue: (value){},
                  keyBoardType: TextInputType.text, obscureText: false,
                  hint: 'Name of city', onValidator: (value){}),
              SizedBox(
                height: 2.h,
              ),
              Text('Adress',
                  style: TextStyles.regularwhite),
              SizedBox(
                height: 2.h,
              ),
              InputTextField(myController: addessccontroller,
                  focusNode: addressFocusNode,
                  onFieldSubmittedValue: (value){},
                  keyBoardType: TextInputType.text, obscureText: false,
                  hint: 'Enter address', onValidator: (value){}),
              SizedBox(
                height: 2.h,
              ),
              Text('Category',
                  style: TextStyles.regularwhite),
              SizedBox(
                height: 2.h,
              ),
              InputTextField(myController: categoryccontroller,
                  focusNode: categoryFocusNode,
                  onFieldSubmittedValue: (value){},
                  keyBoardType: TextInputType.text, obscureText: false,
                  hint: 'Category', onValidator: (value){}),
              SizedBox(
                height: 2.h,
              ),
              Text('Date',
                  style: TextStyles.regularwhite
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: sdateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: AppColors.signinoptioncolor,
                          filled: true,
                          hintText: "start Date",
                          suffixIcon: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/clock_icon.png'),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                    
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: edateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: AppColors.signinoptioncolor,
                          filled: true,
                          hintText: "End Date",
                          suffixIcon: InkWell(
                            onTap: () {
                              _selectDates(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/clock_icon.png'),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                    
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 6.h,
                    width: 42.w,

                    padding: EdgeInsets.only(left: 3.w,right: 2.w),
                    decoration: BoxDecoration(
                        color:AppColors.signinoptioncolor,

                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${_startTime}",style:  TextStyle(
                          color: Colors.white,
                        )),
                        InkWell(
                            onTap: (){
                              _starTime(context);
                            },
                            child: Icon(Icons.keyboard_arrow_down_outlined,color:Color.fromRGBO(116, 118, 136, 1) ,))
                      ],
                    ),
                  ),
                  Container(
                    height: 6.h,
                    width: 42.w,
                    padding: EdgeInsets.only(left: 3.w,right: 2.w),
                    decoration: BoxDecoration(
                        color: AppColors.signinoptioncolor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${_endTime}",style:  TextStyle(
                          color: Colors.white,
                        ),),
                        InkWell(
                            onTap: (){
                              _selectTime(context);

                            },
                            child: Icon(Icons.keyboard_arrow_down_outlined,color: Color.fromRGBO(116, 118, 136, 1),))
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 2.h,),
              Text('Choose file',
                  style: TextStyles.regularwhite
              ),
              SizedBox(height: 2.h,),
              InkWell(
                onTap: (){
                  selectFile();
                },
                child: Container(
                  height: 20.h,
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(1.h),

                    color: AppColors.signinoptioncolor,

                  ),
                  child: Center(
                    child: imageFile == null
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Choose File',style: TextStyle(
                          color: Colors.white, fontSize: 15.sp,
                          fontWeight: FontWeight.w600,

                        ),),
                        SizedBox(width: 2.w,),
                        Image.asset('assets/images/choose_file.png',height: 3.h,color: Colors.white,)
                      ],
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(1.h),
                      child: Image.file(
                        imageFile!,
                        width: double.infinity,
                        height: 20.h,
                        fit: BoxFit.cover, // or BoxFit.contain if you prefer
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Obx(() {
                return
                eventController.isLoading.value? Center(child: CircularProgressIndicator(),):
                ButtonWidget(text: 'Create Event', onPressed: () {    eventController.createEvent(eventTitle: titlecontroller.text,
                    startDate: sdateController.text, endDate: edateController.text,
                    startTime: _startTime, endTime: _endTime,
                    eventPrice: priceccontroller.text, eventDescription: desccontroller.text,
                    eventCategory: categoryccontroller.text, eventAddress: addessccontroller.text,
                    eventCity: cityccontroller.text, eventLatitude: '1234567',
                    eventLongitude: '7654321', eventImage: imageFile!); },borderRadius: 4.h,
                  textColor: AppColors.whiteColor,backgroundColor: AppColors.blueColor,);
              }
              ),
              SizedBox(height: 2.h,)
            ],
          ),
        ),
      ),
    );
  }
  void selectFile() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,

    );

    if (file != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _endTime = DateFormat.Hm().format(DateTime(2024, 5, 13, pickedTime.hour, pickedTime.minute));
        // 2024-05-13 is just a placeholder, you can change it to the current date or any other date
        // Hm format shows time in "hour:minute" format (e.g., "14:30")
        // Adjust the format according to your needs
        print("Selected Time: $_endTime");
      });
    }
  }
  Future<void> _starTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _startTime = DateFormat.Hm().format(DateTime(2024, 5, 13, pickedTime.hour, pickedTime.minute));
        // 2024-05-13 is just a placeholder, you can change it to the current date or any other date
        // Hm format shows time in "hour:minute" format (e.g., "14:30")
        // Adjust the format according to your needs
        print("Selected Time: $_startTime");
      });
    }
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      sdateController.text = formattedDate;
    }
  }
  Future<void> _selectDates(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      edateController.text = formattedDate;
    }
  }
}
