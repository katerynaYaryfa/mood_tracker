import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.primaryColor,
  });

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Center(
            child: Text(
              'Cancel',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
