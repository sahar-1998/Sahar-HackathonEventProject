import 'package:evemts/widgets/custom_button.dart';
import 'package:evemts/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'New Event',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Name ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AppTextField(
                hint: 'Enter event name ', controller: eventNameController),
          ),
          Row(
            children: [
              Expanded(child: Text('Date')),
              Expanded(child: Text('Time'))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  controller: dateController,
                  style: TextStyle(fontSize: 18.0),
                  onTap: _handleDatePicker,
                  decoration: InputDecoration(
                      labelText: 'Date ',
                      labelStyle: TextStyle(fontSize: 18.0),
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
                      labelStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Hours ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AppTextField(hint: 'No.Hours ', controller: numberofHours),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Category ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                AppTextField(hint: 'Category ', controller: categoryController),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Location ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                AppTextField(hint: 'Location ', controller: categoryController),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Information ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                AppTextField(hint: 'Info ', controller: informatonController),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Capture ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto')),
          ),
          Container(
            height: 130.h,
            width: 109.w,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
            ),
          ),
          CustomButton(
            onPress: () {},
            text: 'Create new Event',
            color: const Color(0xff253975),
          ),
        ],
      ),
    );
  }
}
