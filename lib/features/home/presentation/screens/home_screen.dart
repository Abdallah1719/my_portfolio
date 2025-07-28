// portfolio_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/theme/cubit/theme_cubit.dart';
import 'package:my_portfolio/features/home/presentation/widgets/contact_card.dart';
import 'package:my_portfolio/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:my_portfolio/features/home/presentation/widgets/profile_card.dart';
import 'package:my_portfolio/features/home/presentation/widgets/project_card.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_utils.dart';
import 'package:my_portfolio/features/home/presentation/widgets/skills_card.dart';
import 'package:my_portfolio/features/home/presentation/widgets/summary_card.dart';
import 'package:my_portfolio/l10n/cubit/local_cubit.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onThemeToggle: () => context.read<ThemeCubit>().toggleTheme(),
        onLanguageToggle: () => context.read<LocaleCubit>().toggleLocale(),
        onProfileTap:
            ResponsiveUtils.isMobile(context) ||
                ResponsiveUtils.isTablet(context)
            ? () => _showProfileBottomSheet(context)
            : null,
      ),
      drawer:
          ResponsiveUtils.isMobile(context) || ResponsiveUtils.isTablet(context)
          ? null
          : null,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ResponsiveUtils.isDesktop(context)
        ? _buildDesktopLayout(context)
        : _buildMobileTabletLayout(context);
  }

  void _showProfileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Profile content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: const ProfileCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveUtils.getPagePadding(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Profile Card
          SizedBox(
            width: ResponsiveUtils.getProfileCardWidth(context),
            child: const ProfileCard(),
          ),
          const SizedBox(width: 24),

          // Right Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Card
                const SummaryCard(),
                const SizedBox(height: 32),

                // Projects Section
                const ProjectsSection(),
                const SizedBox(height: 32),

                // Skills Card
                const SkillsCard(),
                const SizedBox(height: 32),

                // Contact Card for Desktop
                const ContactCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTabletLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveUtils.getPagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary Card
          const SummaryCard(),
          const SizedBox(height: 24),

          // Projects Section
          const ProjectsSection(),
          const SizedBox(height: 32),

          // Skills Card
          const SkillsCard(),
          const SizedBox(height: 32),

          // Contact Card (Full Width at Bottom)
          const ContactCard(),
        ],
      ),
    );
  }
}
