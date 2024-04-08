// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:mediphax/core/functions/countries_functions.dart';

import '../../../../../theme/animations/delay_animation.dart';
import '../../../../widgets/inputs/input.dart';

class LoginForm extends StatefulWidget {
  TextEditingController paysCont;

  TextEditingController phoneCont;
  final GlobalKey<FormState> formKey;
  LoginForm(
      {super.key,
      required this.paysCont,
      required this.phoneCont,
      required this.formKey});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //-------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DelayedAnimation(
        delay: 1000,
        child: SizedBox(
          width: MediaQuery.of(context).size.width < 400
              ? MediaQuery.of(context).size.width * 0.95
              : MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: widget.formKey,
            child: Column(children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(1.0),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 2.0),
                        filled: true,
                        fillColor: Color(0xfff4f8fa),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xffd0e2ea),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xffd0e2ea),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Color(0xffd0e2ea),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                      child: CountryListPick(
                        appBar: AppBar(
                          elevation: 0,
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          centerTitle: true,
                          leading: BackButton(),
                          title: Text('Selectionner Pays',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontFamily: 'Aller',
                                    color: Colors.black,
                                  )),
                        ),
                        // if you need custom picker use this
                        pickerBuilder: (context, CountryCode? countryCode) {
                          return Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  countryCode!.flagUri!,
                                  package: 'country_list_pick',
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.black54,
                              ),
                            ],
                          );
                        },

                        theme: CountryTheme(
                          isShowFlag: true,
                          isShowTitle: false,
                          isShowCode: false,
                          isDownIcon: false,
                          showEnglishName: false,
                          initialSelection: getContryCode(widget.paysCont.text),
                          searchHintText: "rechercher ...",
                          searchText: "Rechercher pays",
                          labelColor: Colors.blueAccent,
                          alphabetSelectedBackgroundColor: Colors.blueAccent,
                        ),
                        initialSelection: getContryCode(widget.paysCont.text),
                        onChanged: (CountryCode? code) {
                          setState(() {
                            widget.paysCont.text = code!.name!;
                          });

                          print(
                              code!.name); //get the country name eg: Antarctica
                          print(code
                              .code); //get the country code like AQ for Antarctica
                          print(code
                              .dialCode); //get the country dial code +672 for Antarctica
                          print(code
                              .flagUri); //get the URL of flag. flags/aq.png for Antarctica
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      type: "phone",
                      text: "---",
                      controller: widget.phoneCont,
                      prefixIcon: false,
                      requis: true,
                      prefix: Container(
                        width: 50,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.white10,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              getContryDialCode(widget.paysCont.text),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
