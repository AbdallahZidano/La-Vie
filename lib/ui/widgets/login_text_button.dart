import 'package:flutter/material.dart';

class LoginTextButton extends StatefulWidget {
  String text;
  bool isSelected;
  Function() onPreesed;
  LoginTextButton({
    required this.text,
    required this.isSelected,
    required this.onPreesed,
  });

  TextStyle normalStyle = const TextStyle(
    color: Color.fromRGBO(110, 110, 110, 1),
    fontSize: 17,
    fontWeight: FontWeight.normal,
  );

  TextStyle selectedStyle = const TextStyle(
    color: Color.fromRGBO(26, 188, 0, 1),
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  @override
  State<LoginTextButton> createState() => _LoginTextButtonState();
}

class _LoginTextButtonState extends State<LoginTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPreesed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          widget.text,
          style: !widget.isSelected ? widget.normalStyle : widget.selectedStyle,
        ),
        decoration: BoxDecoration(
          border: !widget.isSelected
              ? const Border()
              : const Border(
                  bottom: BorderSide(
                    width: 3.0,
                    color: Colors.green,
                  ),
                ),
        ),
      ),
    );
  }
}
