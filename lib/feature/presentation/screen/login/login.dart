import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_title.dart';
import '../../widget/text_field.dart';
import '../main/main.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController email;
  late final TextEditingController password;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CustomTitle(title: "Login"),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
                      child: Column(
                        children: <Widget>[
                          CustomTextFormField(
                            controller: email,
                            hintText: "Email",
                          ),
                          SizedBox(height: 12.h),
                          CustomTextFormField.password(
                            controller: password,
                            hintText: "Password",
                          ),
                          SizedBox(height: 20.h),
                          CustomButton(
                            onPressed: () async {
                              try {
                                await Provider.of<AuthProvider>(context, listen: false)
                                    .login(email.text, password.text);
                                Navigator.pushReplacement(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainScreen(),
                                    ));
                              } catch (e) {
                                showDialog(
                                  // ignore: use_build_context_synchronously
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    content: Text(e.toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: const Text("Login"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: SizedBox(
              height: 50.h,
              child: GestureDetector(
                child: const Text("Register"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
