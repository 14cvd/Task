import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, this.child});
  final void Function() onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: FloatingActionButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
