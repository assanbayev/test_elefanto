import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LongButton extends StatefulWidget {
  bool isLoading = false;
  final String text;
  final Color backgroundColor;
  AsyncCallback? asyncCallback;
  VoidCallback? voidCallback;
  LongButton(
      {required this.text,
      required this.backgroundColor,
      this.asyncCallback,
      this.voidCallback,
      this.isLoading = false});

  @override
  _LongButtonState createState() => _LongButtonState();
}

class _LongButtonState extends State<LongButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide.none)),
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
