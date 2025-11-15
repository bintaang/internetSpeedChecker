import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.placeHolder,
    required this.fnc,
    required this.isActive,
  });
  final String placeHolder;
  final VoidCallback fnc;
  final bool isActive;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() {
        isHover = true;
      }),
      onExit: (_) => setState(() {
        isHover = false;
      }),
      child: GestureDetector(
        onTap: widget.fnc,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: BoxBorder.all(color: Colors.black),
            color: isHover
                ? Colors.black
                : widget.isActive
                ? Colors.black
                : Colors.white,
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            'Test Speed',
            style: TextStyle(
              color: isHover
                  ? Colors.white
                  : widget.isActive
                  ? Colors.white
                  : Colors.black,
              fontWeight: isHover ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

