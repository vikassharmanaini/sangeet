import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangeet/controllers/AuthController.dart';
import 'package:sangeet/tools/spaces.dart';
import 'package:sign_button/sign_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Color.fromARGB(26, 119, 119, 119),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 0.5)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(maxWidth: 500),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 40,
                            foregroundImage: NetworkImage(
                                "https://i.ibb.co/1r81tnB/logo.png"),
                          ),
                        ),
                        VSpacehalf,
                        Text(
                          "Sangeet",
                          style: Get.textTheme.titleLarge!
                              .merge(GoogleFonts.pacifico()),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          isDense: true),
                    ),
                    SizedBox(
                      height: 50,
                      child: FloatingActionButton.extended(
                          onPressed: controller.signin,
                          label: Text("Login With Phone Number")),
                    )
                  ],
                ),
              ),
            ),
            SignInButton(buttonType: ButtonType.google, onPressed: () async {})
          ],
        ),
      ),
      // floatingActionButton: Column(
      //   children: [
      //     FloatingActionButton.extended(
      //       heroTag: "sd",
      //         onPressed: () {
      //           AuthenticationService().signin();
      //         },
      //         label: Text("Login With Google")),
      //       FloatingActionButton.extended(
      //       heroTag: "sd",
      //         onPressed: () {
      //           AuthenticationService().signin();
      //         },
      //         label: Text("Login With Facebook")),
      //   ],
      // ),
    );
  }
}
