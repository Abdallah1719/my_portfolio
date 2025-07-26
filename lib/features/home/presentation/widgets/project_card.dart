// // project_card.dart
// import 'package:flutter/material.dart';
// import 'responsive_utils.dart';

// class ProjectsSection extends StatelessWidget {
//   const ProjectsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final projectCount = ResponsiveUtils.getProjectCardCount(context);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'مشاريعي',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 24),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: projectCount,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//             childAspectRatio: 0.8,
//           ),
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             return ProjectCard(
//               title: 'مشروع ${index + 1}',
//               description: 'وصف مختصر للمشروع ${index + 1}',
//               imageUrl: 'https://via.placeholder.com/300x200',
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class ProjectCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String imageUrl;

//   const ProjectCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Project Image
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   topRight: Radius.circular(16),
//                 ),
//                 image: DecorationImage(
//                   image: NetworkImage(imageUrl),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),

//           // Project Content
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Project Title
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 8),

//                   // Project Description
//                   Expanded(
//                     child: Text(
//                       description,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),

//                   // Action Buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // Android functionality
//                         },
//                         icon: const Icon(Icons.android),
//                         color: Colors.green,
//                         tooltip: 'Android',
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // iOS functionality
//                         },
//                         icon: const Icon(Icons.phone_iphone),
//                         color: Colors.blue,
//                         tooltip: 'iOS',
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // View project functionality
//                         },
//                         icon: const Icon(Icons.visibility),
//                         color: Theme.of(context).colorScheme.primary,
//                         tooltip: 'عرض المشروع',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// project_card.dart
import 'package:flutter/material.dart';
import 'responsive_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projectCount = ResponsiveUtils.getProjectCardCount(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'مشاريعي',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: projectCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return ProjectCard(
              title: 'مشروع ${index + 1}',
              description: 'وصف مختصر للمشروع ${index + 1}',
              projectIndex: index,
            );
          },
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final int projectIndex;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.projectIndex,
  });

  @override
  Widget build(BuildContext context) {
    // Different icons for different projects
    final icons = [Icons.mobile_friendly, Icons.web, Icons.desktop_windows];
    final colors = [Colors.blue, Colors.green, Colors.orange];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Project Image
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: colors[projectIndex % colors.length].withOpacity(0.1),
              ),
              child: Icon(
                icons[projectIndex % icons.length],
                size: 60,
                color: colors[projectIndex % colors.length],
              ),
            ),
          ),

          // Project Content
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Project Description
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Android functionality
                        },
                        icon: const Icon(Icons.android),
                        color: Colors.green,
                        tooltip: 'Android',
                      ),
                      IconButton(
                        onPressed: () {
                          // iOS functionality
                        },
                        icon: const Icon(Icons.phone_iphone),
                        color: Colors.blue,
                        tooltip: 'iOS',
                      ),
                      IconButton(
                        onPressed: () {
                          // View project functionality
                        },
                        icon: const Icon(Icons.visibility),
                        color: Theme.of(context).colorScheme.primary,
                        tooltip: 'عرض المشروع',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
