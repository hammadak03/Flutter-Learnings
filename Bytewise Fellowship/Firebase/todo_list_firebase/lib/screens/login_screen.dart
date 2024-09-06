// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../services/firebase_auth_services.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'singup_screen.dart';
import 'todo_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController userController = TextEditingController();
    final authService = FirebaseAuthService();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 25, 70),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://thumbs.dreamstime.com/b/clipboard-report-shopping-list-icon-creative-element-design-stock-market-icons-collection-pixel-perfect-clipboard-report-169625067.jpg',
                      ),
                      Text(
                        AppLocalizations.of(context)!.todos,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.username,
                hintText: AppLocalizations.of(context)!.enterEmail,
                obscureText: false,
                textEditingController: userController,
              ),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.enterPassword,
                obscureText: true,
                textEditingController: passwordController,
              ),
              TextButton(
                onPressed: () async {
                  await _showForgotPasswordDialog(context, authService);
                },
                child: Text(
                  AppLocalizations.of(context)!.forgotPassword,
                  style: const TextStyle(color: Colors.blue, fontSize: 15),
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
                        MaterialPageRoute(
                            builder: (_) => const TodoListScreen()),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              AppLocalizations.of(context)!.failedLogin(e))),
                    );
                  }
                },
                buttonText: AppLocalizations.of(context)!.login,
              ),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
                child: Text(AppLocalizations.of(context)!.newUserCreateAccount),
              ),
            ],
          ),
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
          title: Text(AppLocalizations.of(context)!.forgotPassword),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enterEmail,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.send),
              onPressed: () async {
                try {
                  await authService.resetPassword(emailController.text);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(AppLocalizations.of(context)!
                            .passwordResetEmailSent)),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('${AppLocalizations.of(context)!.error} $e')),
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
