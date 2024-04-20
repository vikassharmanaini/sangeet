// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
import 'package:sangeet/models/dbIndex.dart';
import 'package:sangeet/models/user.dart';

class UserDB {
  insertUser(UserModals user) async {
    //insert into database
    final box = await Hive.openBox(DBREGISTER().UserDB);
    await box.add(user);
    await box.close();
  }

  Future<bool> isUserPresent(String id) async {
    final box = await Hive.openBox(DBREGISTER().UserDB);
    final a = box.values.where((element) => element.id == id);
    await box.close();
    return a.isNotEmpty;
  }

  Future<List<UserModals>> getAllUsers() async {
    final box = await Hive.openBox(DBREGISTER().UserDB);
    final users = box.values.map((e) => e as UserModals).toList();
    await box.close();
    return users;
  }

  Future<UserModals?> getUserById(String id) async {
    final box = await Hive.openBox(DBREGISTER().UserDB);
    final a = box.values.where((element) => element.id == id);

    await box.close();
    return a.first;
  }

  Future<int> updateUser(UserModals user) async {
    try {
      final box = await Hive.openBox(DBREGISTER().UserDB);
      box.put(
          box.values.firstWhere((element) => element.id == user.id).id, user);
      await box.close();
      return 1;
    } catch (e) {
      return -1;
    }
  }
}
