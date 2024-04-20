import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:sangeet/db/userDB.dart';

import '../models/user.dart';

class UserService {
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  _addusertolocaldatabase(UserModals user, uid) async {
    log("users is in database" + user.toJson());
    final ispresent = await UserDB().isUserPresent(uid);
    if (!ispresent) {
      UserDB().insertUser(user);
    }
    log(ispresent.toString());
  }

  createorLoginUser(userdata, userid) async {
    userdata['userid'] = userid;
    final ref = await _firestore
        .collection("users")
        .where("userid", isEqualTo: userid)
        .limit(1)
        .get();

    if (ref.docs.isNotEmpty) {
      try {
        await _firestore
            .collection("users")
            .doc(ref.docs[0].id)
            .update(userdata);
        log("db ref ${userdata}");
        _addusertolocaldatabase(UserModals.fromMap(userdata), userdata['id']);
        return userdata;
      } catch (e) {
        Get.snackbar("Somthing wents wrong", e.toString());
        return false;
      }
    } else {
      _addusertolocaldatabase(UserModals.fromMap(userdata), userdata['uid']);

      return await _firestore.collection('users').add(userdata).then(
          (value) async => await value.get().then((value) => value.data()));
    }
  }
}
