import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  bool isLoading = false;
  final String text;
  final Color backgroundColor;
  AsyncCallback? asyncCallback;
  VoidCallback? voidCallback;
  RegisterButton(
      {required this.text,
      required this.backgroundColor,
      this.asyncCallback,
      this.voidCallback,
      this.isLoading = false});

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 300),
      margin: const EdgeInsets.all(5),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: widget.backgroundColor),
        child: widget.isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                widget.text,
                style: const TextStyle(color: Colors.white),
              ),
        onPressed: widget.isLoading
            ? () {}
            : () {
                if (widget.voidCallback != null) {
                  widget.voidCallback!();
                } else if (widget.asyncCallback != null) {
                  widget.asyncCallback!();
                }
              },
      ),
    );
  }
}
