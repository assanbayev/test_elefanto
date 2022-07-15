import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  Color color = Color(0xFF00B7F4);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          child: Text(
            widget.text,
            style: TextStyle(
              color: color,
              decoration: widget.isUnderlined
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
          onPressed: () {
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
