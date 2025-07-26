// // // skills_card.dart
// // import 'package:flutter/material.dart';
// // import 'responsive_utils.dart';

// // class SkillsCard extends StatelessWidget {
// //   const SkillsCard({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(16),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'مهاراتي',
// //               style: TextStyle(
// //                 fontSize: 28,
// //                 fontWeight: FontWeight.bold,
// //                 color: Theme.of(context).colorScheme.primary,
// //               ),
// //             ),
// //             const SizedBox(height: 24),

// //             const SkillsGrid(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SkillsGrid extends StatelessWidget {
// //   const SkillsGrid({super.key});

// //   // List of skills with their details
// //   final List<SkillData> skills = const [
// //     SkillData(name: 'Flutter', level: 0.9, color: Colors.blue, icon: Icons.mobile_friendly),
// //     SkillData(name: 'Dart', level: 0.9, color: Colors.blueAccent, icon: Icons.code),
// //     SkillData(name: 'Firebase', level: 0.8, color: Colors.orange, icon: Icons.cloud),
// //     SkillData(name: 'UI/UX Design', level: 0.85, color: Colors.purple, icon: Icons.design_services),
// //     SkillData(name: 'REST APIs', level: 0.8, color: Colors.green, icon: Icons.api),
// //     SkillData(name: 'Git & GitHub', level: 0.85, color: Colors.red, icon: Icons.source),
// //     SkillData(name: 'State Management', level: 0.85, color: Colors.teal, icon: Icons.settings),
// //     SkillData(name: 'SQLite', level: 0.75, color: Colors.indigo, icon: Icons.storage),
// //     SkillData(name: 'Native Development', level: 0.7, color: Colors.deepOrange, icon: Icons.phone_android),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     final crossAxisCount = _getCrossAxisCount(context);

// //     return GridView.builder(
// //       shrinkWrap: true,
// //       physics: const NeverScrollableScrollPhysics(),
// //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: crossAxisCount,
// //         crossAxisSpacing: 16,
// //         mainAxisSpacing: 16,
// //         childAspectRatio: 1.2,
// //       ),
// //       itemCount: skills.length,
// //       itemBuilder: (context, index) {
// //         return SkillCard(skill: skills[index]);
// //       },
// //     );
// //   }

// //   int _getCrossAxisCount(BuildContext context) {
// //     if (ResponsiveUtils.isDesktop(context)) {
// //       return 3;
// //     } else if (ResponsiveUtils.isTablet(context)) {
// //       return 2;
// //     } else {
// //       return 1;
// //     }
// //   }
// // }

// // class SkillCard extends StatelessWidget {
// //   final SkillData skill;

// //   const SkillCard({
// //     super.key,
// //     required this.skill,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(12),
// //         border: Border.all(
// //           color: skill.color.withOpacity(0.3),
// //           width: 1,
// //         ),
// //         color: skill.color.withOpacity(0.05),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             // Skill Icon
// //             Container(
// //               padding: const EdgeInsets.all(12),
// //               decoration: BoxDecoration(
// //                 color: skill.color.withOpacity(0.1),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: Icon(
// //                 skill.icon,
// //                 size: 30,
// //                 color: skill.color,
// //               ),
// //             ),
// //             const SizedBox(height: 12),

// //             // Skill Name
// //             Text(
// //               skill.name,
// //               style: const TextStyle(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //               textAlign: TextAlign.center,
// //               maxLines: 1,
// //               overflow: TextOverflow.ellipsis,
// //             ),
// //             const SizedBox(height: 8),

// //             // Skill Level Progress Bar
// //             Column(
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'المستوى',
// //                       style: TextStyle(
// //                         fontSize: 12,
// //                         color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
// //                       ),
// //                     ),
// //                     Text(
// //                       '${(skill.level * 100).toInt()}%',
// //                       style: TextStyle(
// //                         fontSize: 12,
// //                         fontWeight: FontWeight.bold,
// //                         color: skill.color,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 4),
// //                 LinearProgressIndicator(
// //                   value: skill.level,
// //                   backgroundColor: skill.color.withOpacity(0.2),
// //                   valueColor: AlwaysStoppedAnimation<Color>(skill.color),
// //                   minHeight: 4,
// //                   borderRadius: BorderRadius.circular(2),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SkillData {
// //   final String name;
// //   final double level;
// //   final Color color;
// //   final IconData icon;

// //   const SkillData({
// //     required this.name,
// //     required this.level,
// //     required this.color,
// //     required this.icon,
// //   });
// // }

// // skills_card.dart
// import 'package:flutter/material.dart';
// import 'responsive_utils.dart';

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
//             Text(
//               'مهاراتي',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//             const SizedBox(height: 24),

//             const SkillsGrid(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SkillsGrid extends StatelessWidget {
//   const SkillsGrid({super.key});

//   // List of skills with their details
//   final List<SkillData> skills = const [
//     SkillData(
//       name: 'Flutter',
//       level: 0.9,
//       color: Colors.blue,
//       icon: Icons.mobile_friendly,
//     ),
//     SkillData(
//       name: 'Dart',
//       level: 0.9,
//       color: Colors.blueAccent,
//       icon: Icons.code,
//     ),
//     SkillData(
//       name: 'Firebase',
//       level: 0.8,
//       color: Colors.orange,
//       icon: Icons.cloud,
//     ),
//     SkillData(
//       name: 'UI/UX Design',
//       level: 0.85,
//       color: Colors.purple,
//       icon: Icons.design_services,
//     ),
//     SkillData(
//       name: 'REST APIs',
//       level: 0.8,
//       color: Colors.green,
//       icon: Icons.api,
//     ),
//     SkillData(
//       name: 'Git & GitHub',
//       level: 0.85,
//       color: Colors.red,
//       icon: Icons.source,
//     ),
//     SkillData(
//       name: 'State Management',
//       level: 0.85,
//       color: Colors.teal,
//       icon: Icons.settings,
//     ),
//     SkillData(
//       name: 'SQLite',
//       level: 0.75,
//       color: Colors.indigo,
//       icon: Icons.storage,
//     ),
//     SkillData(
//       name: 'Native Development',
//       level: 0.7,
//       color: Colors.deepOrange,
//       icon: Icons.phone_android,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final crossAxisCount = _getCrossAxisCount(context);

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//         childAspectRatio: 1.8, // Made smaller (was 1.2)
//       ),
//       itemCount: skills.length,
//       itemBuilder: (context, index) {
//         return SkillCard(skill: skills[index]);
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
//         padding: const EdgeInsets.all(12), // Reduced from 16
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Skill Icon
//             Container(
//               padding: const EdgeInsets.all(8), // Reduced from 12
//               decoration: BoxDecoration(
//                 color: skill.color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(6), // Reduced from 8
//               ),
//               child: Icon(
//                 skill.icon,
//                 size: 20, // Reduced from 30
//                 color: skill.color,
//               ),
//             ),
//             const SizedBox(height: 8), // Reduced from 12
//             // Skill Name
//             Text(
//               skill.name,
//               style: const TextStyle(
//                 fontSize: 14, // Reduced from 16
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 6), // Reduced from 8
//             // Skill Level Progress Bar
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'المستوى',
//                       style: TextStyle(
//                         fontSize: 10, // Reduced from 12
//                         color: Theme.of(
//                           context,
//                         ).colorScheme.onSurface.withOpacity(0.6),
//                       ),
//                     ),
//                     Text(
//                       '${(skill.level * 100).toInt()}%',
//                       style: TextStyle(
//                         fontSize: 10, // Reduced from 12
//                         fontWeight: FontWeight.bold,
//                         color: skill.color,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 3), // Reduced from 4
//                 LinearProgressIndicator(
//                   value: skill.level,
//                   backgroundColor: skill.color.withOpacity(0.2),
//                   valueColor: AlwaysStoppedAnimation<Color>(skill.color),
//                   minHeight: 3, // Reduced from 4
//                   borderRadius: BorderRadius.circular(1.5), // Reduced from 2
//                 ),
//               ],
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

// skills_card.dart
import 'package:flutter/material.dart';
import 'responsive_utils.dart';

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
                'مهاراتي',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 24),

            const SkillsGrid(),
          ],
        ),
      ),
    );
  }
}

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  // List of skills with their details
  final List<SkillData> skills = const [
    SkillData(
      name: 'Flutter',
      level: 0.9,
      color: Colors.blue,
      icon: Icons.mobile_friendly,
    ),
    SkillData(
      name: 'Dart',
      level: 0.9,
      color: Colors.blueAccent,
      icon: Icons.code,
    ),
    SkillData(
      name: 'Firebase',
      level: 0.8,
      color: Colors.orange,
      icon: Icons.cloud,
    ),
    SkillData(
      name: 'UI/UX Design',
      level: 0.85,
      color: Colors.purple,
      icon: Icons.design_services,
    ),
    SkillData(
      name: 'REST APIs',
      level: 0.8,
      color: Colors.green,
      icon: Icons.api,
    ),
    SkillData(
      name: 'Git & GitHub',
      level: 0.85,
      color: Colors.red,
      icon: Icons.source,
    ),
    SkillData(
      name: 'State Management',
      level: 0.85,
      color: Colors.teal,
      icon: Icons.settings,
    ),
    SkillData(
      name: 'SQLite',
      level: 0.75,
      color: Colors.indigo,
      icon: Icons.storage,
    ),
    SkillData(
      name: 'Native Development',
      level: 0.7,
      color: Colors.deepOrange,
      icon: Icons.phone_android,
    ),
  ];

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
        childAspectRatio: 2.8, // Made much smaller (was 1.8)
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        return SkillCard(skill: skills[index]);
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
        padding: const EdgeInsets.all(8), // Reduced from 12
        child: Row(
          // Changed from Column to Row for horizontal layout
          children: [
            // Skill Icon
            Container(
              padding: const EdgeInsets.all(6), // Reduced from 8
              decoration: BoxDecoration(
                color: skill.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4), // Reduced from 6
              ),
              child: Icon(
                skill.icon,
                size: 16, // Reduced from 20
                color: skill.color,
              ),
            ),
            const SizedBox(width: 8), // Space between icon and content
            // Skill Name and Progress
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skill Name
                  Text(
                    skill.name,
                    style: const TextStyle(
                      fontSize: 12, // Reduced from 14
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4), // Reduced from 6
                  // Skill Level Progress Bar
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: skill.level,
                          backgroundColor: skill.color.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            skill.color,
                          ),
                          minHeight: 2, // Reduced from 3
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${(skill.level * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 9, // Reduced from 10
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
