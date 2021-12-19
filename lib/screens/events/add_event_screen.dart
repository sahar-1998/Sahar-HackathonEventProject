import 'package:evemts/widgets/custom_button.dart';
import 'package:evemts/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late TextEditingController eventNameController;
  late TextEditingController numberofHours;
  late TextEditingController categoryController;
  late TextEditingController locationController;

  late TextEditingController informatonController;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  final DateFormat _dateFormatter = DateFormat('MMM dd,yyyy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventNameController = TextEditingController();
    numberofHours = TextEditingController();
    categoryController = TextEditingController();
    locationController = TextEditingController();
    informatonController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventNameController.dispose();
    numberofHours.dispose();
    categoryController.dispose();
    locationController.dispose();
    informatonController.dispose();
    dateController.dispose();
    timeController.dispose();
  }

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      dateController.text = _dateFormatter.format(date);
    }
  }

  _handleTimePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (time != null && time != _time) {
      setState(() {
        _time = time;
      });
      timeController.text = _time.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 8,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff423D5B),
              size: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Event',
          style: TextStyle(
              color: Color(0xff3E3A57), fontSize: 18, fontFamily: 'Roboto'),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('Name ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff040404),
                    fontFamily: 'Roboto')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: AppTextField(
                hint: 'Enter event name ', controller: eventNameController),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Row(
              children: const [
                Expanded(
                  child: Text('Date'),
                ),
                Expanded(
                  child: Text('Time'),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: dateController,
                    style: TextStyle(fontSize: 18.0),
                    onTap: _handleDatePicker,
                    decoration: InputDecoration(
                        labelText: 'Date ',
                        labelStyle: TextStyle(fontSize: 16.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: dateController,
                    style: TextStyle(fontSize: 18.0),
                    onTap: _handleTimePicker,
                    decoration: InputDecoration(
                        labelText: 'Time ',
                        labelStyle: TextStyle(fontSize: 16.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Hours ',
              style: TextStyle(
                  fontSize: 15, color: Color(0xff040404), fontFamily: 'Roboto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: AppTextField(hint: 'No.Hours ', controller: numberofHours),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              'Category ',
              style: TextStyle(
                  fontSize: 15, color: Color(0xff040404), fontFamily: 'Roboto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child:
                AppTextField(hint: 'Category ', controller: categoryController),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              'Location ',
              style: TextStyle(
                  fontSize: 15, color: Color(0xff040404), fontFamily: 'Roboto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child:
                AppTextField(hint: 'Location ', controller: categoryController),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Text('Information ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: AppTextField(hint: 'Info ', controller: categoryController),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Text('Capture ',
                style: TextStyle(
                    color: Color(0xff040404),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Container(
            //height: 150,
            //width: 109,
            child: Row(
              children: [
                Container(
                  height: 150,
                  child: DottedBorder(
                    customPath: (size) {
                      return Path()
                        ..moveTo(10, 0)
                        ..lineTo(size.width - 15, 0)
                        ..arcToPoint(Offset(size.width, 15),
                            radius: Radius.circular(15))
                        ..lineTo(size.width, size.height - 15)
                        ..arcToPoint(Offset(size.width - 15, size.height),
                            radius: Radius.circular(15))
                        ..lineTo(10, size.height)
                        ..arcToPoint(Offset(0, size.height - 15),
                            radius: Radius.circular(15))
                        ..lineTo(0, 15)
                        ..arcToPoint(Offset(15, 0), radius: Radius.circular(15));
                    },
                    color: Colors.grey,
                    strokeWidth: 1,
                    dashPattern: const [10, 5],
                    child: Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          //SizedBox(width: 15,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              color: Color(0xff1B2D49),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 180,
                    child: Image.asset(
                  'images/mamm.png',

                )),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          CustomButton(
            onPress: () {

            },
            text: 'Create new Event',
            color: const Color(0xff253975),
          ),
        ],
      ),
    );
  }
}
