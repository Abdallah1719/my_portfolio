// // summary_card.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
// import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

// class SummaryCard extends StatelessWidget {
//   const SummaryCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: BlocBuilder<PortfolioCubit, PortfolioState>(
//           builder: (context, state) {
//             if (state is PortfolioAllDataLoaded) {
//               return _buildSummaryContent(
//                 context,
//                 state.personalInfo.summaryImage,
//                 state.personalInfo.summary,
//               );
//             } else if (state is PortfolioPersonalInfoLoaded) {
//               return _buildSummaryContent(
//                 context,
//                 state.personalInfo.summaryImage,
//                 state.personalInfo.summary,
//               );
//             } else if (state is PortfolioPersonalInfoLoading) {
//               return _buildLoadingContent(context);
//             } else if (state is PortfolioPersonalInfoError) {
//               return _buildErrorContent(context, state.message);
//             } else {
//               return _buildDefaultContent(context);
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildSummaryContent(
//     BuildContext context,
//     String summaryImage,
//     String summary,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Summary Image
//         _buildSummaryImage(context, summaryImage),
//         const SizedBox(height: 20),

//         // Summary Title
//         Text(
//           'نبذة عني',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Summary Text
//         Text(
//           summary.isNotEmpty ? summary : _getDefaultSummary(),
//           style: TextStyle(
//             fontSize: 16,
//             height: 1.6,
//             color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSummaryImage(BuildContext context, String summaryImage) {
//     return Container(
//       width: double.infinity,
//       height: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//       ),
//       child: summaryImage.isNotEmpty
//           ? ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: CachedNetworkImage(
//                 imageUrl: summaryImage,
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) => Center(
//                   child: CircularProgressIndicator(
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//                 errorWidget: (context, url, error) => Icon(
//                   Icons.web,
//                   size: 80,
//                   color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
//                 ),
//               ),
//             )
//           : Icon(
//               Icons.web,
//               size: 80,
//               color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
//             ),
//     );
//   }

//   Widget _buildLoadingContent(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Loading Image Placeholder
//         Container(
//           width: double.infinity,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//           ),
//           child: Center(
//             child: CircularProgressIndicator(
//               color: Theme.of(context).colorScheme.primary,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),

//         // Loading Title Placeholder
//         Container(
//           height: 28,
//           width: 120,
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Loading Text Placeholders
//         Column(
//           children: List.generate(
//             4,
//             (index) => Container(
//               margin: const EdgeInsets.only(bottom: 8),
//               height: 20,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildErrorContent(BuildContext context, String errorMessage) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Error Image
//         Container(
//           width: double.infinity,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: Colors.red.withOpacity(0.1),
//           ),
//           child: Icon(
//             Icons.error_outline,
//             size: 80,
//             color: Colors.red.withOpacity(0.5),
//           ),
//         ),
//         const SizedBox(height: 20),

//         // Error Title
//         Text(
//           'خطأ في تحميل البيانات',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.red,
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Error Message
//         Text(
//           errorMessage,
//           style: TextStyle(
//             fontSize: 16,
//             height: 1.6,
//             color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Retry Button
//         ElevatedButton(
//           onPressed: () {
//             context.read<PortfolioCubit>().getPersonalInfo();
//           },
//           child: const Text('إعادة المحاولة'),
//         ),
//       ],
//     );
//   }

//   Widget _buildDefaultContent(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Default Image
//         Container(
//           width: double.infinity,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//           ),
//           child: Icon(
//             Icons.web,
//             size: 80,
//             color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
//           ),
//         ),
//         const SizedBox(height: 20),

//         // Default Title
//         Text(
//           'نبذة عني',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Default Summary Text
//         Text(
//           _getDefaultSummary(),
//           style: TextStyle(
//             fontSize: 16,
//             height: 1.6,
//             color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
//           ),
//         ),
//       ],
//     );
//   }

//   String _getDefaultSummary() {
//     return 'مطور تطبيقات Flutter مع خبرة أكثر من 3 سنوات في تطوير التطبيقات المحمولة. أحب إنشاء تطبيقات جميلة وسهلة الاستخدام تحل مشاكل المستخدمين الحقيقية. لدي خبرة واسعة في العمل مع الـ State Management، APIs، والـ UI/UX Design. أسعى دائماً لتعلم التقنيات الجديدة ومشاركة المعرفة مع المجتمع.';
//   }
// }
// summary_card.dart - Fixed Version
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  //  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<PortfolioCubit, PortfolioState>(
          builder: (context, state) {
            // Handle Loading States
            if (state is PortfolioLoading || 
                state is PortfolioPersonalInfoLoading) {
              return _buildLoadingContent(context);
            }
            
            // Handle Error States
            if (state is PortfolioError) {
              return _buildErrorContent(context, state.message);
            }
            if (state is PortfolioPersonalInfoError) {
              return _buildErrorContent(context, state.message);
            }
            
            // Handle Success States - Extract data
            String summaryImage = '';
            String summary = '';
            
            if (state is PortfolioAllDataLoaded) {
              summaryImage = state.personalInfo.summaryImage ?? '';
              summary = state.personalInfo.summary ?? '';
            } else if (state is PortfolioPersonalInfoLoaded) {
              summaryImage = state.personalInfo.summaryImage ?? '';
              summary = state.personalInfo.summary ?? '';
            }
            
            // If we have data, show it
            if (summaryImage.isNotEmpty || summary.isNotEmpty) {
              return _buildSummaryContent(context, summaryImage, summary);
            }
            
            // Default fallback
            return _buildDefaultContent(context);
          },
        ),
      ),
    );
  }

  Widget _buildSummaryContent(
    BuildContext context,
    String summaryImage,
    String summary,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary Image
        _buildSummaryImage(context, summaryImage),
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
          summary.isNotEmpty ? summary : _getDefaultSummary(),
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryImage(BuildContext context, String summaryImage) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      child: summaryImage.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: summaryImage,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.web,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
              ),
            )
          : Icon(
              Icons.web,
              size: 80,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Loading Image Placeholder
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Loading Title Placeholder
        Container(
          height: 28,
          width: 120,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 16),

        // Loading Text Placeholders
        Column(
          children: List.generate(
            4,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorContent(BuildContext context, String errorMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Error Image
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red.withOpacity(0.1),
          ),
          child: Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 20),

        // Error Title
        Text(
          'خطأ في تحميل البيانات',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16),

        // Error Message
        Text(
          errorMessage,
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 16),

        // Retry Button
        ElevatedButton(
          onPressed: () {
            context.read<PortfolioCubit>().loadAllPortfolioData();
          },
          child: const Text('إعادة المحاولة'),
        ),
      ],
    );
  }

  Widget _buildDefaultContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Default Image
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

        // Default Title
        Text(
          'نبذة عني',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),

        // Default Summary Text
        Text(
          _getDefaultSummary(),
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  String _getDefaultSummary() {
    return 'مطور تطبيقات Flutter مع خبرة أكثر من 3 سنوات في تطوير التطبيقات المحمولة. أحب إنشاء تطبيقات جميلة وسهلة الاستخدام تحل مشاكل المستخدمين الحقيقية. لدي خبرة واسعة في العمل مع الـ State Management، APIs، والـ UI/UX Design. أسعى دائماً لتعلم التقنيات الجديدة ومشاركة المعرفة مع المجتمع.';
  }
}