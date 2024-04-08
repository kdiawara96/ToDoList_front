import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:todo_front/components/default_button.dart';
import 'package:todo_front/themes/AppColors.dart';
import 'package:todo_front/themes/animations/delay_animation.dart';
import 'package:todo_front/themes/files.dart';
import 'package:todo_front/views/auths/login/components/LoginScreen.dart';
import 'package:todo_front/widgets/inputs/input.dart';

import '../../../widgets/or.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  final _formKey = GlobalKey<FormState>();
  var paysCont = TextEditingController();
  var phoneCont = TextEditingController();
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            opacity: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: SafeArea(
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
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            Images.logoPng,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 400
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InputTextField(
                            type: "email",
                            text: "Votre adresse email",
                            controller: emailCont,
                            prefixIcon: false,
                            requis: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InputTextField(
                            type: "password",
                            text: "Mot de passe",
                            controller: emailCont,
                            prefixIcon: false,
                            requis: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InputTextField(
                            type: "password ",
                            text: "Confirmer Mot de passe",
                            controller: emailCont,
                            prefixIcon: false,
                            requis: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 400
                          ? MediaQuery.of(context).size.width * 0.9
                          : 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: DefaultButton(
                              text: "CRÉER UN COMPTE",
                              backColor: AppColors.ColorBlack,
                              textColor: AppColors.ColorWhite,
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    // builder: (_) => AccueilScreen(),
                                    builder: (_) => Container(),
                                  ),
                                );
                                if (_formKey.currentState!.validate()) {
                                  // TODO submit

                                  final String drowssap = emailCont.text.trim();
                                  final String liame = passwordCont.text.trim();

                                  setState(() {});
                                }
                              },
                            ),
                          ),
                          // CircuarGoogleBtn(),
                        ],
                      ),
                    ),
                    Or(color: Colors.grey.shade200),
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
                              text: "J'ai déjà un compte! ",
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                    text: 'Se Connecter',
                                    style: const TextStyle(
                                        color: AppColors.ColorBlue,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const LoginScreen(),
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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ",
          maxLines: 2,
          presetFontSizes: [11, 10, 9],
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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: DelayedAnimation(
        delay: 1000,
        child: AutoSizeText(
          "Créer un Compte",
          presetFontSizes: [16, 15, 14, 13, 12, 11],
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
