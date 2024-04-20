import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sangeet/Screens/DownloadScreen.dart';
import 'package:sangeet/Screens/HomeScreen.dart';
import 'package:sangeet/Screens/LibraryScreen.dart';
import 'package:sangeet/Screens/LoginScreen.dart';
import 'package:sangeet/Screens/PlayListScreen.dart';
import 'package:sangeet/Screens/PlayerScreen.dart';
import 'package:sangeet/Screens/RegisterScreen.dart';
import 'package:sangeet/Screens/SearchPage.dart';
import 'package:sangeet/controllers/mainController.dart';
import 'package:sangeet/models/dbIndex.dart';
import 'package:sangeet/notification.dart';
import 'package:sangeet/utils/routes.dart';
import 'package:hive/hive.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();

  final path = await getApplicationSupportDirectory();
  Hive.init(path.path);
  Hive.registerAdapter(UserModalsAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _auth = FirebaseAuth.instance;

  // This widget is the root of your appli1cation.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1C1B1B),
    ));
    return GetMaterialApp(
      title: 'Sangeet',
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder.put(() => Get.put(MainController())),
      initialRoute:
          _auth.currentUser != null ? AppRoutes.root : AppRoutes.login,
      getPages: [
        GetPage(
          name: AppRoutes.regiter,
          page: () => RegisterScreen(),
        ),
        GetPage(name: AppRoutes.login, page: () => LoginScreen()),
        GetPage(name: AppRoutes.root, page: () => HomeScreen()),
        GetPage(name: AppRoutes.search, page: () => SearchPage()),
        GetPage(name: AppRoutes.library, page: () => LibraryScreen()),
        GetPage(name: AppRoutes.downloads, page: () => DownloadScreens()),
        GetPage(name: AppRoutes.playlist, page: () => PlayListScreen()),
        GetPage(name: AppRoutes.player, page: () => PlayerScreen()),
      ],
    );
  }
}
