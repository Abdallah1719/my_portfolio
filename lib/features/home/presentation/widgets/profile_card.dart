// profile_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<PortfolioCubit, PortfolioState>(
          builder: (context, state) {
            if (state is PortfolioLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PortfolioError) {
              return Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'حدث خطأ في تحميل البيانات',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PortfolioCubit>().loadAllPortfolioData();
                      },
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            } else if (state is PortfolioAllDataLoaded) {
              return _buildProfileContent(context, state);
            }

            // Default loading state
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    PortfolioAllDataLoaded state,
  ) {
    final personalInfo = state.personalInfo;

    return Column(
      children: [
        // Profile Image
        CircleAvatar(
          radius: 60,
          // backgroundColor: Theme.of(
          //   context,
          // ).colorScheme.primary.withOpacity(0.1),
          backgroundImage: personalInfo.profilePicture.isNotEmpty
              ? NetworkImage(personalInfo.profilePicture)
              : null,
          child: personalInfo.profilePicture.isEmpty
              ? Icon(
                  Icons.person,
                  size: 60,
                  // color: Theme.of(context).colorScheme.primary,
                )
              : null,
        ),
        const SizedBox(height: 16),

        // Name
        Text(
          personalInfo.name.isNotEmpty ? personalInfo.name : 'Abdallah Tolba ',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // Job Title
        Text(
          personalInfo.jobTitle.isNotEmpty
              ? personalInfo.jobTitle
              : 'Flutter Developer',
          style: TextStyle(
            fontSize: 16,
            // color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 24),

        // Social Icons
        SocialIcons(socialLinks: state.socialLinks),
        const SizedBox(height: 24),

        // Personal Info
        PersonalInfo(personalInfo: personalInfo),
        const SizedBox(height: 24),

        // Skills
        SkillsSection(skills: state.skills),
        const SizedBox(height: 24),

        // Additional Skills
        AdditionalSkillsSection(extraSkills: state.extraSkills),
        const SizedBox(height: 24),
        // Languages
        LanguagesSection(languages: state.languages),
        const SizedBox(height: 24),

        // Download CV Button
        ElevatedButton.icon(
          onPressed: personalInfo.cvLink.isNotEmpty
              ? () => _launchURL(personalInfo.cvLink)
              : null,
          icon: const Icon(Icons.download),
          label: Text(S.of(context).download_cv),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}

class SocialIcons extends StatelessWidget {
  final List<SocialLinksItem> socialLinks;

  const SocialIcons({super.key, required this.socialLinks});

  @override
  Widget build(BuildContext context) {
    if (socialLinks.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: socialLinks.map((socialLink) {
        return IconButton(
          onPressed: () => _launchURL(socialLink.url),
          icon: Icon(_getSocialIcon(context, socialLink.platform)),
          color: Theme.of(context).colorScheme.primary,
          tooltip: socialLink.platform,
        );
      }).toList(),
    );
  }

  IconData _getSocialIcon(BuildContext context, String platform) {
    switch (platform.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.work;
      case 'email':
        return Icons.email;
      case 'facebook':
        return Icons.facebook;
      case 'twitter':
        return Icons.alternate_email;
      case 'instagram':
        return Icons.camera_alt;
      default:
        return Icons.link;
    }
  }

  void _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}

class PersonalInfo extends StatelessWidget {
  final PortfolioModel personalInfo;

  const PersonalInfo({super.key, required this.personalInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).about_me,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        if (personalInfo.age.isNotEmpty)
          _buildInfoRow(S.of(context).age, '${personalInfo.age} '),
        if (personalInfo.age.isNotEmpty && personalInfo.freelance.isNotEmpty)
          const SizedBox(height: 8),
        if (personalInfo.freelance.isNotEmpty)
          _buildInfoRow(S.of(context).freelance, personalInfo.freelance),
        if (personalInfo.address.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildInfoRow(S.of(context).address, personalInfo.address),
        ],
        if (personalInfo.email.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildInfoRow(S.of(context).email, personalInfo.email),
        ],
        if (personalInfo.phoneNumber.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildInfoRow(S.of(context).phoneNumber, personalInfo.phoneNumber),
        ],
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(flex: 3, child: Text(value, textAlign: TextAlign.end)),
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  final List<String> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).skills_title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        ...skills.map(
          (skill) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _buildSkillChip(skill),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Text(
        skill,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class LanguagesSection extends StatelessWidget {
  final List<String> languages;

  const LanguagesSection({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    if (languages.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).languages_title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        ...languages.map(
          (language) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _buildLanguageItem(language),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageItem(String language) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Text(
        language,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class AdditionalSkillsSection extends StatelessWidget {
  final List<String> extraSkills;

  const AdditionalSkillsSection({super.key, required this.extraSkills});

  @override
  Widget build(BuildContext context) {
    if (extraSkills.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).extra_skills_title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        ...extraSkills.map(
          (skill) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _buildAdditionalSkill(skill),
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalSkill(String skill) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Text(
        skill,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
