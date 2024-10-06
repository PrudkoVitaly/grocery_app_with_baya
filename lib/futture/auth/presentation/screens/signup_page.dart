import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_with_baya/core/app_theme/app_colors.dart';
import 'package:grocery_app_with_baya/core/utills/app_images.dart';

import '../../../../core/common_widgets/elevated_button_widget.dart';
import '../../data/data_sourse/user_data_source.dart';
import '../../data/repositories/auth_repositories_impl.dart';
import '../../domain/usecase/register_usecase.dart';
import 'login_page.dart';

class SignUpScreen extends StatefulWidget {
  final String title;
  final String description;
  const SignUpScreen(
      {super.key, required this.title, required this.description});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMe = false;
  bool _obscurePassword = true;

  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController phoneController =
      TextEditingController();
  late final RegisterUseCase _registerUseCase;

  bool _isLoading = false;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    final userDataSource = UserDataSource();
    final authRepositories = AuthRepositoriesImpl(userDataSource);
    _registerUseCase = RegisterUseCase(authRepositories);
  }

  void register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });
    bool success = await _registerUseCase.call(emailController.text,
        passwordController.text, phoneController.text);
    setState(() {
      _isLoading = false;
      if (success) {
        Navigator.pop(context);
      } else {
        _errorMessage = "Error occurred. Please try again.";
      }
    });
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
                    AppImages.welcomeLogo3,
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
              "Sign Up",
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
                      keyboardType: TextInputType.emailAddress,
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
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: Color(0XFF868889),
                        ),
                        hintText: 'Phone number',
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _errorMessage.isNotEmpty
                              ? Colors.red
                              : AppColors.primaryColorEndButton,
                        ),
                        onPressed: () {
                          _isLoading ? null : register();
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
                    //   text: "Signup",
                    //   onTap: () {},
                    // ),
                    const SizedBox(height: 0),
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
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen(
                                              title: "Welcome back !",
                                              description:
                                                  "Sign in to your account ?")));
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
