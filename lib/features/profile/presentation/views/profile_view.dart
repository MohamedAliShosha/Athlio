import 'package:athlio/core/functions/build_app_bar.dart';
import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/core/utils/shared_pref_helper.dart';
import 'package:athlio/core/utils/shared_pref_keys.dart';
import 'package:athlio/features/profile/presentation/widgets/custom_log_out_alert_dialog.dart';
import 'package:athlio/features/profile/presentation/widgets/custom_profile_circle_avatar.dart';
import 'package:athlio/features/profile/presentation/widgets/custom_user_info_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // We convert the state to stateful widget to manage the state as getting userName is an async operation
  String? userName;
  String? userEmail;

  // To get the userData when the widget is initialized
  @override
  initState() {
    super.initState();
    _loadUserData();
  }

  // This method to loadUserData from SharedPreferences
  Future<void> _loadUserData() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    final email = await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    setState(() {
      userName = name;
      userEmail = email;
    });
  }

  // Add state variable for loading
  bool _isLoggingOut = false;

// Logout handler method with confirmation dialog and error handling
  Future<void> _handleLogout() async {
    // Show confirmation dialog and get user's choice
    /*
    - Shows a dialog asking user to confirm logout.
    - Returns `true` if user clicks "Logout".
    - Returns `false` if user clicks "Cancel" or dismisses dialog
    - Uses null-coalescing operator (`??`) to default to `false` if dialog is dismissed.
     */
    final bool shouldLogout = await showDialog(
          context: context,
          builder: (context) => const CustomLogOutAlertDialog(
            logoutButton: 'Logout',
            cancelButton: 'Cancel',
            titleText: 'Confirm Logout',
            contentText: 'Are you sure you want to logout?',
          ),
        ) ??
        // Default to false if dialog is dismissed
        false;
    /* 
    - This is called an "early return pattern" - it helps avoid nested if statements and makes the code cleaner by handling the negative case first.

    - The return statement immediately exits the _handleLogout() method without executing any further code.

    - When user cancels:
    - shouldLogout = false
    - !shouldLogout = true

   Scenario 1: User clicks "Logout"
   shouldLogout = true
   !shouldLogout = false
   if (false) return → NOT executed
   Continue to next block ✅
  
   Scenario 2: User clicks "Cancel"
   shouldLogout = false
   !shouldLogout = true
   if (true) return → Method stops here ❌
   Next block never runs

   Completing the first scenario explanation:
    Dialog Result:
   shouldLogout = true

2. Guard Clause Check:
   !shouldLogout = !true = false
   if (false) return → NOT executed

3. Code Continues:
   - Sets loading state (true)
   - Clears user data
   - Navigates to login
   - Handles any errors
   - Resets loading state (false)

*/
    if (!shouldLogout) return;

    setState(() => _isLoggingOut = true);

    try {
      await SharedPrefHelper.clearAllData();
      // mounted means that the widget is still in the tree
      if (mounted) {
        GoRouter.of(context).go(AppRouter.kLoginView);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logout failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoggingOut = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: buildAppBar(
          context,
          leadingWidget: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomProfileCircleAvatar(),
              const SizedBox(height: 50),
              CustomUserInfoContainer(
                rightPadding: 40,
                leftPadding: 40,
                text: userName ?? 'No Name available',
              ),
              const SizedBox(height: 50),
              CustomUserInfoContainer(
                rightPadding: 40,
                leftPadding: 40,
                text: userEmail ?? 'No Email available',
              ),
              const SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  // If already logging out, do nothing else handle logout
                  _isLoggingOut ? null : _handleLogout();
                },
                child: CustomUserInfoContainer(
                  // If already logging out, show "Logging out..." else show "Logout"
                  text: _isLoggingOut ? 'Logging out...' : 'Logout',
                  rightPadding: 100,
                  leftPadding: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
 1 => Initial Trigger:
  - When user taps the Logout button in `CustomUserInfoContainer`, the `_handleLogout()` method is called.

  2 => Confirmation Dialog:
    - Shows a dialog asking user to confirm logout.
    - Returns `true` if user clicks "Logout".
    - Returns `false` if user clicks "Cancel" or dismisses dialog
    - Uses null-coalescing operator (`??`) to default to `false` if dialog is dismissed.

  3 => Early Return Check:
    - If `shouldLogout` is false (user cancelled), the method returns immediately.


  4 => Loading State Management:
    - Sets `_isLoggingOut` to true before starting logout process
    - Updates UI to show "Logging out..." text
    - Disables the logout button to prevent multiple taps


 */
