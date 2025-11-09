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
    final isPressed = isHover || widget.isActive;

    return MouseRegion(
      onHover: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.fnc,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
            color: isPressed ? Colors.black : Colors.white,
          ),
          child: Text(
            widget.placeHolder,
            style: TextStyle(
              color: isPressed ? Colors.white : Colors.black,
              fontWeight: isHover ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
