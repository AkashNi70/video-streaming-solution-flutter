import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class AppSettingsMenuTile extends StatelessWidget {
  const AppSettingsMenuTile({super.key, required this.icon, required this.title, this.trailing, this.onTap});

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // final dark = AppHelperFunctions.isDarkMode(context);
    return ListTile(
      leading: Container(height: 45,width: 45, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.primary),child: Icon(icon, size: 25, color: AppColors.black)),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: trailing,
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
