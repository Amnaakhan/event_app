import 'package:enentapp/Screens/Home/event_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> with TickerProviderStateMixin {
  int _activeIndex = 0;
  late TabController _tabController;
  final TextEditingController eventcontroller = TextEditingController();
  int _wordCount = 0;
  final int _maxWords = 30;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);

    eventcontroller.addListener(updateWordCount);
  }

  @override
  void dispose() {
    eventcontroller.dispose();
    _tabController.dispose();

    super.dispose();
  }

  void updateWordCount() {
    String text = eventcontroller.text.trim();
    List<String> words = text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
    setState(() {
      _wordCount = words.length;
    });
  }



  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text('Create an Event',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp))
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Text('Title',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp)),
      SizedBox(height: 1.h,),
      Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),

        ),
        child: TextFormField(
          controller: eventcontroller,
          decoration: InputDecoration(
            fillColor:Colors.transparent,
            filled: true,
            hintText: "Name of event",

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
                color:               Colors.black,

              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusColor:  Colors.black,

            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          cursorColor: Colors.black,
          style: GoogleFonts.montserrat(
            color: Theme.of(context).primaryColorLight,
            fontSize: 14,
          ),
        ),
      ),
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
            Container(
              height: 5.h,
              width: double.infinity,
              // color: Colors.purple,
              
              child:Column(
                children: [
                  Expanded( child:
                  TabBar(
              controller: _tabController,

                indicatorColor: Color(0xff3D50DF),
                indicatorSize: TabBarIndicatorSize.tab,
                padding: EdgeInsets.only(bottom: 1.h),
                labelColor: Colors.black,
                labelPadding: EdgeInsets.only(left: 1.w, right: 2.w),
                dividerColor: Colors.transparent,

                labelStyle:
                GoogleFonts.poppins(color: Colors.black, fontSize: 15.sp), tabs: [
                  Tab(
                    child:
              _activeIndex== 0?
                    Text('Events',style:  GoogleFonts.poppins(color: Colors.black, fontSize: 15.sp),):
              Text('Events',style:  GoogleFonts.poppins(color: Color(0xff64748B), fontSize: 15.sp))

                  ),
                    Tab(
                        child:
                        _activeIndex== 1?
                        Text('Reminder',style:  GoogleFonts.poppins(color: Colors.black, fontSize: 15.sp),):
                        Text('Reminder',style:  GoogleFonts.poppins(color: Color(0xff64748B), fontSize: 15.sp))

                    ),
                  ],)
                  )
                ],
              ) ,
            ),
            Container(height: 50.h,
            width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  EventTab(),
                  EventTab()

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
