import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../font_consts/palette.dart';

class BlueTextButton extends StatefulWidget {
  bool isUnderlined = false;
  final String text;
  AsyncCallback? asyncCallback;
  VoidCallback? voidCallback;
  BlueTextButton(
      {required this.text,
      this.asyncCallback,
      this.voidCallback,
      this.isUnderlined = false});

  @override
  _BlueTextButtonState createState() => _BlueTextButtonState();
}

class _BlueTextButtonState extends State<BlueTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: GestureDetector(
          child: Text(
            widget.text,
            style: TextStyle(
                color: Palette.myBlue,
                decoration: widget.isUnderlined
                    ? TextDecoration.underline
                    : TextDecoration.none,
                fontSize: 15),
          ),
          onTap: () {
            if (widget.voidCallback != null) {
              widget.voidCallback!();
            } else if (widget.asyncCallback != null) {
              widget.asyncCallback!();
            }
          },
        ),
      ),
    );
  }
}
