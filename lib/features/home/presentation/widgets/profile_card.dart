// // profile_card.dart
// import 'package:flutter/material.dart';

// class ProfileCard extends StatelessWidget {
//   const ProfileCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             // Profile Image
//             const CircleAvatar(
//               radius: 60,
//               backgroundImage: NetworkImage(
//                 'https://via.placeholder.com/150',
//               ),
//             ),
//             const SizedBox(height: 16),
            
//             // Name
//             const Text(
//               'أحمد محمد',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
            
//             // Job Title
//             Text(
//               'مطور تطبيقات Flutter',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Theme.of(context).colorScheme.secondary,
//               ),
//             ),
//             const SizedBox(height: 24),
            
//             // Social Icons
//             const SocialIcons(),
//             const SizedBox(height: 24),
            
//             // Personal Info
//             const PersonalInfo(),
//             const SizedBox(height: 24),
            
//             // Skills
//             const SkillsSection(),
//             const SizedBox(height: 24),
            
//             // Languages
//             const LanguagesSection(),
//             const SizedBox(height: 24),
            
//             // Additional Skills
//             const AdditionalSkillsSection(),
//             const SizedBox(height: 24),
            
//             // Download CV Button
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Download CV functionality
//               },
//               icon: const Icon(Icons.download),
//               label: const Text('تحميل السيرة الذاتية'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 12,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SocialIcons extends StatelessWidget {
//   const SocialIcons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.email),
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.phone),
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.link),
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.facebook),
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.work),
//           color: Theme.of(context).colorScheme.primary,
//         ),
//       ],
//     );
//   }
// }

// class PersonalInfo extends StatelessWidget {
//   const PersonalInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'معلومات عني',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildInfoRow('العمر', '25 سنة'),
//         const SizedBox(height: 8),
//         _buildInfoRow('الحالة', 'متاح للعمل'),
//       ],
//     );
//   }

//   Widget _buildInfoRow(String label, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//         Text(value),
//       ],
//     );
//   }
// }

// class SkillsSection extends StatelessWidget {
//   const SkillsSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'المهارات',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildSkillChip('Flutter'),
//         const SizedBox(height: 8),
//         _buildSkillChip('Dart'),
//       ],
//     );
//   }

//   Widget _buildSkillChip(String skill) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       decoration: BoxDecoration(
//         color: Colors.blue.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.blue.withOpacity(0.3)),
//       ),
//       child: Text(
//         skill,
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontWeight: FontWeight.w500),
//       ),
//     );
//   }
// }

// class LanguagesSection extends StatelessWidget {
//   const LanguagesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'اللغات',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildLanguageItem('العربية'),
//         const SizedBox(height: 8),
//         _buildLanguageItem('الإنجليزية'),
//       ],
//     );
//   }

//   Widget _buildLanguageItem(String language) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       decoration: BoxDecoration(
//         color: Colors.green.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.green.withOpacity(0.3)),
//       ),
//       child: Text(
//         language,
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontWeight: FontWeight.w500),
//       ),
//     );
//   }
// }

// class AdditionalSkillsSection extends StatelessWidget {
//   const AdditionalSkillsSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'مهارات إضافية',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildAdditionalSkill('UI/UX Design'),
//         const SizedBox(height: 8),
//         _buildAdditionalSkill('Firebase'),
//       ],
//     );
//   }

//   Widget _buildAdditionalSkill(String skill) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       decoration: BoxDecoration(
//         color: Colors.orange.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.orange.withOpacity(0.3)),
//       ),
//       child: Text(
//         skill,
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontWeight: FontWeight.w500),
//       ),
//     );
//   }
// }
// profile_card.dart
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 60,
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            
            // Name
            const Text(
              'أحمد محمد',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            // Job Title
            Text(
              'مطور تطبيقات Flutter',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 24),
            
            // Social Icons
            const SocialIcons(),
            const SizedBox(height: 24),
            
            // Personal Info
            const PersonalInfo(),
            const SizedBox(height: 24),
            
            // Skills
            const SkillsSection(),
            const SizedBox(height: 24),
            
            // Languages
            const LanguagesSection(),
            const SizedBox(height: 24),
            
            // Additional Skills
            const AdditionalSkillsSection(),
            const SizedBox(height: 24),
            
            // Download CV Button
            ElevatedButton.icon(
              onPressed: () {
                // Download CV functionality
              },
              icon: const Icon(Icons.download),
              label: const Text('تحميل السيرة الذاتية'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.email),
          color: Theme.of(context).colorScheme.primary,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.phone),
          color: Theme.of(context).colorScheme.primary,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.link),
          color: Theme.of(context).colorScheme.primary,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.facebook),
          color: Theme.of(context).colorScheme.primary,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.work),
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معلومات عني',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        _buildInfoRow('العمر', '25 سنة'),
        const SizedBox(height: 8),
        _buildInfoRow('الحالة', 'متاح للعمل'),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(value),
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المهارات',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        _buildSkillChip('Flutter'),
        const SizedBox(height: 8),
        _buildSkillChip('Dart'),
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
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اللغات',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        _buildLanguageItem('العربية'),
        const SizedBox(height: 8),
        _buildLanguageItem('الإنجليزية'),
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
  const AdditionalSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مهارات إضافية',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        _buildAdditionalSkill('UI/UX Design'),
        const SizedBox(height: 8),
        _buildAdditionalSkill('Firebase'),
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