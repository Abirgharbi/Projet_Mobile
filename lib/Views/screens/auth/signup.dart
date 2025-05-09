import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../ViewModel/signup_controller.dart';
import '../../../Views/screens/auth/login_page.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';
import '../../widgets/form_textfiled.dart';
import '../../widgets/media_tile.dart';
import '../../widgets/sp_solid_button.dart';

var signUpController = Get.put(SignupScreenController());

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animation pour l'image
                  Animate(
                    effects: [FadeEffect(), SlideEffect()],
                    child: const TopImage(),
                  ),

                  // Animation pour le texte "Sign Up"
                  Animate(
                    effects: [
                      FadeEffect(delay: Duration(seconds: 1)),
                    ], // Utilisation de Duration pour éviter l'ambiguïté
                    child: const LoginText(),
                  ),

                  const SizedBox(height: 10),

                  // Animation pour le champ de texte "Name"
                  Animate(
                    effects: [FadeEffect(), SlideEffect()],
                    child: FormTextFiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          signUpController.validName.value = false;
                          return "Field could not be Empty";
                        } else {
                          signUpController.validName.value = true;
                          return null;
                        }
                      },
                      controller: signUpController.nameEditingController,
                      typeInput: TextInputType.text,
                      prefIcon: Icon(
                        Icons.person_2_outlined,
                        color: MyColors.captionColor,
                      ),
                      sufIcon: null,
                      label: "Name",
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Animation pour le champ "Email"
                  Animate(
                    effects: [FadeEffect(), SlideEffect()],
                    child: FormTextFiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field could not be Empty";
                        } else if (!GetUtils.isEmail(value)) {
                          signUpController.validEmail.value = false;
                          return "Please Enter a Valid Email";
                        } else {
                          signUpController.validEmail.value = true;
                          return null;
                        }
                      },
                      controller: signUpController.emailEditingController,
                      typeInput: TextInputType.emailAddress,
                      prefIcon: Icon(
                        Icons.email_outlined,
                        color: MyColors.captionColor,
                      ),
                      sufIcon: null,
                      label: "Email",
                    ),
                  ),

                  const SizedBox(height: 20),

                  const checkBox(),

                  const SizedBox(height: 25),

                  // Animation pour le bouton de soumission
                  Animate(
                    effects: [FadeEffect(), SlideEffect()],
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      width: gWidth / 2,
                      height: gHeight / 12,
                      child: Obx(() {
                        return ElevatedButton(
                          style:
                              signUpController.checkboxValue.value &&
                                      signUpController.validName.value &&
                                      signUpController.validEmail.value
                                  ? ElevatedButton.styleFrom(
                                    fixedSize: const Size(50, 50),
                                    backgroundColor: MyColors.btnColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  )
                                  : ElevatedButton.styleFrom(
                                    fixedSize: const Size(50, 50),
                                    backgroundColor: MyColors.btnColor
                                        .withOpacity(0.7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                          onPressed:
                              signUpController.checkboxValue.value &&
                                      signUpController.validName.value &&
                                      signUpController.validEmail.value
                                  ? () async {
                                    signUpController.signUp();
                                  }
                                  : null,
                          child:
                              signUpController.isLogginIn.value
                                  ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                  : const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        );
                      }),
                    ),
                  ),

                  const OrText(),

                  const SizedBox(height: 10),

                  // Animation pour les boutons des médias sociaux
                  Animate(
                    effects: [FadeEffect(), SlideEffect()],
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MediaTile(
                            imagePath: "assets/images/FacebookLogo.png",
                            size: 30,
                            onPress: () {
                              signUpController.signUpWithFacebook();
                            },
                          ),
                          const SizedBox(width: 20),
                          MediaTile(
                            imagePath: "assets/images/google.png",
                            size: 30,
                            onPress: () {
                              signUpController.signUpWithGoogle();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const signinText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class signinText extends StatelessWidget {
  const signinText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(), SlideEffect()],
      child: GestureDetector(
        onTap: () {
          // Action lorsqu'on clique sur le texte pour rediriger vers la page de connexion
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Already have an account? ",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              TextSpan(
                text: "Sign In",
                style: TextStyle(
                  color: MyColors.titleTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Login Text with Animation
class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(), SlideEffect()],
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 25,
            color: MyColors.titleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Or Text with Animation
class OrText extends StatelessWidget {
  const OrText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(), SlideEffect()],
      child: SizedBox(
        width: gWidth,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 150, height: 0.2, color: MyColors.captionColor),
              Text(
                "  OR  ",
                style: TextStyle(color: MyColors.captionColor, fontSize: 15),
              ),
              Container(width: 150, height: 0.2, color: MyColors.captionColor),
            ],
          ),
        ),
      ),
    );
  }
}

// CheckBox with Animation
class checkBox extends StatefulWidget {
  const checkBox({super.key});

  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(), SlideEffect()],
      child: FormField<bool>(
        builder: (state) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    activeColor: MyColors.btnBorderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: signUpController.checkboxValue.value,
                    onChanged: (value) {
                      signUpController.checkboxValue.value = value!;
                      state.didChange(value);
                    },
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "BY continuing, I agree to the ",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        TextSpan(
                          text: " Terms of use ",
                          style: TextStyle(
                            color: MyColors.titleTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " & ",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        TextSpan(
                          text: " Privacy & Policy",
                          style: TextStyle(
                            color: MyColors.titleTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// Top Image with Animation
class TopImage extends StatelessWidget {
  const TopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(), SlideEffect()],
      child: Container(
        padding: const EdgeInsets.only(bottom: 40),
        child: SizedBox(
          width: gWidth,
          height: gHeight / 2.85,
          child: Image.asset("assets/images/logo_KOA.png"),
        ),
      ),
    );
  }
}
