import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_with_baya/core/app_theme/app_colors.dart';
import 'package:grocery_app_with_baya/core/utills/app_images.dart';

import '../../../../core/common_widgets/elevated_button_default.dart';
import '../../../../core/common_widgets/elevated_button_widget.dart';
import 'login_page.dart';

class WelcomeScreen extends StatelessWidget {
  final String title;
  final String description;
  const WelcomeScreen(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.welcomeLogo,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35),
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 358,
              decoration: const BoxDecoration(
                color: AppColors.primaryColorContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 31),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 27),
                    Container(
                      width: 380,
                      height: 60,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Image.asset(
                                "assets/images/google_icon.png"),
                          ),
                          const Center(
                            child: Text(
                              "Continue with google",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 380,
                    //   height: 60,
                    //   child: ElevatedButtonDefault(
                    //     icon: Image.asset(
                    //       "assets/images/google_icon.png",
                    //     ),
                    //     text: "Continue with google",
                    //     onPressed: () {},
                    //   ),
                    // ),
                    const SizedBox(height: 12),
                    ElevetadButtonWidget(
                      text: "Get started",
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Already have an account?",
                            style:
                                Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen(
                                            title: "Welcome back !",
                                            description:
                                                "Sign in to your account ?",
                                          )));
                            },
                            child: Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
