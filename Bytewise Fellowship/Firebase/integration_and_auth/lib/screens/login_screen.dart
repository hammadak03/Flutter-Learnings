import 'package:flutter/material.dart';
import 'package:integration_and_auth/screens/home_screen.dart';
import 'package:integration_and_auth/screens/singup_screen.dart';
import 'package:integration_and_auth/services/firebase_auth_services.dart';
import 'package:integration_and_auth/widgets/custom_button.dart';
import 'package:integration_and_auth/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController userController = TextEditingController();
    final authService = FirebaseAuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
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
              labelText: 'User Name',
              hintText: 'Enter valid mail id as abc@gmail.com',
              obscureText: false,
              textEditingController: userController,
            ),
            CustomTextField(
              labelText: 'Password',
              hintText: 'Enter your secured password',
              obscureText: true,
              textEditingController: passwordController,
            ),
            TextButton(
              onPressed: () async {
                await _showForgotPasswordDialog(context, authService);
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            CustomButton(
              onPressed: () async {
                try {
                  final user = await authService.login(
                    userController.text,
                    passwordController.text,
                  );
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to login: $e')),
                  );
                }
              },
              buttonText: 'Login',
            ),
            const SizedBox(
              height: 130,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                );
              },
              child: const Text('New User? Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showForgotPasswordDialog(
      BuildContext context, FirebaseAuthService authService) async {
    final TextEditingController emailController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Forgot Password'),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Send'),
              onPressed: () async {
                try {
                  await authService.resetPassword(emailController.text);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password reset email sent')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
