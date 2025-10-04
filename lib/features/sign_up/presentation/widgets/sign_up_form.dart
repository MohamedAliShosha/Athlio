import 'package:athlio/core/widgets/app_button.dart';
import 'package:athlio/core/widgets/app_text_form_field.dart';
import 'package:athlio/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:athlio/features/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:athlio/features/sign_up/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          AppTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'Please enter your email';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null; // Return null if the input is valid
            },
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            hintText: "Email",
            isPassword: false,
          ),
          const SizedBox(height: 15),

          // Email
          AppTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'Please enter your password';
              } else if (data.length < 8) {
                return "Password must be at least 8 characters";
              }
              return null; // Return null if the input is valid
            },
            controller: passwordController,
            hintText: "Password",
            isPassword: true,
          ),
          const SizedBox(height: 15),

          // Password
          AppTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              return null; // Return null if the input is valid
            },
            controller: firstNameController,
            hintText: "First name",
            isPassword: false,
          ),
          const SizedBox(height: 15),

          // Confirm Password
          AppTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              return null; // Return null if the input is valid
            },
            controller: lastNameController,
            hintText: "Last name",
            isPassword: false,
          ),
          const SizedBox(height: 15),
          const SizedBox(height: 20),
          // Sign Up Button
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is SignUpLoading,
                text: "Sign Up",
                onPressed: () {
                  // Handle sign up logic
                  if (_formKey.currentState!.validate()) {
                    context.read<SignUpCubit>().signUp(
                          SignUpRequestBody(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                          ),
                        );
                  }
                  // GoRouter.of(context).go(AppRouter.kHomeView);
                },
              );
            },
          ),

          const SignUpBlocListener(),
          // Confirm Password
        ],
      ),
    );
  }
}
