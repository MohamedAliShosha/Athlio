import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../auth/login/data/models/login_request_body.dart';
import '../../../auth/login/presentation/manager/login/login_cubit.dart';
import '../../../auth/login/presentation/widgets/dont_have_account.dart';
import '../../../auth/login/presentation/widgets/login_bloc_listener.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Grouped Email and password text fields
          AppTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null; // Return null if the input is valid
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
          ),
          const SizedBox(height: 15),
          // Password Field
          AppTextFormField(
            keyboardType: TextInputType.visiblePassword,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              } else if (data.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null; // Return null if the input is valid
            },
            controller: passwordController,
            hintText: "Password",
            isPassword: true,
          ),
          const SizedBox(height: 100),
          // Login Button
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppButton(
                fontWeight: FontWeight.bold,
                isLoading: state is LoginLoading,
                text: "Sign In",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                          LoginRequestBody(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  }
                },
              );
            },
          ),
          const SizedBox(height: 30),
          const DontHaveAccount(),
          const LoginBlocListener(),
        ],
      ),
    );
  }
}
