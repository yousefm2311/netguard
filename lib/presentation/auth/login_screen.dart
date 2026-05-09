import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: 'admin@smartnet.com');
    final passwordController = TextEditingController(text: 'password123');

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.wifi_rounded, size: 100, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 32),
              Text(
                'Welcome to SmartNet Control',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'email'.tr,
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              Obx(() => TextField(
                controller: passwordController,
                obscureText: controller.obscurePassword.value,
                decoration: InputDecoration(
                  labelText: 'password'.tr,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(controller.obscurePassword.value ? Icons.visibility : Icons.visibility_off),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              )),
              const SizedBox(height: 32),
              Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.login(emailController.text, passwordController.text),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text('login'.tr, style: const TextStyle(fontSize: 18)),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
