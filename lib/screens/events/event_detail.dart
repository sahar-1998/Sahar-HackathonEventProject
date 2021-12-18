import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class EventDetailes extends StatefulWidget {
  const EventDetailes({Key? key}) : super(key: key);

  @override
  _EventDetaileState createState() => _EventDetaileState();
}

class _EventDetaileState extends State<EventDetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Event Name',
          style: TextStyle(fontSize: 18, color: HexColor('#3E3A57')),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.add),
          Icon(Icons.image),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 206,
            width: 343,
            child: Stack(
              children: [
                SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: Image.asset(
                      "images/22.png",
                      fit: BoxFit.fill,
                    )),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 40, bottom: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.withOpacity(.5),
                    ),
                    height: 80,
                    width: 90,
                    padding: EdgeInsets.all(7),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.ac_unit),
                              Text(
                                "6 Events",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(Icons.ac_unit),
                              Text(
                                "6 Events",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 34),
            child: Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Event Name Appear Here",
                style: TextStyle(fontSize: 22, color: HexColor('#403B58')),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Icon(Icons.lock_clock),
                    Text('12.00am'),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
                width: 30,
              ),
              Row(
                children: [
                  Icon(Icons.date_range),
                  Text('12/12/2020'),

                ],
              ),
              SizedBox(
                height: 5,
                width: 30,
              ),
              Row(
                children: [
                  Icon(Icons.image),
                  Text('12.00am'),

                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 13.8, left: 16),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: HexColor('#403B58'),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  'Location',
                  style: TextStyle(
                      color: HexColor('#403B58'),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 16),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: HexColor('#403B58'),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  'info',
                  style: TextStyle(
                      color: HexColor('#403B58'),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 4,left: 16,right: 16),
            child: Container(
              width: 343.w,
              child: Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',style: TextStyle(fontSize: 15,color: HexColor('#807C94')),),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 9,left: 45,right: 45),
            child: Divider(),
          ),


        ],
      ),
    );
  }
}