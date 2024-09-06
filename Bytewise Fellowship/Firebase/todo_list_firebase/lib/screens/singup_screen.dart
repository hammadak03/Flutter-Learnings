import 'package:flutter/material.dart';
import '../services/firebase_auth_services.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'todo_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = FirebaseAuthService();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          AppLocalizations.of(context)!.signupPage,
          style: const TextStyle(
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
                        AppLocalizations.of(context)!.todoList,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.name,
                hintText: AppLocalizations.of(context)!.enterName,
                obscureText: false,
                textEditingController: nameController,
              ),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.enterEmail,
                obscureText: false,
                textEditingController: userController,
              ),
              CustomTextField(
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.createPassword,
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
                        MaterialPageRoute(
                            builder: (_) => const TodoListScreen()),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              AppLocalizations.of(context)!.failedSignup(e))),
                    );
                  }
                },
                buttonText: AppLocalizations.of(context)!.signup,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
