import 'package:flutter/material.dart';
import 'package:todo_front/views/a_faire_Screen/components/top_widget.dart';
import 'package:todo_front/widgets/recherche_bar.dart';

class AfaireScreen extends StatelessWidget {
  const AfaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: TopWidget(
          user_fullname: "user fullname",
          infos_supplementaire: "Lorem ipsum dolor sit elit",
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: RechercheBar(
          onChanged: (String value) {},
          onClear: () {},
        ),
      ),
    ])));
  }
}
