import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:projet_ecommerce_meuble/Views/screens/profil_page/noLoggedIn_profilPage.dart';
import 'package:projet_ecommerce_meuble/Views/screens/profil_page/order_history.dart';
import 'package:projet_ecommerce_meuble/utils/shared_preferences.dart';
import '../../../ViewModel/login_controller.dart';
import '../../../ViewModel/signup_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';
import './edit_profile.dart';
import '../../../ViewModel/theme_controller.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String token = '';
  String customerName = '';
  String customerEmail = '';
  String customerImage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  checkToken() async {
    String? updatedToken = await sharedPrefs.getPref('token');
    String? updatedCustomerName = await sharedPrefs.getPref('customerName');
    String? updatedCustomerEmail = await sharedPrefs.getPref('customerEmail');
    String? updatedCustomerImage = await sharedPrefs.getPref('customerImage');
    String? tok = await sharedPrefs.getPref('auth-token');

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      token = updatedToken ?? '';
      customerName = updatedCustomerName ?? '';
      customerEmail = updatedCustomerEmail ?? 'No email';
      customerImage = updatedCustomerImage ?? '';
      isLoading = false;
    });
    print("Token: $tok");
  }

  final loginController = Get.put(LoginController());
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body:
          isLoading
              ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text("Loading... Please wait."),
                  ],
                ),
              )
              : customerName.isEmpty
              ? const noLoggedIn_profilPage()
              : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(tDefaultSize),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      // Profile Picture
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            customerImage.isNotEmpty
                                ? customerImage
                                : 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        customerName,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        customerEmail,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: 200,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => EditProfileScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.btnColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Obx(
                        () => SwitchListTile(
                          title: Text(
                            themeController.themeMode.value == ThemeMode.dark
                                ? "Dark Mode"
                                : "Light Mode",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          secondary: Icon(
                            themeController.themeMode.value == ThemeMode.dark
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: MyColors.btnColor,
                          ),
                          value:
                              themeController.themeMode.value == ThemeMode.dark,
                          onChanged: (value) {
                            themeController.toggleTheme();
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      ProfileMenuWidget(
                        title: "My orders",
                        icon: LineAwesomeIcons.dolly,
                        onPress: () {
                          Get.to(OrderHistoryScreen());
                        },
                      ),
                      ProfileMenuWidget(
                        title: "Address",
                        icon: LineAwesomeIcons.map,
                        onPress: () {
                          Get.toNamed('/address');
                        },
                      ),
                      ProfileMenuWidget(
                        title: "Help Center",
                        icon: LineAwesomeIcons.headset,
                        onPress: () {
                          Get.toNamed('/help');
                        },
                      ),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 10),
                      ProfileMenuWidget(
                        title: "About Us",
                        icon: LineAwesomeIcons.info_circle,
                        onPress: () {
                          Get.toNamed('/about');
                        },
                      ),
                      ProfileMenuWidget(
                        title: "Rate Us",
                        icon: LineAwesomeIcons.star,
                        onPress: () {},
                      ),
                      ProfileMenuWidget(
                        title: "Logout ",
                        textColor: Colors.red,
                        endIcon: false,
                        icon: LineAwesomeIcons.alternate_sign_out,
                        onPress: () {
                          loginController.logOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    this.endIcon = true,
    required this.icon,
    required this.onPress,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.btnBorderColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: MyColors.btnColor),
      ),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.apply(color: textColor),
      ),
      trailing:
          endIcon
              ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Icon(
                  LineAwesomeIcons.angle_double_right,
                  size: 18.0,
                  color: Colors.grey,
                ),
              )
              : null,
    );
  }
}
