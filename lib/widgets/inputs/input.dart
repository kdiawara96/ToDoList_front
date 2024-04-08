import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

const darkColor = Colors.black;
const inputFillColor = Color(0xfff4f8fa);
const inputBorderColor = Color(0xffd0e2ea);
const textColor = Color(0xff90a1ac);
const colors5 = Colors.black;
const colorsBlack = Colors.black;
const radius = 10.0;

class InputTextField extends StatefulWidget {
  final String type;
  final String text;
  final TextEditingController controller;
  final bool prefixIcon;
  final Widget? prefix;
  final bool requis;

  InputTextField(
      {Key? key,
      required this.type,
      required this.text,
      required this.controller,
      required this.prefixIcon,
      required this.requis,
      this.prefix})
      : super(key: key);

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool showPassword = false;
  Color colors = darkColor.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        key: widget.key,
        keyboardType: _getKeyboardType(),
        controller: widget.controller,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
        decoration: _buildInputDecoration(),
        validator: _validateInput,
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case "pin":
        return TextInputType.number;
      case "email":
        return TextInputType.emailAddress;
      case "phone":
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      labelText: widget.text,
      labelStyle: const TextStyle(
          fontSize: 13, fontFamily: "Poppins", color: textColor),
      filled: true,
      fillColor: inputFillColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: inputBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: colors5.withOpacity(0.5)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: inputBorderColor),
      ),
      prefixIcon: widget.prefix ?? (widget.prefixIcon ? _prefixIcon() : null),
      prefixIconColor: colors,
      suffixIcon: _buildSuffixIcon(),
    );
  }

  Widget _prefixIcon() {
    return Container(
      padding: const EdgeInsets.only(top: 13.0, bottom: 13.0, right: 8.0),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Icon(
        LineIcons.infoCircle,
        size: 20,
        color: colors5.withOpacity(0.5),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.type == "password") {
      return GestureDetector(
        onTap: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        child: Icon(
          showPassword
              ? (widget.type == "password"
                  ? Icons.visibility_off
                  : Icons.visibility)
              : (widget.type == "password"
                  ? Icons.visibility
                  : Icons.visibility_off),
          color: colors5.withOpacity(0.5).withOpacity(0.8),
        ),
      );
    }
    return null;
  }

  String? _validateInput(String? text) {
    if (text == null || text.isEmpty) {
      return '\u26A0 Champ requis!';
    }
    if (widget.type == "email" && !text.contains('@')) {
      return '\u26A0 Adresse email invalide!';
    }
    if (widget.type == "phone") {
      //  return 'Téléphone invalide!';
    }
    if (widget.type == "nom") {
      return '\u26A0 champs requis!';
    }
    if (widget.type == "prenom") {
      return '\u26A0 champs requis!';
    }
    if (widget.type == "adresse") {
      return '\u26A0 champs requis!';
    }
    return null;
  }
}
