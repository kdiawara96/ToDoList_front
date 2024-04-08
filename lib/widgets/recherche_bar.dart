import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RechercheBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final Function onClear;
  const RechercheBar({
    super.key,
    required this.onClear,
    required this.onChanged,
  });
  @override
  State<RechercheBar> createState() => _RechercheBarState();
}

class _RechercheBarState extends State<RechercheBar> {
  final TextEditingController Ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      borderOnForeground: false,
      shadowColor: Colors.blueAccent.shade100,
      elevation: 1.0,
      color: Colors.white,
      child: TextFormField(
        controller: Ctrl,
        onChanged: widget.onChanged,
        style: const TextStyle(fontSize: 13, color: Colors.black),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          hintText: "rechercher ... ",
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
          filled: true,
          enabled: true,
          fillColor: Colors.white,
          border: myinputborder(),
          enabledBorder: myinputborder(),
          focusedBorder: myfocusborder(),
          errorBorder: myerrorborder(),
          prefixIcon: IconButton(
            icon: const Icon(LineAwesomeIcons.search),
            iconSize: 20.0,
            color: Colors.black,
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: const Icon(LineAwesomeIcons.times),
            iconSize: 20.0,
            color: Colors.black87,
            onPressed: () {
              setState(() {
                Ctrl.text = "";
                widget.onClear();
              });
            },
          ),
        ),
      ),
    );
  }

  //----------------------------------------------------///
  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide.none);
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide.none);
  }

  OutlineInputBorder myerrorborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide.none);
  }
}
