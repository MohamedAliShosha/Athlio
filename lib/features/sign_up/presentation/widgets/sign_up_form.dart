import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../data/models/sign_up_request_body.dart';
import '../manager/sign_up/sign_up_cubit.dart';
import 'sign_up_bloc_listener.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordConfirmationController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Full Name
            AppTextFormField(
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return 'This field is required';
                }
                return null; // Return null if the input is valid
              },
              controller: nameController,
              hintText: "Name",
              isPassword: false,
            ),
            const SizedBox(height: 15),
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
                  return 'This field is required';
                }
                return null; // Return null if the input is valid
              },
              controller: phoneController,
              hintText: "Phone",
              isPassword: false,
            ),
            const SizedBox(height: 15),

            // Password
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
            const SizedBox(height: 15),

            // Confirm Password
            AppTextFormField(
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return 'This field is required';
                } else if (data.length < 8) {
                  return "Password must be at least 8 characters";
                } else if (data != passwordController.text) {
                  return "Passwords don't match";
                }
                return null; // Return null if the input is valid
              },
              controller: passwordConfirmationController,
              hintText: "Password Confirmation",
              isPassword: true,
            ),
            const SizedBox(height: 50),
            // Sign Up Button
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return AppButton(
                  fontWeight: FontWeight.bold,
                  isLoading: state is SignUpLoading,
                  text: "Sign Up",
                  onPressed: () async {
                    // Handle sign up logic
                    if (_formKey.currentState!.validate()) {
                      await context.read<SignUpCubit>().signUp(
                            SignUpRequestBody(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              confirmPassword:
                                  passwordConfirmationController.text.trim(),
                              phone: phoneController.text.trim(),
                              gender: 0,
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
                  "Already have an account? ",
                  style: TextStyle(fontSize: 18, color: AppColors.kBlackColor),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Login Screen
                    GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: AppColors.kBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SignUpBlocListener(),
            // Confirm Password
          ],
        ),
      ),
    );
  }
}
