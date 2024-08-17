import 'package:flutter/material.dart';

import '../services/firebase_auth_services.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = FirebaseAuthService();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Signup Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 25, 70),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 190,
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 70,
                    ),
                    Text(
                      'Flutter',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ),
            CustomTextField(
              labelText: 'Name',
              hintText: 'Enter your name',
              obscureText: false,
              textEditingController: nameController,
            ),
            CustomTextField(
              labelText: 'Email',
              hintText: 'Enter valid mail id as abc@gmail.com',
              obscureText: false,
              textEditingController: userController,
            ),
            CustomTextField(
              labelText: 'Password',
              hintText: 'Create your new password',
              obscureText: true,
              textEditingController: passwordController,
            ),
            CustomButton(
              onPressed: () async {
                try {
                  final user = await authService.signUp(
                    userController.text,
                    passwordController.text,
                    nameController.text,
                  );
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to sign up: $e')),
                  );
                }
              },
              buttonText: 'Signup',
            ),
          ],
        ),
      ),
    );
  }
}
