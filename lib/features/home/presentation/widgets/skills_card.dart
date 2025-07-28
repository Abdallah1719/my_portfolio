// skills_card.dart - Fixed Version with Fallback Skills
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/generated/l10n.dart';
import '../../../../core/utils/responsive_utils.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

// دالة ترجع اللون والأيقونة والمستوى حسب اسم المهارة
SkillData getSkillData(String name) {
  switch (name) {
    case 'Flutter':
      return SkillData(
        name: name,
        level: 0.9,
        color: Colors.blue,
        icon: Icons.mobile_friendly,
      );
    case 'Dart':
      return SkillData(
        name: name,
        level: 0.9,
        color: Colors.blueAccent,
        icon: Icons.code,
      );
    case 'Firebase & supabase':
      return SkillData(
        name: name,
        level: 0.8,
        color: Colors.orange,
        icon: Icons.cloud,
      );
    case 'UI/UX Design':
      return SkillData(
        name: name,
        level: 0.85,
        color: Colors.purple,
        icon: Icons.design_services,
      );
    case 'API integration (JSON, REST)':
      return SkillData(
        name: name,
        level: 0.85,
        color: Colors.green,
        icon: Icons.api,
      );
    case 'Version Control (Git)':
      return SkillData(
        name: name,
        level: 0.95,
        color: Colors.red,
        icon: Icons.source,
      );
    case 'State Management (Bloc,Provider,Riverpod)':
      return SkillData(
        name: name,
        level: 0.85,
        color: Colors.teal,
        icon: Icons.settings,
      );
    case 'SQLite':
      return SkillData(
        name: name,
        level: 0.75,
        color: Colors.indigo,
        icon: Icons.storage,
      );
    case 'Solid Principles':
      return SkillData(
        name: name,
        level: 0.75,
        color: Colors.orange,
        icon: Icons.phone_android,
      );
    case 'BLoC Pattern':
      return SkillData(
        name: name,
        level: 0.85,
        color: Colors.cyan,
        icon: Icons.architecture,
      );
    case 'Clean Architecture,MVVM,MVC':
      return SkillData(
        name: name,
        level: 0.8,
        color: Colors.amber,
        icon: Icons.layers,
      );
    case 'GetX':
      return SkillData(
        name: name,
        level: 0.75,
        color: Colors.lightGreen,
        icon: Icons.flash_on,
      );
    default:
      return SkillData(
        name: name,
        level: 0.70,
        color: Colors.blueGrey,
        icon: Icons.star,
      );
  }
}

// قائمة المهارات الاحتياطية
List<String> getDefaultSkills() {
  return [
    'Flutter',
    'Dart',
    'Firebase',
    'UI/UX Design',
    'REST APIs',
    'Git & GitHub',
    'State Management',
    'BLoC Pattern',
    'Provider',
    'SQLite',
  ];
}

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                S.of(context).skills_title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<PortfolioCubit, PortfolioState>(
              builder: (context, state) {
                // Handle Loading States
                if (state is PortfolioLoading ||
                    state is PortfolioPersonalInfoLoading) {
                  return _buildLoadingContent(context);
                }

                // Handle Error States
                if (state is PortfolioError) {
                  return _buildErrorContent(context, () {
                    context.read<PortfolioCubit>().loadAllPortfolioData();
                  });
                }

                if (state is PortfolioPersonalInfoError) {
                  return _buildErrorContent(context, () {
                    context.read<PortfolioCubit>().getPersonalInfo();
                  });
                }

                // Extract skills from different state types
                List<String> skills = [];

                if (state is PortfolioAllDataLoaded) {
                  skills = state.skills;
                } else if (state is PortfolioPersonalInfoLoaded) {
                  skills = state.personalInfo.skills;
                } else if (state is PortfolioSkillsLoaded) {
                  skills = state.skills;
                }

                // Show skills if available, otherwise show default skills
                List<String> skillsToShow = skills.isNotEmpty
                    ? skills
                    : getDefaultSkills();
                return SkillsGrid(
                  skills: skillsToShow,
                  isDefault: skills.isEmpty,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.8,
      ),
      itemCount: 6, // عرض 6 عناصر تحميل
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorContent(BuildContext context, VoidCallback onRetry) {
    return Column(
      children: [
        Icon(Icons.error_outline, size: 64, color: Colors.red.withOpacity(0.7)),
        const SizedBox(height: 16),
        Text(
          'فشل في تحميل المهارات',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'سيتم عرض المهارات الافتراضية',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('إعادة المحاولة'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () {
                // عرض المهارات الافتراضية مباشرة
              },
              child: const Text('عرض المهارات الافتراضية'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // عرض المهارات الافتراضية مباشرة بعد الخطأ
        SkillsGrid(skills: getDefaultSkills(), isDefault: true),
      ],
    );
  }
}

class SkillsGrid extends StatelessWidget {
  final List<String> skills;
  final bool isDefault;

  const SkillsGrid({super.key, required this.skills, this.isDefault = false});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = _getCrossAxisCount(context);

    return Column(
      children: [
        // إظهار رسالة إذا كانت المهارات افتراضية
        if (isDefault)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'يتم عرض المهارات الافتراضية - لم يتم تحميل البيانات من الخادم',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.8,
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return SkillCard(skill: getSkillData(skills[index]));
          },
        ),
      ],
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    if (ResponsiveUtils.isDesktop(context)) {
      return 3;
    } else if (ResponsiveUtils.isTablet(context)) {
      return 2;
    } else {
      return 1;
    }
  }
}

class SkillCard extends StatelessWidget {
  final SkillData skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: skill.color.withOpacity(0.3), width: 1),
        color: skill.color.withOpacity(0.05),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: skill.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(skill.icon, size: 16, color: skill.color),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: skill.level,
                          backgroundColor: skill.color.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            skill.color,
                          ),
                          minHeight: 2,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${(skill.level * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: skill.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillData {
  final String name;
  final double level;
  final Color color;
  final IconData icon;

  const SkillData({
    required this.name,
    required this.level,
    required this.color,
    required this.icon,
  });
}
