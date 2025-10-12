import 'package:athlio/core/functions/build_app_bar.dart';
import 'package:athlio/core/routing/app_router.dart';
import 'package:athlio/core/utils/app_colors.dart';
import 'package:athlio/core/utils/shared_pref_helper.dart';
import 'package:athlio/core/utils/shared_pref_keys.dart';
import 'package:athlio/features/profile/presentation/widgets/custom_log_out_alert_dialog.dart';
import 'package:athlio/features/profile/presentation/widgets/custom_profile_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // Variables to store user data retrieved from SharedPreferences
  String? userName;
  String? userEmail;

  // To manage logout loading state
  bool _isLoggingOut = false;

  @override
  void initState() {
    super.initState();
    // Load user data when the widget initializes
    _loadUserData();
  }

  /// Loads user name and email asynchronously from SharedPreferences
  Future<void> _loadUserData() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    final email = await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    setState(() {
      userName = name;
      userEmail = email;
    });
  }

  /// Handles logout logic with confirmation dialog and error handling
  Future<void> _handleLogout() async {
    /*
      Step 1: Show confirmation dialog to confirm logout
      - Returns `true` if user clicks "Logout"
      - Returns `false` if user clicks "Cancel" or dismisses the dialog
      - Uses null-coalescing operator (??) to default to `false` if dialog dismissed
    */
    final bool shouldLogout = await showDialog(
          context: context,
          builder: (context) => const CustomLogOutAlertDialog(
            logoutButtonColor: Colors.redAccent,
            cancelButtonColor: AppColors.kWhiteColor,
            contentTextColor: AppColors.kWhiteColor,
            titleTextColor: AppColors.kWhiteColor,
            dialogBackgroundColor: AppColors.kBlack87Color,
            logoutButtonText: 'Logout',
            cancelButtonText: 'Cancel',
            titleText: 'Confirm Logout',
            contentText: 'Are you sure you want to logout?',
          ),
        ) ??
        false;

    /*
      Step 2: Use an early return pattern
      - If user cancels logout (shouldLogout = false), 
        exit the function immediately to avoid executing further code
    */
    if (!shouldLogout) return;

    // Step 3: Start logout process (show loading state)
    setState(() => _isLoggingOut = true);

    try {
      // Step 4: Clear stored user data
      await SharedPrefHelper.clearAllData();

      // Step 5: Navigate back to login screen after logout
      if (mounted) GoRouter.of(context).go(AppRouter.kLoginView);
    } catch (e) {
      // Step 6: Handle any potential errors during logout
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logout failed. Please try again.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      // Step 7: Reset loading state once logout attempt finishes
      if (mounted) setState(() => _isLoggingOut = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: buildAppBar(
        context,
        leadingWidget: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        ),
        title: 'My Profile',
      ),

      // Scrollable content for better layout on smaller devices
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // ===== Profile Picture =====
              const CustomProfileCircleAvatar(),
              const SizedBox(height: 20),

              // ===== User Name =====
              Text(
                userName ?? 'No Name Available',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),

              // ===== User Email =====
              Text(
                userEmail ?? 'No Email Available',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 30),

              // ===== User Info Card (Styled container for info rows) =====
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Each row shows one info field (icon + label + value)
                    _buildInfoRow(Icons.person_outline, "Username",
                        userName ?? "No Name"),
                    const Divider(height: 25, thickness: 0.8),
                    _buildInfoRow(
                        Icons.email_outlined, "Email", userEmail ?? "No Email"),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // ===== Logout Button =====
              ElevatedButton.icon(
                // Disable button if already logging out
                onPressed: _isLoggingOut ? null : _handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kBlackColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                ),

                // Show loading spinner when logging out
                icon: _isLoggingOut
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.kWhiteColor,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.logout, color: AppColors.kWhiteColor),

                // Change button text dynamically
                label: Text(
                  _isLoggingOut ? 'Logging out...' : 'Logout',
                  style: const TextStyle(
                      color: AppColors.kWhiteColor, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a consistent info row for displaying user data (e.g., name, email)
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppColors.kBlack54Color),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Label (smaller gray text)
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.kGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),

              // Value (larger, darker text)
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.kBlack87Color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
