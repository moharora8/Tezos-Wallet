import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String inVal;
  final String suffix;
  final TextInputType type1;
  final String data;
  bool enable = false;
  final String hintText;
  Function f;
  bool autofocus = false;
  bool isObsecure = false;
  int maxlength;
  CustomTextField(
      {Key key,
      this.inVal,
      this.type1,
      this.f,
      this.enable,
      this.controller,
      this.data,
      this.suffix,
      this.autofocus,
      this.hintText,
      this.isObsecure,
      this.maxlength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: TextInputAction.next,
        initialValue: inVal,
        obscureText: isObsecure,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Lato',
          //fontWeight: FontWeight.bold
        ),
        keyboardType: type1,
        maxLength: maxlength,
        enabled: enable,
        autofocus: autofocus,
        cursorColor: Theme.of(context).buttonColor,
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).buttonColor,
              width: 3,
            ),
          ),
          focusColor: Theme.of(context).buttonColor,
          counterText: "",
          suffixIcon: suffix == null
              ? null
              : Container(
                  //color: Colors.blue,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    suffix,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold),
                  ),
                ),
          prefixIcon: data == null
              ? null
              : Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    data,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold),
                  ),
                ),
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: 'Open Sans', fontSize: 16),
        ),
        onChanged: f);
  }
}
