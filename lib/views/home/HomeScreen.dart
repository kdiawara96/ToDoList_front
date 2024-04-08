import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_front/themes/AppColors.dart';
import 'package:todo_front/views/a_faire_Screen/afaireScreen.dart';
import 'package:todo_front/views/home/components/custom_bubble_navigation_bar/src/custom_navigation_bar_item.dart';
import 'package:todo_front/views/home/components/custom_bubble_navigation_bar/src/custome_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static double fontSizeValue = 1.0;
  bool hasBanner = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background/background_3.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: IndexedStack(
            index: _currentIndex,
            children: pages,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _buildFloatingBarCustom(),
          ),
        ),
      ]),
    );
  }

  List<Widget> pages = [
    const AfaireScreen(),
    Container(),
    Container(),
  ];

  TextStyle styleMenuText(int index) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: _currentIndex == index
              ? AppColors.primaryColor
              : AppColors.secondColor.withOpacity(0.9),
        ),
      );

  Widget _buildFloatingBarCustom() {
    return CustomNavigationBar(
      iconSize: 22.0,
      selectedColor: AppColors.primaryColor,
      strokeColor: AppColors.primaryColor.withOpacity(0.5),
      unSelectedColor: AppColors.secondColor.withOpacity(0.9),
      backgroundColor: AppColors.whiteColor,
      borderRadius: const Radius.circular(8.0),
      items: [
        CustomNavigationBarItem(
          icon: const Icon(
            LineAwesomeIcons.home,
          ),
          title: Text("Accueil",
              textAlign: TextAlign.center, style: styleMenuText(0)),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.dashboard_outlined,
          ),
          title: Text("Ecoles",
              textAlign: TextAlign.center, style: styleMenuText(1)),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            LineAwesomeIcons.newspaper,
          ),
          title: Text("Actualités",
              textAlign: TextAlign.center, style: styleMenuText(2)),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            LineAwesomeIcons.comment,
          ),
          title: Text("titre",
              textAlign: TextAlign.center, style: styleMenuText(3)),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            LineAwesomeIcons.user_circle,
          ),
          title: Text("Profil",
              textAlign: TextAlign.center, style: styleMenuText(4)),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      isFloating: true,
    );
  }
}
