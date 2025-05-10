import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:projet_ecommerce_meuble/ViewModel/profile_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';
import '../../widgets/form_textfiled.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    _buildTextField("Full Name", profileController.name),
                    const SizedBox(height: 20),
                    _buildTextField("Email", null, enabled: false),
                    const SizedBox(height: 20),
                    _buildTextField("Phone N°", profileController.phoneNumber),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          await profileController.updateProfile();
                          Get.toNamed('/profil');
                          Get.snackbar(
                            'Success',
                            'Profile Updated Successfully',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFF7742),
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController? controller, {
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(Icons.person, color: Color(0xffFF7742)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFF7742)),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
