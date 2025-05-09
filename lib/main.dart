import 'package:projet_ecommerce_meuble/Views/screens/splash_screen.dart';
import 'package:projet_ecommerce_meuble/utils/shared_preferences.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ViewModel/bindings.dart';
import 'Views/screens/Home/home_page.dart';
import 'Views/screens/auth/login_page.dart';
import 'Views/screens/auth/signup.dart';
import 'Views/screens/landing_page.dart';
import 'Views/screens/profil_page/noLoggedIn_profilPage.dart';
import 'Views/screens/profil_page/profil_page.dart';

import 'utils/text_theme.dart';
import 'Views/screens/profil_page/AddressScreen.dart';
import 'deep_linking.dart'; // Import the deep linking module

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sharedPrefs.init();
  await GetStorage.init();
  DeepLinking.initDeepLinking();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "KOA_Home",
      theme: ThemeData(
        textTheme: TTtextTheme.lightTextTheme,
        brightness: Brightness.light,
        fontFamily: "Gordita",
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: "/splash",
      initialBinding: MyBindings(),
      getPages: [
        GetPage(name: '/landing', page: () => const LandingPage()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/signup', page: () => const SignUp()),
        GetPage(name: '/profil', page: () => ProfileScreen()),
        GetPage(
          name: '/noLoggedInprofil',
          page: () => const noLoggedIn_profilPage(),
        ),

        GetPage(name: '/address', page: () => const AddressScreen()),

        GetPage(name: '/splash', page: () => SplashScreen()),
      ],
      home: SplashScreen(),
    );
  }
}
