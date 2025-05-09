import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:projet_ecommerce_meuble/Views/screens/auth/login_page.dart';
import 'package:projet_ecommerce_meuble/Views/screens/auth/signup.dart';
import 'package:projet_ecommerce_meuble/utils/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/sizes.dart';

class noLoggedIn_profilPage extends StatefulWidget {
  const noLoggedIn_profilPage({super.key});

  @override
  State<noLoggedIn_profilPage> createState() => _noLoggedIn_profilPageState();
}

class _noLoggedIn_profilPageState extends State<noLoggedIn_profilPage> {
  late GoogleMapController mapController;

  final LatLng _isammPosition = const LatLng(36.8090, 10.0975);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 180, left: 25, right: 25),
          child: Column(
            children: [
              // Section boutons Login / Create Account
              Container(
                margin: EdgeInsets.only(top: gHeight / 20),
                padding: EdgeInsets.only(top: gHeight / 20),
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log into your account ",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.btnColor,
                              elevation: 0,
                            ),
                            onPressed: () {
                              Get.to(LoginPage());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.person_outline),
                                SizedBox(width: 8),
                                Text("Log In"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 30,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: MyColors.btnColor,
                              side: const BorderSide(
                                color: MyColors.btnBorderColor,
                              ),
                            ),
                            onPressed: () {
                              Get.to(SignUp());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.person_add_outlined),
                                SizedBox(width: 8),
                                Text("Create Account"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- Carte Google Map ---
              Container(
                width: double.infinity,
                height: 200, // hauteur fixe pour la carte
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _isammPosition,
                    zoom: 16.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId("isamm_marker"),
                      position: _isammPosition,
                      infoWindow: const InfoWindow(title: "ISAMM Manouba"),
                    ),
                  },
                  zoomControlsEnabled: false,
                ),
              ),

              const SizedBox(height: 20),

              // Section "Rate This App"
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: (20 / 375.0) * gWidth),
                  padding: EdgeInsets.only(top: (15 / 375.0) * gWidth),
                  width: double.infinity,
                  height: 90,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ProfileMenuWidget(
                    title: "Rate This App ",
                    icon: LineAwesomeIcons.star,
                    onPress: () {},
                    endIcon: false,
                  ),
                ),
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
