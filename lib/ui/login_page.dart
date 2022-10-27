import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/components/my_wave.dart';
import 'package:musicapp/constants/route_strings.dart';
import 'package:musicapp/routes/route_handler.dart';
import 'package:musicapp/ui/home_page.dart';
import 'package:musicapp/ui/homerr_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RouteHandler.generateRoute,
        initialRoute: RouteStrings.homePage,
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomLeft,
                begin: Alignment.topRight,
                colors: [Colors.purple, Colors.white])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // ignore: prefer_const_constructors
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(children: [
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.pink, Colors.white]),
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/play_music.png')),
                  Column(children: [
                    RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'Welcome \n',
                              style: TextStyle(
                                  // height: 2,
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: 'To the world of Music\n',
                              style: TextStyle(
                                  // height: 2,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ])),
                  ]),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              suffixIcon: Icon(Icons.mail_outline),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Email")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Username")),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.pink, Colors.white],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteStrings.homePage);
                          //            Navigator.pushReplacement(
                          //   context,
                          //   CupertinoPageRoute(builder: (_) => const HomePage()),
                          // );
                        },
                        child: const Text(
                          'Create Account',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            letterSpacing: 0.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  //   child: Container(
                  //     child: Column(children: [
                  //        TextFormField(

                  //           decoration: const InputDecoration(

                  //               suffixIcon: const Icon(Icons.mail_outline),
                  //               border: OutlineInputBorder(),
                  //               // contentPadding: new EdgeInsets.symmetric(
                  //               //     vertical: 10.0, horizontal: 10.0),
                  //               hintStyle: TextStyle(color: Colors.grey),
                  //               labelText:" Email" ,
                  //               hintText: "Email"),

                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //        TextFormField(
                  //       decoration: const InputDecoration(
                  //           border: OutlineInputBorder(),

                  //           hintText: " Full Name",
                  //           hintStyle: TextStyle(color: Colors.grey),
                  //           labelText: "Full name"),
                  //    )
                  //     ]),
                  //   ),
                  // )

                  // Container(
                  //     margin: EdgeInsets.symmetric(vertical: 20),
                  //     width: double.infinity,
                  //     height: 166,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       image: const DecorationImage(
                  //         fit: BoxFit.fill,
                  //         image: AssetImage("assets/images/google.png"),
                  //       ),
                  //     ),

                  //   )
                ]),
              ),
            )));
  }
}
