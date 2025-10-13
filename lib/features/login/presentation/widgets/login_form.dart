import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../data/models/login_request_body.dart';
import '../manager/login/login_cubit.dart';
import 'login_bloc_listener.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          // Email Field
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Not a member? ",
                style: TextStyle(fontSize: 18, color: AppColors.kBlackColor),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
                },
                child: const Text(
                  "Register now",
                  style: TextStyle(
                    color: AppColors.kBlueColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const LoginBlocListener(),
        ],
      ),
    );
  }
}
