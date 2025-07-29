// custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onThemeToggle;
  final VoidCallback? onLanguageToggle;
  final VoidCallback? onProfileTap;

  const CustomAppBar({
    super.key,
    this.onThemeToggle,
    this.onLanguageToggle,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      leading: onProfileTap != null
          ? IconButton(
              onPressed: onProfileTap,
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(0.1),
                child: Icon(
                  Icons.person,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              tooltip: 'الملف الشخصي',
            )
          : null,
      actions: [
        // Theme Toggle Button
        IconButton(
          onPressed: onThemeToggle,
          icon: const Icon(Icons.light_mode),
          tooltip: 'Toggle Theme',
        ),
        const SizedBox(width: 8),
        // Language Toggle Button
        IconButton(
          onPressed: onLanguageToggle,
          icon: const Icon(Icons.language),
          tooltip: 'Change Language',
        ),
        const SizedBox(width: 16),
      ],
      elevation: 2,
      backgroundColor: Colors.green,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Custom Drawer for Mobile/Tablet profile info
class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'أحمد محمد',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('الملف الشخصي'),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.work),
                  title: const Text('المشاريع'),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.contact_mail),
                  title: const Text('تواصل معي'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
