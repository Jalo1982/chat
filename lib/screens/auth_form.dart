import 'dart:io';

import 'package:chat/widget/user_image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isLogin;
  final bool isAuthenticating;
  final void Function() onSubmit;
  final void Function(File) onPickImage;
  final void Function() onSwitchAuthMode;

  const AuthForm({
    required this.formKey,
    required this.isLogin,
    required this.isAuthenticating,
    required this.onSubmit,
    required this.onPickImage,
    required this.onSwitchAuthMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isLogin)
                  UserImagePicker(
                    onPickImage: onPickImage,
                  ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Handling email saving in onSaved callback
                  },
                ),
                if (!isLogin)
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    enableSuggestions: false,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 4) {
                        return 'Please enter at least 4 characters.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // Handling username saving in onSaved callback
                    },
                  ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Handling password saving in onSaved callback
                  },
                ),
                const SizedBox(height: 12),
                if (isAuthenticating) const CircularProgressIndicator(),
                if (!isAuthenticating)
                  ElevatedButton(
                    onPressed: onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Text(isLogin ? 'Login' : 'Signup'),
                  ),
                if (!isAuthenticating)
                  TextButton(
                    onPressed: onSwitchAuthMode,
                    child: Text(
                      isLogin
                          ? 'Create an account'
                          : 'I already have an account',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
