import 'package:flutter/material.dart';
import 'package:todo_front/themes/images.dart';
import '../main.dart';

class InitializationPage extends StatefulWidget {
  InitializationPage({super.key});

  @override
  State<InitializationPage> createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  Future<String?> _initializeFuture = Init().initialize();

  @override
  void initState() {
    super.initState();
    _initializeFuture = Init().initialize();
  }

  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: _initializeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print("----------${snapshot.data}");
            /*if (snapshot.hasData) {
              if (snapshot.data == "aviculteur") {
                print("un aviculteur");
                return AviculteurApp();
              } else {
                print("un veterinaire");
                return AviculteurApp();
              }
            } else {
              print("autre");
              return MyApp(
                prefs: widget.prefs,
                role: null,
              );
            }OnboardScreen WalkWalkBody*/
            return MyApp();
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}

class Init {
  Future<String?> initialize() async {
    await _registerServices();
    await _loadSettings();
    //return await getUserRole();
    return "";
  }

  static getCredential() async {}

  static _registerServices() async {
    print("debut chargement service");
    await Future.delayed(const Duration(seconds: 4));
    Init.getCredential();

    print("debut chargement");
    print("fin chargement service");
  }

  static _loadSettings() async {
    print("debut chargement setting");
    await Future.delayed(const Duration(seconds: 2));
    print("debut chargement");
    print("fin chargement setting");
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.01),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/gif/logo.gif",
                            gaplessPlayback: true,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
                              if (_controller.isAnimating) {
                                return child;
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    _controller.forward(from: 0);
                                  },
                                  child: child,
                                );
                              }
                            },
                            semanticLabel: 'GIF',
                            height: 200.0,
                            width: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Image.asset(
                  Images.logoPng,
                  gaplessPlayback: true,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (_controller.isAnimating) {
                      return child;
                    } else {
                      return GestureDetector(
                        onTap: () {
                          _controller.forward(from: 0);
                        },
                        child: child,
                      );
                    }
                  },
                  semanticLabel: 'GIF',
                  height: 60.0,
                  width: 60.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Center(
                    child: Text(
                      "By Karim Diawara",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ]),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        ],
      ),
    );
  }
}
