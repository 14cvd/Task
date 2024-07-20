import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, this.hintText, this.controller, this.isVisiblePassword = false});
  const CustomTextFormField.password({super.key, this.hintText, this.controller, this.isVisiblePassword = true});
  final String? hintText;
  final TextEditingController? controller;
  final bool isVisiblePassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isVisiblePassword && showPassword,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          suffixIcon: widget.isVisiblePassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off))
              : const SizedBox.shrink()),
    );
  }
}
