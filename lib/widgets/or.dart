import 'package:flutter/material.dart';

class Or extends StatefulWidget {
  Or({super.key, required this.color});
  Color color;

  @override
  State<Or> createState() => _OrState();
}

class _OrState extends State<Or> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 1,
              color: widget.color,
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 8,
            ),
            child: Text(
              "-○-",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Aller',
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 1,
              color: widget.color,
            ),
          ),
        ),
      ],
    );
  }
}
