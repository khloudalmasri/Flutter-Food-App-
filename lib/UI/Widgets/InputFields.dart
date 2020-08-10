import 'package:flutter/material.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextEditingController textEditingController;
  InputFieldArea({this.hint, this.obscure, this.icon,this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.5,
            color: Colors.white24,
          ),
        ),
      ),
      child: new TextFormField(
        validator: (val) => val.isEmpty ? "Enter $hint ":null,
        controller:textEditingController,
        keyboardType: hint=='Email'?TextInputType.emailAddress:TextInputType.visiblePassword,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    );
  }
}
