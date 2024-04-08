import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_front/init.dart';
import 'package:todo_front/views/auths/login/components/LoginScreen.dart';
import 'package:todo_front/views/home/HomeScreen.dart';

void main() {
  runApp(InitializationPage());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> isLogin() async {
    /*String? userUid;
    Utilisateur? leUser = await AppLocalData().getUser();
    if (leUser != null) {
      userUid = leUser.uid;
      return true;
    }
    print("isLogin----------$userUid");*/
    return false;
  }

  @override
  void initState() {
    super.initState();
    //isLogin();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * DeviceOrientation.portraitUp : L’appareil est en mode portrait avec la barre d’état de l’appareil en haut.
     * DeviceOrientation.portraitDown : L’appareil est en mode portrait avec la barre d’état de l’appareil en bas.
     */
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final mediaQueryData = MediaQuery.of(context);
    final scale = MediaQuery.textScalerOf(context).scale(1);

    return MediaQuery(
      //permet aux utilisateurs de modifier la taille du texte dans l’application
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1),
      ),
      child: MaterialApp(
        title: 'ToDo',
        theme: ThemeData(
            primaryColor: Colors.white,
            fontFamily: "Poppins",
            useMaterial3: true
            //primarySwatch: Colors.black,
            ),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<bool>(
            future: isLogin(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return MaterialApp(
                  initialRoute: (snapshot.data == true) ? '/log-in' : '/log-in',
                  routes: {
                    '/log-in': (context) => const LoginScreen(),
                    '/home': (context) => const HomeScreen(),
                  },
                  title: 'ToDo',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primaryColor: Colors.white,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    // ignore: deprecated_member_use
                    backgroundColor: Color(0xffe7e9f0),
                    fontFamily: 'Aller',
                    textTheme: Theme.of(context).textTheme,
                  ),
                );
              }
              return const Material(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /*Center(
                            child: ColorLoader3(
                              radius: 15,
                              dotRadius: 3,
                            ),
                          ),*/
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 2),
                            child: Center(
                              child: Text(
                                "Veuillez patienter ...",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Aller',
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
