import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_title.dart';
import '../../widget/text_field.dart';
import '../main/main.dart';
import '../register/register.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                          const CustomTextFormField(),
                          SizedBox(height: 12.h),
                          const CustomTextFormField(),
                          SizedBox(height: 20.h),
                          CustomButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const MainScreen()));
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
