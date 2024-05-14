import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import 'package:http/http.dart' as http;



class EventTab extends StatefulWidget {
  const EventTab({super.key});

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  final TextEditingController desccontroller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String _endTime = 'End Time';
  String _startTime = 'Start Time';


  File? imageFile;
  bool showspinner = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Text('Description',
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp)),
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
              fillColor: Colors.transparent,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffD0D5DD),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorStyle: GoogleFonts.poppins(),
              hintStyle: GoogleFonts.poppins(
                color: Color.fromRGBO(116, 118, 136, 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusColor: Colors.black,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            cursorColor: Colors.black,
            style: GoogleFonts.montserrat(
              color: Theme.of(context).primaryColorLight,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text('Date',
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp)),
        SizedBox(
          height: 2.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: dateController,
            readOnly: true,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              hintText: "Enter Date",
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
                borderSide: BorderSide(
                  color: Color(0xffD0D5DD),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorStyle: GoogleFonts.poppins(),
              hintStyle: GoogleFonts.poppins(
                color: Color.fromRGBO(116, 118, 136, 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusColor: Colors.black,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            cursorColor: Colors.black,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 2.h,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 6.h,
          width: 40.w,

          padding: EdgeInsets.only(left: 2.w,right: 2.w),
        decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
          border: Border.all( color: Color(0xffD0D5DD),)
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        Text("${_startTime}",style:  GoogleFonts.poppins(
          color: Color.fromRGBO(116, 118, 136, 1),
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
          width: 40.w,
          padding: EdgeInsets.only(left: 2.w,right: 2.w),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all( color: Color(0xffD0D5DD),)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${_endTime}",style:  GoogleFonts.poppins(
                color: Color.fromRGBO(116, 118, 136, 1),
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
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp)),
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

              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.10),
                  blurRadius: 12, // soften the shadow
                  spreadRadius: 0, //extend the shadow
                  offset: Offset(
                    0, // Move to right 10  horizontally
                    10, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Center(
              child: imageFile == null
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Choose File',style: GoogleFonts.poppins(
                    color: Colors.black, fontSize: 15.sp,
                    fontWeight: FontWeight.w600,

                  ),),
                  SizedBox(width: 2.w,),
                  Image.asset('assets/images/choose_file.png',height: 3.h,)
                ],
              )
                  : Image.file(
                imageFile!,
                fit: BoxFit.contain,
                height: 20.h,// Adjust as needed
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 7.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Color(0xffE7EAEE),

                borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
              ),
              child:
                  Center(
                    child: Text("Cancel",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          color:  Color(0xff64748B),fontSize: 13.sp),),
                  ),




            ),
            InkWell(
              onTap: (){
                uploadmage();
                Fluttertoast.showToast(
                  msg: 'Data has been saved successfully',
                  backgroundColor: Colors.blue,
                );
              },
              child: Container(
                height: 7.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(86, 105, 255, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(11, 126, 201, 0.25),
                      blurRadius: 25, // soften the shadow
                      spreadRadius: 0, //extend the shadow

                    )
                  ],
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

              Icon(Icons.check,color: Colors.white,),
                     Text("Create Event",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                            color:  Colors.white,fontSize: 13.sp),),



                  ],
                ),
              ),
            ),
          ],
        ),



      ],
    );
  }
  void selectFile() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1800,
      maxWidth: 1800,
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
      dateController.text = formattedDate;
    }
  }
  Future<void> uploadmage()async{
    setState(() {
      showspinner = true;
    });
    var headers = {
      'userId': '1',
      'token': 'SckiS1A9IQyAPp38x4o5zDngFyDntPOBMmhvsFr742kvLdqCuaclaGTJ8zL6X9jNYRYqEQBhN71e6HujVKeU0OpMmoWXtbCfw3KE'
    };

    var request = http.MultipartRequest('POST', Uri.parse('https://paidglobalevents.com/API/v1/event/CreateEvent'));
    request.fields.addAll({
      'eventTitle': 'Art event',
      'startDate': '2024-6-12',
      'endDate': '',
      'startTime': '12:00',
      'endTime': '6:00',
      'description':'this it new event ',
      'category': 'Art',
      'address':'wapda town multan',
      'city': 'Multan',
      'latitude': '14.1222',
      'longitude': '91.12212',
      'eventPrice': '10',

    });
    request.files.add(await http.MultipartFile.fromPath('eventImage',imageFile!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Data has been saved successfully',
        backgroundColor: Colors.blue,
      );
    }
    else {
      print(response.reasonPhrase);
    }

  }
}
