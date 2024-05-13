import 'package:enentapp/Screens/Home/all_tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h,
                left: 5.w,right: 5.w),
                height: 65.h,width: double.infinity,
                color: Color(0xff4A43EC),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back,color: Colors.white,
                        ),
                        SizedBox(width: 25.w,),
                        Text(
                          "Tickets",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h,),

                    Image.asset('assets/images/ticket.png',height: 20.h,),
                    Image.asset('assets/images/ellips.png',height: 2.h,)

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h,left: 5.w),
                  child: Image.asset('assets/images/ticket1.png',height: 50.h,)),


            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllTickets()),
                  );
                },
                child: Container(
                  height: 7.h,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: Color(0xff5669FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Download Image",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h,)
        ],
      ),
    );
  }
}
