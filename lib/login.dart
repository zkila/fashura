import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/spacing_styles.dart';
import 'package:fashura/util/widget/textfield.dart';
import 'package:flutter/material.dart';
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
        child: Padding(
          padding: TSpacingCustomStyle.paddingWithCustomTopBottom(150, 100),
          child: Column(
            children: [
              const Center(
                  child: Image(
                      height: 200, image: AssetImage("assets/logo/logo.png"))),
              const SizedBox(height: 64),
              const Text('Welcome Back!'),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      // === Email Input ===
                      TTextField(
                          hintText: "E-Mail",
                          controller: _usernameController,
                          icon: Icons.email),

                      // === Spacing ===
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // === Password Input ===
                      TTextField(
                          hintText: "Password",
                          controller: _passwordController,
                          icon: Icons.lock),

                      // === Spacing ===
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // === Forget Password ===
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => debugPrint('tes'),
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),

                      // === Spacing ===
                      const SizedBox(height: TSizes.spaceBtwItems),

                      // === Login Button ===
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            String username = _usernameController.text;
                            String password = _passwordController.text;
                            if (username == 'admin' && password == 'asdfqwer') {
                              // Get.offAll(() => const NavigationMenu());
                              // controller.selectedIndex.value = 0;
                              debugPrint('login tes');
                            } else {
                              Get.snackbar('Error', 'Login failed');
                            }
                          },
                          child: Text(
                            'Log In',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ],
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
