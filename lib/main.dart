import 'package:projet_ecommerce_meuble/Views/screens/ProductDetails/details_screen.dart';
import 'package:projet_ecommerce_meuble/Views/screens/ProductDetails/newArrival_screen.dart';
import 'package:projet_ecommerce_meuble/Views/screens/ProductDetails/popular_products_screen.dart';
import 'package:projet_ecommerce_meuble/Views/screens/ProductDetails/products_by_categories.dart';
import 'package:projet_ecommerce_meuble/Views/screens/about_us.dart';
import 'package:projet_ecommerce_meuble/Views/screens/checkOut/cart_screen.dart';
import 'package:projet_ecommerce_meuble/Views/screens/help_center.dart';
import 'package:projet_ecommerce_meuble/Views/screens/review/add-review.dart';
import 'package:projet_ecommerce_meuble/Views/screens/review/review.dart';
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
      title: "ARkea",
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
        GetPage(name: '/cart', page: () => CartScreen()),
        GetPage(name: '/review', page: () => ReviewScreen()),
                GetPage(name: '/add-review', page: () => const AddReviewScreen()),
         GetPage(name: '/newProducts', page: () => const NewArrivalScreen()),
        GetPage(
            name: '/popularProducts', page: () => const PopularProductScreen()),
             GetPage(
            name: '/productsPerCategorie',
            page: () => const ProductsByCategory()),
                    GetPage(name: '/detail', page: () => DetailsScreen()),
        GetPage(
          name: '/noLoggedInprofil',
          page: () => const noLoggedIn_profilPage(),
        ),
                GetPage(name: '/about', page: () => const AboutUsScreen()),
        GetPage(name: '/help', page: () => const HelpCenterScreen()),

        GetPage(name: '/address', page: () => const AddressScreen()),

        GetPage(name: '/splash', page: () => SplashScreen()),
      ],
      home: SplashScreen(),
    );
  }
}
