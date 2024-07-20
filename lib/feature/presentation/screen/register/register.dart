import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_title.dart';
import '../../widget/text_field.dart';
import '../main/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController rePassword;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    rePassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const CustomTitle(title: "Register"),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: email,
                hintText: "Write email",
              ),
              SizedBox(height: 20.h),
              CustomTextFormField.password(
                controller: password,
                hintText: "Write password",
              ),
              SizedBox(height: 20.h),
              CustomTextFormField.password(
                controller: rePassword,
                hintText: "Write re-password",
              ),
              SizedBox(height: 40.h),
              CustomButton(
                onPressed: () async {
                  try {
                    await Provider.of<AuthProvider>(context, listen: false)
                        .signUp(email.text, password.text, rePassword.text);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
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
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
