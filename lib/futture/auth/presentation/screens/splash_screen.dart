import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/common_widgets/elevated_button_widget.dart';
import '../../data/splash_screen_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageViewController = PageController();

  void nextPage(int index) {
    if (index == splashScreenData.length - 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SplashScreen()));
    } else {
      pageViewController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageViewController,
        itemCount: splashScreenData.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  splashScreenData[index].imagePath,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 0.45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/splach_screen_shape.png",
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 65),
                      Text(
                        textAlign: TextAlign.center,
                        splashScreenData[index].title,
                        style:
                            Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        textAlign: TextAlign.center,
                        splashScreenData[index].description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 51),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0;
                              i < splashScreenData.length;
                              i++)
                            index == i
                                ? const Padding(
                                    padding: EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors
                                          .primaryColorEndButton,
                                    ),
                                  )
                                : const Padding(
                                    padding:
                                        EdgeInsets.only(right: 5),
                                    child: CircleAvatar(
                                      radius: 5,
                                    ),
                                  )
                        ],
                      ),
                      const SizedBox(height: 32),
                      ElevetadButtonWidget(
                        text: "Get started",
                        onTap: () {
                          nextPage(index);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
