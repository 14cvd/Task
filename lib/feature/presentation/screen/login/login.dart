import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/auth_view_model.dart';
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
    final authProvider = Provider.of<AuthViewModel>(context);
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
                          CustomTextFormField(controller: email),
                          SizedBox(height: 12.h),
                          CustomTextFormField(controller: password),
                          SizedBox(height: 20.h),
                          CustomButton(
                            onPressed: () async {
                              final success = await authProvider.login(email.text, password.text);
                              if (success) {
                                // ignore: use_build_context_synchronously
                                await Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const MainScreen()));
                              } else {
                                debugPrint("erorr");
                              }
                            },
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
