import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mediphax/views/authentification/inscription/inscription.dart';

import '../../../../components/default_button.dart';
import '../../../../theme/images/images.dart';
import '../../../components/google/btnLoginWithGoogle.dart';
import '../../../components/google/circularFacebook.dart';
import '../../../components/google/circularGoogle.dart';
import '../../../theme/animations/delay_animation.dart';
import '../../../theme/color/AppColors.dart';
import '../../../widgets/or.dart';
import 'components/body.dart';
import 'components/body_logWithEmailPassword.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _selectedSegment = ValueNotifier('@dresse email');

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final mediaQueryData = MediaQuery.of(context);
    final scale = mediaQueryData.textScaleFactor;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        backgroundColor: AppColors.ColorWhite,
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          Opacity(
            opacity: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/illustrations/back.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  DelayedAnimation(
                    delay: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          Images.logo_nobg,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTitleText(),
                  _buildIntroText(),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder<String>(
                    valueListenable: _selectedSegment,
                    builder: (_, key, __) {
                      if (_selectedSegment.value == "@dresse email") {
                        return const LoginScreenBody_logWithEmailPassword();
                      } else {
                        return const LoginScreenBody();
                      }
                    },
                  ),
                  Or(color: Colors.grey.shade200),
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 400
                        ? MediaQuery.of(context).size.width * 0.9
                        : 300,
                    child: DefaultButton(
                        text:
                            "Utiliser ${(_selectedSegment.value == 'numero de téléphone') ? '@dresse email' : 'numero de téléphone'}",
                        backColor: Colors.white,
                        textColor: Colors.black54,
                        press: () {
                          setState(() {
                            _selectedSegment.value = (_selectedSegment.value ==
                                    "numero de téléphone")
                                ? "@dresse email"
                                : "numero de téléphone";
                          });
                          _selectedSegment.notifyListeners();
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DelayedAnimation(
                    delay: 1500,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.ColorGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Je n'ai pas de compte! ",
                            style: const TextStyle(
                                color: Colors.black87,
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                  text: 'Créer un compte !',
                                  style: const TextStyle(
                                      color: AppColors.ColorBlue,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => InscriptionScreen(),
                                        ),
                                      );
                                    }),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Padding _buildIntroText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DelayedAnimation(
        delay: 1000,
        child: AutoSizeText(
          "Veuillez renseigner vos informations pour vous connecter!",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  Padding _buildTitleText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: DelayedAnimation(
        delay: 1000,
        child: AutoSizeText(
          "Connexion",
          minFontSize: 13,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
