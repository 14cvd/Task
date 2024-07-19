import 'package:flutter/material.dart';

import '../../../viewmodels/auth_view_model.dart';

class AuthProvider extends InheritedNotifier<AuthViewModel> {
  const AuthProvider({super.key, required AuthViewModel viewModel, required super.child}) : super(notifier: viewModel);

  static AuthViewModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>()!.notifier!;
  }

  @override
  bool updateShouldNotify(AuthProvider oldWidget) => notifier != oldWidget.notifier;
}
