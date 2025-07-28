// // skills_card.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'responsive_utils.dart';
// import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
// import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

// // دالة ترجع اللون والأيقونة والمستوى حسب اسم المهارة
// SkillData getSkillData(String name) {
//   switch (name) {
//     case 'Flutter':
//       return SkillData(
//         name: name,
//         level: 0.9,
//         color: Colors.blue,
//         icon: Icons.mobile_friendly,
//       );
//     case 'Dart':
//       return SkillData(
//         name: name,
//         level: 0.9,
//         color: Colors.blueAccent,
//         icon: Icons.code,
//       );
//     case 'Firebase':
//       return SkillData(
//         name: name,
//         level: 0.8,
//         color: Colors.orange,
//         icon: Icons.cloud,
//       );
//     case 'UI/UX Design':
//       return SkillData(
//         name: name,
//         level: 0.85,
//         color: Colors.purple,
//         icon: Icons.design_services,
//       );
//     case 'REST APIs':
//       return SkillData(
//         name: name,
//         level: 0.8,
//         color: Colors.green,
//         icon: Icons.api,
//       );
//     case 'Git & GitHub':
//       return SkillData(
//         name: name,
//         level: 0.85,
//         color: Colors.red,
//         icon: Icons.source,
//       );
//     case 'State Management':
//       return SkillData(
//         name: name,
//         level: 0.85,
//         color: Colors.teal,
//         icon: Icons.settings,
//       );
//     case 'SQLite':
//       return SkillData(
//         name: name,
//         level: 0.75,
//         color: Colors.indigo,
//         icon: Icons.storage,
//       );
//     case 'Native Development':
//       return SkillData(
//         name: name,
//         level: 0.7,
//         color: Colors.deepOrange,
//         icon: Icons.phone_android,
//       );
//     default:
//       return SkillData(
//         name: name,
//         level: 0.8,
//         color: Colors.blueGrey,
//         icon: Icons.star,
//       );
//   }
// }

// class SkillsCard extends StatelessWidget {
//   const SkillsCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(
//                 'مهاراتي',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             BlocBuilder<PortfolioCubit, PortfolioState>(
//               builder: (context, state) {
//                 List<String> skills = [];
//                 if (state is PortfolioPersonalInfoLoaded) {
//                   skills = state.personalInfo.skills;
//                 } else if (state is PortfolioAllDataLoaded) {
//                   skills = state.personalInfo.skills;
//                 } else if (state is PortfolioPersonalInfoLoading ||
//                     state is PortfolioLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is PortfolioPersonalInfoError ||
//                     state is PortfolioError) {
//                   return const Center(
//                     child: Text('حدث خطأ أثناء تحميل المهارات'),
//                   );
//                 }

//                 if (skills.isEmpty) {
//                   return const Center(
//                     child: Text('لا توجد مهارات متاحة حالياً.'),
//                   );
//                 }

//                 return SkillsGrid(skills: skills);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SkillsGrid extends StatelessWidget {
//   final List<String> skills;
//   const SkillsGrid({super.key, required this.skills});

//   @override
//   Widget build(BuildContext context) {
//     final crossAxisCount = _getCrossAxisCount(context);

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         childAspectRatio: 2.8,
//       ),
//       itemCount: skills.length,
//       itemBuilder: (context, index) {
//         return SkillCard(skill: getSkillData(skills[index]));
//       },
//     );
//   }

//   int _getCrossAxisCount(BuildContext context) {
//     if (ResponsiveUtils.isDesktop(context)) {
//       return 3;
//     } else if (ResponsiveUtils.isTablet(context)) {
//       return 2;
//     } else {
//       return 1;
//     }
//   }
// }

// class SkillCard extends StatelessWidget {
//   final SkillData skill;

//   const SkillCard({super.key, required this.skill});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: skill.color.withOpacity(0.3), width: 1),
//         color: skill.color.withOpacity(0.05),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                 color: skill.color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Icon(skill.icon, size: 16, color: skill.color),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     skill.name,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: LinearProgressIndicator(
//                           value: skill.level,
//                           backgroundColor: skill.color.withOpacity(0.2),
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                             skill.color,
//                           ),
//                           minHeight: 2,
//                           borderRadius: BorderRadius.circular(1),
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       Text(
//                         '${(skill.level * 100).toInt()}%',
//                         style: TextStyle(
//                           fontSize: 9,
//                           fontWeight: FontWeight.bold,
//                           color: skill.color,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SkillData {
//   final String name;
//   final double level;
//   final Color color;
//   final IconData icon;

//   const SkillData({
//     required this.name,
//     required this.level,
//     required this.color,
//     required this.icon,
//   });
// }
// skills_card.dart - Fixed Version
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'responsive_utils.dart';
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
    case 'Firebase':
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
    case 'REST APIs':
      return SkillData(
        name: name,
        level: 0.8,
        color: Colors.green,
        icon: Icons.api,
      );
    case 'Git & GitHub':
      return SkillData(
        name: name,
        level: 0.85,
        color: Colors.red,
        icon: Icons.source,
      );
    case 'State Management':
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
    case 'Native Development':
      return SkillData(
        name: name,
        level: 0.7,
        color: Colors.deepOrange,
        icon: Icons.phone_android,
      );
    default:
      return SkillData(
        name: name,
        level: 0.8,
        color: Colors.blueGrey,
        icon: Icons.star,
      );
  }
}

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  // @override
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
                'مهاراتي',
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
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                // Handle Error States
                if (state is PortfolioError) {
                  return Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'حدث خطأ أثناء تحميل المهارات',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<PortfolioCubit>()
                                .loadAllPortfolioData();
                          },
                          child: const Text('إعادة المحاولة'),
                        ),
                      ],
                    ),
                  );
                }

                if (state is PortfolioPersonalInfoError) {
                  return Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'حدث خطأ أثناء تحميل المهارات',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<PortfolioCubit>().getPersonalInfo();
                          },
                          child: const Text('إعادة المحاولة'),
                        ),
                      ],
                    ),
                  );
                }

                // Extract skills from different state types
                List<String> skills = [];

                if (state is PortfolioAllDataLoaded) {
                  skills = state
                      .skills; // استخدم الـ skills المنفصلة مش اللي جوه personalInfo
                } else if (state is PortfolioPersonalInfoLoaded) {
                  skills = state.personalInfo.skills;
                } else if (state is PortfolioSkillsLoaded) {
                  skills = state.skills;
                }

                // Show skills if available
                if (skills.isNotEmpty) {
                  return SkillsGrid(skills: skills);
                }

                // Show default message
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.stars,
                          size: 64,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'لا توجد مهارات متاحة حالياً.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsGrid extends StatelessWidget {
  final List<String> skills;
  const SkillsGrid({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = _getCrossAxisCount(context);

    return GridView.builder(
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
