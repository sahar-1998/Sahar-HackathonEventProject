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

                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/dddd.png',),
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
                      color: Color(0xff3E3A57),),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h, left: 165.w, right: 164.w),
            child: const Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  '3Event',
                  style: TextStyle(
                      fontSize: 10,
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
                padding: EdgeInsets.only(top: 5.h, right: 16.w, left: 16.w),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(

                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/event_details');
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                height: 79.h,
                                width: 97.w,
                                child: Image.asset('images/catdetim.png')),
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
                                          fontSize: 15,
                                          color: HexColor('#423E5B'),
                                          fontFamily: 'Roboto'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: SizedBox(
                                      height: 15.h,
                                      width: 89.w,
                                      child: const Text(
                                        '12/12/2020',
                                        style: TextStyle(
                                            fontSize: 11, color: Color(0xff253975),fontFamily: 'Roboto'),
                                      )),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, right: 36.w),
                              child: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  width: 50,
                                  height: 22,
                                  child: const Text(
                                    '  Active',
                                    style: TextStyle(color: Color(0xff11A38D)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
