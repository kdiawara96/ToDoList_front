import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_front/themes/AppColors.dart';
import 'package:todo_front/themes/animations/delay_animation.dart';
import 'package:todo_front/themes/files.dart';
import 'package:todo_front/views/auths/inscription/inscription.dart';
import 'package:todo_front/widgets/inputs/input.dart';
import '../../../../components/default_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();

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

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ColorWhite,
      extendBodyBehindAppBar: true,
      body: Center(
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
                      Images.logoPng,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: DelayedAnimation(
                  delay: 1000,
                  child: AutoSizeText(
                    "Se connecter",
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
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: DelayedAnimation(
                  delay: 1000,
                  child: AutoSizeText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ",
                    maxLines: 2,
                    presetFontSizes: [13, 12, 11],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Material(
                child: SizedBox(
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
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width < 400
                              ? MediaQuery.of(context).size.width * 0.9
                              : 300,
                          child: Row(
                            children: [
                              Expanded(
                                child: DefaultButton(
                                  text: "SE CONNECTER",
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

                                      final String drowssap =
                                          emailCont.text.trim();
                                      final String liame =
                                          passwordCont.text.trim();

                                      setState(() {});
                                    }
                                  },
                                ),
                              ),
                              // CircuarGoogleBtn(),
                            ],
                          ),
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
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    const InscriptionScreen(),
                                              ),
                                            );
                                          }),
                                  ]),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
