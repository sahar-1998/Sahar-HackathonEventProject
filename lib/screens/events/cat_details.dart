import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryDetailsScreen extends StatefulWidget {

  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                height: 152.h,
                width: 375.w,
                color: HexColor('#253975'),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/as.JPG'),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 13.h, left: 90.w, right: 89.w),
            child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Category Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: HexColor('#3E3A57')),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h, left: 165.w, right: 164.w),
            child: const Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  '12 Event',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.red),
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              childAspectRatio: 343 / 103,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(top: 5.h,right: 16.w,left: 16.w),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                          height: 79.h,
                          width: 97.w,
                          child: Image.asset('images/as.JPG')),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 19.h),
                            child: Container(
                                height: 15.h,
                                width: 89.w,
                                child: Text(
                                  '12:00am - 2hours',
                                  style: TextStyle(
                                      fontSize: 11, color: HexColor('#8E8B9D')),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Container(
                                height: 15.h,
                                width: 89.w,
                                child: Text(
                                  'Event Name',
                                  style: TextStyle(
                                      fontSize: 15, color: HexColor('#423E5B')),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Container(
                                height: 15.h,
                                width: 89.w,
                                child: Text(
                                  '12/12/2020',
                                  style: TextStyle(
                                      fontSize: 11, color: HexColor('#423E5B')),
                                )),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h,right: 36.w),
                        child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor('#FBFBFC'),
                                borderRadius: BorderRadius.circular(4)),
                            width: 48.w,
                            height: 20.h,
                            child: Text('Active'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
