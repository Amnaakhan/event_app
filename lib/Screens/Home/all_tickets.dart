import 'package:enentapp/Screens/Home/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AllTickets extends StatefulWidget {
  const AllTickets({super.key});

  @override
  State<AllTickets> createState() => _AllTicketsState();
}

class _AllTicketsState extends State<AllTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/app_bar2.png'),
              SizedBox(height: 2.h,),
        Padding(
          padding: EdgeInsets.only(left: 5.w,right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Text(
          'Upcoming Event Tickets',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15.sp,
          ),
        ),
        Image.asset('assets/images/card1.png'),
        Text(
          'All',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15.sp,
          ),
        ),
        InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            child: Image.asset('assets/images/card2.png')),
        Image.asset('assets/images/card3.png'),
        Image.asset('assets/images/card4.png'),
        Image.asset('assets/images/card5.png'),
        Image.asset('assets/images/card6.png'),
        
        
        
            ],
          ),
        )
            ],
          ),
        
        ),
      ),
    );
  }
}
