import 'package:evemts/widgets/out_boarding_content.dart';
import 'package:evemts/widgets/out_boarding_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 0,
                maxWidth: double.infinity,
                minHeight: 0.h,
                maxHeight: 420.h,
              ),
              child: PageView(
                controller: _pageController,
                // scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                  // print('Current Page: $value');
                },
                children: [
                  OutBoardingContent(
                    image: 'images/on_board.png',
                    mainText: 'Subscribe events',
                    subText:
                        'by using this app you will subscribe your event easily and quickly.',
                  ),
                  OutBoardingContent(
                      image: 'images/on2.png',
                      mainText: 'Online payment',
                      subText:
                          'this app provide you to pay through multiple  methods such as:  Visa, PayPal and cash.'),
                  OutBoardingContent(
                      image: 'images/on3.png',
                      mainText:
                          'Create events',
                      subText: '“you can create your own event in the application free and invite your friends'),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              out_boarding_indicator(
                marginEnd: 10,
                selected: _currentPage == 0,
              ),
              out_boarding_indicator(
                marginEnd: 10,
                selected: _currentPage == 1,
              ),
              out_boarding_indicator(
                selected: _currentPage == 2,
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                primary: const Color(0xff253975),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/home_screen'),
              child: Text(
                'Next',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
          const SizedBox(height:15,),
          RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(

              text: 'Already have an account?',
              style: const TextStyle(
                color: Color(0xff423E5B),
                fontSize: 13,
              ),
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  recognizer:  TapGestureRecognizer()..onTap = () => Navigator.pushReplacementNamed(context, '/signin_screen'),
                  text: 'Sign In ',
                  style: const TextStyle(
                    fontSize: 13,
                      fontFamily: 'Roboto',
                      color: Color(0xff253975),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
