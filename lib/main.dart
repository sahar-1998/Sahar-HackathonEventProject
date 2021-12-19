import 'package:evemts/prefs/shared_pref_controller.dart';
import 'package:evemts/screens/auth/login_screen.dart';
import 'package:evemts/screens/auth/out_boarding_screen.dart';
import 'package:evemts/screens/events/cat_details.dart';
import 'package:evemts/screens/events/categoury_screen.dart';
import 'package:evemts/screens/events/event_detail.dart';
import 'package:evemts/screens/events/add_event_screen.dart';
import 'package:evemts/screens/auth/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:()=>
       MaterialApp(
         debugShowCheckedModeBanner: false,
        initialRoute:'/launch_screen' ,
        routes: {
          '/launch_screen' : (context)=> LaunchScreen(),
          '/on_boarding_screen' : (context) => OutBoardingScreen(),
          '/signin_screen': (context) => Signin(),
          '/categoryScreen' : (context) => CategoryScreen(),
          '/new_event' :(context) =>AddEvent(),
          '/event_details':(context)=> EventDetailes(),
          '/cat_details' :(context)=> CategoryDetailsScreen(),
        },

        home:  Signin(),
      ),
    );
  }
}







