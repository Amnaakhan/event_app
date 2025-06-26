import 'package:event_app/MVVM/View/paymentMethod/payment_method.dart';
import 'package:event_app/Widget/button_widget.dart';
import 'package:event_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

class BookEventScreen extends StatefulWidget {
  final int? id;

  const BookEventScreen({super.key, required this.id});

  @override
  State<BookEventScreen> createState() => _BookEventScreenState();
}

class _BookEventScreenState extends State<BookEventScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int seatCount = 1;
  final double seatPrice = 50.0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('event id ${widget.id}');

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
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
                Text('Book Event',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',

                        fontSize: 15.sp)),
              ],
            ),
            SizedBox(height: 3.h,),
            // TabBar
            TabBar(
              controller: _tabController,
              labelColor: AppColors.blueColor,
              labelStyle: TextStyle(

                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blueColor,
                fontFamily: 'Montserrat',
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.white54,
              dividerColor: Colors.transparent,
              indicatorColor:  AppColors.blueColor,
              tabs: const [
                Tab(text: 'Standard'),
                Tab(text: 'Gold'),
              ],
            ),
             SizedBox(height: 2.h),

             Text(
              'Choose number of seats',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Montserrat',
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,


              ),
            ),
            const SizedBox(height: 20),

            // Counter
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCounterButton(Icons.remove, () {
                  if (seatCount > 1) {
                    setState(() {
                      seatCount--;
                    });
                  }
                }),
                const SizedBox(width: 30),
                Text(
                  '$seatCount',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 30),
                _buildCounterButton(Icons.add, () {
                  setState(() {
                    seatCount++;
                  });
                }),
              ],
            ),
            const Spacer(),

            // Continue Button
            ButtonWidget(text: 'Continue', onPressed: (){
              String category = _tabController.index == 0 ? 'Economy' : 'VIP';
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentMethodScreen(
                    category: category,
                    seats: seatCount, id: widget.id,
                  ),
                ),
              );
            },
              backgroundColor: AppColors.blueColor,
              textColor: AppColors.whiteColor,
              borderRadius: 4.h,
            )
          ],
        ),
      ),
    );
  }

  // Counter Button Widget
  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C23),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.blueColor),
        onPressed: onPressed,
        iconSize: 28,
      ),
    );
  }
}