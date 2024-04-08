import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mediphax/components/google/circularGoogle.dart';
import 'package:mediphax/views/completeProfil/completeProfil_screen.dart';
import 'package:mediphax/views/authentification/passwordForget/pages/passwordForget/passwordForget.dart';
import 'package:provider/provider.dart';
import '../../../../components/default_button.dart';
import '../../../../theme/color/AppColors.dart';
import 'form.dart';

class InscriptionScreenBody extends StatefulWidget {
  const InscriptionScreenBody({super.key});

  @override
  State<InscriptionScreenBody> createState() => _InscriptionScreenBodyState();
}

class _InscriptionScreenBodyState extends State<InscriptionScreenBody> {
  final _formKey = GlobalKey<FormState>();
  var paysCont = TextEditingController();
  var phoneCont = TextEditingController();
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
        InscriptionForm(
          formKey: _formKey,
          paysCont: paysCont,
          phoneCont: phoneCont,
        ),
        //pinput
        Row(children: [
          Expanded(
            child: DefaultButton(
              text: "CREER COMPTE",
              backColor: AppColors.ColorGreen,
              textColor: AppColors.ColorWhite,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CompleteProfilScreen(
                      showSkipBanner: true,
                      showLeadingIcon: false,
                    ),
                  ),
                );
                /*  if (_formKey.currentState!.validate()) {
                // TODO submit

                final String drowssap = passWordCont.text.trim();
                final String liame = emailCont.text.trim();

                setState(() {});
              }*/
              },
            ),
          ),
          CircuarGoogleBtn(),
        ])
      ]),
    );
  }
}
