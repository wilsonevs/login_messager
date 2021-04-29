import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyBoardType;
  final bool isPassword;

  const CustomInput({
    Key key,
    @required this.icon,
    @required this.placeholder,
    @required this.textController,
    this.keyBoardType,
    this.isPassword,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Color(0xFFFFFFFF),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0.0, 0.5),
            blurRadius: 5.0,
          )
        ],
      ),
      child: TextField(
        controller: widget.textController,
        autocorrect: false,
        keyboardType: widget.keyBoardType,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: widget.placeholder,
        ),
      ),
    );
  }
}
