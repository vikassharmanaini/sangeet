import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sangeet/service/ServiceIndex.dart';
import 'package:sangeet/utils/routes.dart';

class AuthController extends GetxController {
  signin() async {
    final auth = await AuthenticationService().signin();
    if (auth == true) {
      final user = FirebaseAuth.instance.currentUser;
      final userdata = {
        "display_name": user!.displayName.toString(),
        "email": user.email ?? "",
        "phonenumber": user.phoneNumber ?? "null",
        "id": user.uid ?? "",
        "img": user.photoURL ?? "",
      };
      log(userdata.toString());
      final data = await UserService().createorLoginUser(userdata, user.email);
      log(data.toString());
      // log(FirebaseAuth.instance.currentUser.toString());

      Get.offNamed(AppRoutes.root);
    } else {
      Get.snackbar("Login Failed", "Hold tight or try again after somtime");
    }
  }
}
