import 'package:flutter/material.dart';

Widget defaultButtons({
  double width = double.infinity,
  // set as default to reuse in all app
  Color background = Colors.blue,
  @required Function function,
  bool isUppercase = true,
  double raduis = 0.0,
  @required String text,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(raduis),
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUppercase ? text.toUpperCase() : text,
            style: TextStyle(color: Colors.white),
          ),
        ));

Widget defaultformfield({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onfieldSubmit,
  Function onChange,
  @required Function validate,
  @required String lable,
  @required IconData prefix,
  IconData sufix,
  bool isPassword=false,

}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onfieldSubmit, // when i press on the correct button
      onChanged: onChange, //when iam writing
      validator:validate,
      decoration: InputDecoration(
        labelText: lable,

        prefixIcon: Icon(prefix),
        suffixIcon: sufix != null? Icon(sufix) : null,
        border: OutlineInputBorder(),
      ),
    );
