import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final AuthController controller = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => SingleChildScrollView(
            // Add this line to allow scrolling
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          PrimaryButton(
                            text: "Login",
                            onPressed: () => controller.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          PrimaryButton(
                            text: "Register",
                            onPressed: () => controller.register(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ),
                          ),
                          TextButton(
                            onPressed: () => controller.resetPassword(
                              emailController.text.trim(),
                            ),
                            child: const Text("Forgot Password?"),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
