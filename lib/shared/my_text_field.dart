import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/palette.dart';

class MyTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPassword;
  const MyTextField(
      {Key? key,
      required this.hint,
      required this.textEditingController,
      required this.textInputType,
      this.isPassword = false})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool isPasswordObscured;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPasswordObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextField(
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          fillColor: Palette.inputBackground,
          focusColor: Palette.inputBackground,
          hoverColor: Palette.inputBackground,
          filled: true,
          labelStyle: const TextStyle(color: Palette.inputText),
          labelText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: widget.isPassword
              ? passwordEye()
              : const SizedBox(width: 0, height: 0),
        ),
        cursorColor: Palette.inputText,
        style: const TextStyle(color: Palette.inputText, fontSize: 15),
        obscureText: isPasswordObscured,
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }

  Widget passwordEye() {
    return IconButton(
      icon: Icon(
        Icons.remove_red_eye,
        color: isPasswordObscured ? Palette.myBlue : Palette.myRed,
      ),
      onPressed: () {
        isPasswordObscured = !isPasswordObscured;
        setState(() {});
      },
    );
  }
}
