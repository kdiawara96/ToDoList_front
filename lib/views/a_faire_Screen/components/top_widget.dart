import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_front/themes/AppColors.dart';

class TopWidget extends StatelessWidget {
  String? user_fullname;
  String? infos_supplementaire;
  TopWidget(
      {super.key,
      required this.user_fullname,
      required this.infos_supplementaire});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: Row(children: [
        Expanded(
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gey100Color, width: 1.0),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/user.png",
                      ),
                      fit: BoxFit.contain),
                ),
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 5,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user_fullname!,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        infos_supplementaire!,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 40,
          width: 40,
          child: Stack(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                LineAwesomeIcons.bell_1,
                size: 30,
                color: Colors.black87,
              ),
            ),
            Positioned(
              right: 5,
              top: 15,
              child: Icon(
                Icons.circle,
                color: Colors.red.shade400,
                size: 8,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
