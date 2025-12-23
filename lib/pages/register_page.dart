import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/my_button.dart';
import 'package:flutter_restaurant/component/my_textfield.dart';
import 'package:flutter_restaurant/services/auth/auth_service.dart';
import 'package:flutter_restaurant/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
 }
    

 void register() async {
  final _authService = AuthService();

  if (passwordController.text == confirmpasswordController.text) {
    try {
      await _authService.signUpWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

      // Redirect فورًا بعد نجاح التسجيل
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );

    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  } else {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Passwords do not match"),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 25),

          // Message
          Text(
            'lets create an account for you',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 25),

          // Email text field
          MyTextfield(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(height: 10),

          // Password text field
          MyTextfield(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 10),

          // confirmPassword text field
          MyTextfield(
            controller: confirmpasswordController,
            hintText: 'Confirm password',
            obscureText: true,
          ),
          const SizedBox(height: 10),

          // Sign uo button
          MyButton(text: "Sign Up", onTap: () => register(),
),

          const SizedBox(height: 25),

          // already have an account? Login here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
