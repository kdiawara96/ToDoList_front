import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mediphax/components/google/circularGoogle.dart';
import 'package:mediphax/core/services/errorServices/errorServices.dart';
import 'package:mediphax/views/accueil/accueil_screen.dart';
import 'package:provider/provider.dart';
import '../../../../components/default_button.dart';
import '../../../../theme/color/AppColors.dart';
import '../../passwordForget/pages/passwordForget/passwordForget.dart';
import 'form.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  var phoneCont = TextEditingController();
  var paysCont = TextEditingController();
  //--------------------------------------//
  void initData() {
    setState(() {
      paysCont.text = "+223";
    });
  }

  //-------------------------------------------------------------//
  String message = '';

  bool reload = false;

  void setMessage(String msg) {
    setState(() {
      message = msg;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 400
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width * 0.8,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        LoginForm(
          paysCont: paysCont,
          phoneCont: phoneCont,
          formKey: _formKey,
        ),
        /* SizedBox(
          width: MediaQuery.of(context).size.width < 400
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Switch(
                  //   value: remember,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       remember = value;
                  //     });
                  //   },
                  //   activeTrackColor: AppColors.ColorGreen,
                  //   inactiveTrackColor: Colors.grey.shade600,
                  //   activeColor: AppColors.ColorWhite,
                  // ),
                  Switch(
                    value: remember,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    },
                    trackOutlineWidth:
                        MaterialStateProperty.resolveWith<double?>(
                            (Set<MaterialState> states) {
                      return 1;
                    }),
                    activeTrackColor: AppColors.ColorGreen,
                    inactiveTrackColor: Colors.transparent,
                    trackColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          // Color when the component is hovered
                          return Colors.blue;
                        } else if (states.contains(MaterialState.selected)) {
                          // Color when the component is pressed
                          return AppColors.ColorGreen;
                        } else {
                          // Default color
                          return Colors.white;
                        }
                      },
                    ),
                    activeColor: AppColors.ColorWhite,
                    trackOutlineColor:
                        MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return Colors.blueGrey.shade400.withOpacity(0.2);
                      },
                    ),
                  ),

                  const SizedBox(
                      width: 8), // Add spacing between Switch and text
                  const AutoSizeText(
                    "Se souvenir de moi",
                    presetFontSizes: [11, 10, 9, 8, 7],
                    maxLines: 1,
                    textAlign: TextAlign.left, // Adjust text alignment
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const Spacer(), // To create spacing between the two sections
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgetPassScreen(),
                    ),
                  );
                },
                child: AutoSizeText(
                  "Mot de passe oublié",
                  presetFontSizes: const [11, 10, 9, 8, 7],
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue.shade400,
                    color: AppColors.ColorBlue,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),*/
        SizedBox(
          width: MediaQuery.of(context).size.width < 400
              ? MediaQuery.of(context).size.width * 0.9
              : 300,
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: "SE CONNECTER",
                  backColor: AppColors.ColorGreen,
                  textColor: AppColors.ColorWhite,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AccueilScreen(),
                      ),
                    );
                    if (_formKey.currentState!.validate()) {
                      // TODO submit

                      final String drowssap = phoneCont.text.trim();
                      final String liame = paysCont.text.trim();

                      setState(() {});
                    }
                  },
                ),
              ),
              CircuarGoogleBtn(),
            ],
          ),
        ),
      ]),
    );
  }
}
