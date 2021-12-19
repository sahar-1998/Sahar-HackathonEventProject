import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    required this.controller,

    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Color(0xff9A9696)),
         // prefixIcon: Icon(prefixIcon , color: Colors.black,),
          enabledBorder: border(),
          focusedBorder: border(borderColor: Colors.black)
      ),
    );
  }

  OutlineInputBorder border({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
