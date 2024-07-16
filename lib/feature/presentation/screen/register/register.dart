import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_title.dart';
import '../../widget/text_field.dart';
import '../main/main.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              const CustomTextFormField(),
              SizedBox(height: 20.h),
              const CustomTextFormField(),
              SizedBox(height: 20.h),
              const CustomTextFormField(),
              SizedBox(height: 40.h),
              CustomButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
