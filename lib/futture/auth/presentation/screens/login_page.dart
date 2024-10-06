import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_with_baya/core/app_theme/app_colors.dart';
import 'package:grocery_app_with_baya/core/utills/app_images.dart';
import 'package:grocery_app_with_baya/futture/auth/presentation/screens/signup_page.dart';

import '../../../../core/common_widgets/elevated_button_widget.dart';
import '../../../home/presentation/screens/main_screen.dart';
import '../../data/data_sourse/user_data_source.dart';
import '../../data/repositories/auth_repositories_impl.dart';
import '../../domain/usecase/ligin_usecase.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  final String description;
  const LoginScreen(
      {super.key, required this.title, required this.description});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _obscurePassword = true;

  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

  late final LoginUseCase _loginUseCase;
  bool _isLoading = false;
  String _errorMessage = "";

  @override
  void initState() {
    final userDataSource = UserDataSource();
    final authRepositories = AuthRepositoriesImpl(userDataSource);
    _loginUseCase = LoginUseCase(authRepositories);

    super.initState();
  }

  void login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });
    bool success = await _loginUseCase.call(
        emailController.text, passwordController.text);
    setState(() {
      _isLoading = false;
      if (success) {
        _errorMessage = "";
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      } else {
        _errorMessage = "Invalid email or password";
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    AppImages.welcomeLogo2,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 17,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 33,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35),
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: const Text(
              "Login",
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
              height: 424,
              decoration: const BoxDecoration(
                color: AppColors.primaryColorContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 31,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style:
                          Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0XFF868889),
                        ),
                        hintText: 'Email Address',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColorEndButton,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, color: Colors.transparent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0XFF868889),
                        ),
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge,
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        suffixIconColor: const Color(0XFF868889),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColorEndButton,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, color: Colors.transparent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                inactiveTrackColor:
                                    AppColors.primaryColorContainer,
                                inactiveThumbColor: Colors.grey,
                                activeColor:
                                    AppColors.primaryColorEndButton,
                                activeTrackColor:
                                    AppColors.primaryColorBeginButton,
                                focusColor: Colors.red,
                                hoverColor: Colors.green,
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Remember me",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0XFF407EC7),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _errorMessage.isNotEmpty
                              ? Colors.red
                              : AppColors.primaryColorEndButton,
                        ),
                        onPressed: () {
                          _isLoading ? null : login();
                        },
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : _errorMessage.isNotEmpty
                                ? Text(
                                    _errorMessage,
                                    style: TextStyle(
                                        color: Colors.white),
                                  )
                                : Text("Login"),
                      ),
                    ),
                    // ElevetadButtonWidget(
                    //   text: "Login",
                    //   onTap: () {},
                    // ),
                    const SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Don’t have an account ?",
                            style:
                                Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignUpScreen(
                                          title: "Create account",
                                          description:
                                              "Quickly create account"),
                                ),
                              ).then((value) => setState(() {}));
                            },
                            child: Text(
                              "Sign up",
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
