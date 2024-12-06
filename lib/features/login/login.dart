import 'package:fashura/navigation_menu.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/spacing_styles.dart';
import 'package:fashura/util/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController =
      TextEditingController(text: 'admin');
  final TextEditingController _passwordController =
      TextEditingController(text: 'asdfqwer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    TColors.brown2,
                    TColors.brown5,
                  ],
                ),
              ),
              padding: TSpacingCustomStyle.paddingWithCustomTopBottom(150, 100),
              child: Column(
                children: [
                  // const Center(
                  //   child: Image(
                  //     height: 200,
                  //     image: AssetImage("assets/logo/logo.png"),
                  //   ),
                  // ),
                  const SizedBox(height: 64),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: TColors.white,
                        fontSize: TSizes.fontSizeLg * 1.5,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: TSizes.spaceBtwSections,
                          ),
                          child: Column(
                            children: [
                              TTextField(
                                hintText: "E-Mail",
                                controller: _usernameController,
                                icon: Icons.email,
                              ),
                              const SizedBox(
                                  height: TSizes.spaceBtwInputFields),
                              TTextField(
                                hintText: "Password",
                                controller: _passwordController,
                                icon: Icons.lock,
                              ),
                              const SizedBox(
                                  height: TSizes.spaceBtwInputFields),
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () => debugPrint('tes'),
                                  child: const Text(
                                    'Forget password?',
                                    style: TextStyle(
                                        fontSize: 14, color: TColors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;
                                    if (username == 'admin' &&
                                        password == 'asdfqwer') {
                                      debugPrint('login tes');
                                      Get.offAll(() => const NavigationMenu());
                                      Get.snackbar(
                                        'Success',
                                        'Successfully signed in',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      Get.snackbar('Error', 'Login failed');
                                    }
                                  },
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                        color: TColors.white,
                                        fontSize: TSizes.fontSizeLg,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 60,
                            image: AssetImage("assets/logo/gugel.png"),
                          ),
                          Image(
                            height: 60,
                            image: AssetImage("assets/logo/apel.png"),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            // Fixed Background Decorations (SVGs)
            Positioned(
              top: -20,
              child: SvgPicture.asset(
                "assets/svgs/thing.svg",
                width: MediaQuery.of(context).size.width, // Match screen width
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -10,
              left: 0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scale(1.2,
                      1.0), // Scale width (x-axis) by 1.3 and keep height (y-axis) as 1.0
                child: Transform.rotate(
                  angle: 3.00, // Rotate by 180 degrees (in radians)
                  child: SvgPicture.asset(
                    "assets/svgs/thing.svg",
                    width: MediaQuery.of(context).size.width, // Original width
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
