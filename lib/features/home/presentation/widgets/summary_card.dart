// // summary_card.dart
// import 'package:flutter/material.dart';

// class SummaryCard extends StatelessWidget {
//   const SummaryCard({super.key});

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
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Summary Image
//             Container(
//               width: double.infinity,
//               height: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: const DecorationImage(
//                   image: NetworkImage('https://via.placeholder.com/400x200'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
            
//             // Summary Title
//             Text(
//               'نبذة عني',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//             const SizedBox(height: 16),
            
//             // Summary Text
//             Text(
//               'مطور تطبيقات Flutter مع خبرة أكثر من 3 سنوات في تطوير التطبيقات المحمولة. أحب إنشاء تطبيقات جميلة وسهلة الاستخدام تحل مشاكل المستخدمين الحقيقية. لدي خبرة واسعة في العمل مع الـ State Management، APIs، والـ UI/UX Design. أسعى دائماً لتعلم التقنيات الجديدة ومشاركة المعرفة مع المجتمع.',
//               style: TextStyle(
//                 fontSize: 16,
//                 height: 1.6,
//                 color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// summary_card.dart
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: Icon(
                Icons.web,
                size: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 20),
            
            // Summary Title
            Text(
              'نبذة عني',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            
            // Summary Text
            Text(
              'مطور تطبيقات Flutter مع خبرة أكثر من 3 سنوات في تطوير التطبيقات المحمولة. أحب إنشاء تطبيقات جميلة وسهلة الاستخدام تحل مشاكل المستخدمين الحقيقية. لدي خبرة واسعة في العمل مع الـ State Management، APIs، والـ UI/UX Design. أسعى دائماً لتعلم التقنيات الجديدة ومشاركة المعرفة مع المجتمع.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}