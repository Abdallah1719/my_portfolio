// summary_card.dart - Updated Version with Responsive Full Image
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});
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
            String name = '';
            String jobTitle = '';

            if (state is PortfolioAllDataLoaded) {
              summaryImage = state.personalInfo.summaryImage ?? '';
              summary = state.personalInfo.summary ?? '';
              name = state.personalInfo.name ?? '';
              jobTitle = state.personalInfo.jobTitle ?? '';
            } else if (state is PortfolioPersonalInfoLoaded) {
              summaryImage = state.personalInfo.summaryImage ?? '';
              summary = state.personalInfo.summary ?? '';
              name = state.personalInfo.name ?? '';
              jobTitle = state.personalInfo.jobTitle ?? '';
            }

            // If we have data, show it
            if (summaryImage.isNotEmpty ||
                summary.isNotEmpty ||
                name.isNotEmpty ||
                jobTitle.isNotEmpty) {
              return _buildSummaryContent(
                context,
                summaryImage,
                summary,
                name,
                jobTitle,
              );
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
    String name,
    String jobTitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary Image
        _buildSummaryImage(context, summaryImage),
        const SizedBox(height: 20),

        // Name and Job Title
        _buildNameAndJobTitle(context, name, jobTitle),
        const SizedBox(height: 16),

        // Summary Text
        Text(
          summary.isNotEmpty ? summary : _getDefaultSummary(name, jobTitle),
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildNameAndJobTitle(
    BuildContext context,
    String name,
    String jobTitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        Text(
          name.isNotEmpty ? name : 'اسم المطور',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),

        // Job Title
        Text(
          jobTitle.isNotEmpty ? jobTitle : 'مطور تطبيقات Flutter',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryImage(BuildContext context, String summaryImage) {
    // حساب الارتفاع المتجاوب حسب حجم الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight;

    if (screenWidth > 1200) {
      // Desktop - Large
      imageHeight = 300;
    } else if (screenWidth > 800) {
      // Desktop - Medium
      imageHeight = 250;
    } else if (screenWidth > 600) {
      // Tablet
      imageHeight = 200;
    } else if (screenWidth > 400) {
      // Mobile - Large
      imageHeight = 180;
    } else {
      // Mobile - Small
      imageHeight = 150;
    }

    return Container(
      width: double.infinity,
      height: imageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(
          0xFFFFFFFF,
        ), // استخدام لون رمادي فاتح بدلاً من primary.withOpacity(0.1);
        //  Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: summaryImage.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: summaryImage,
                fit: BoxFit
                    .contain, // تغيير من cover إلى contain لإظهار الصورة كاملة
                width: double.infinity,
                height: imageHeight,
                placeholder: (context, url) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                        strokeWidth: 2,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'جارٍ تحميل الصورة...',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: double.infinity,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red.withOpacity(0.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image_outlined,
                        size: 60,
                        color: Colors.red.withOpacity(0.5),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'فشل في تحميل الصورة',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
                const SizedBox(height: 8),
                Text(
                  'لا توجد صورة',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.7),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    // حساب الارتفاع المتجاوب للتحميل أيضاً
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth > 800
        ? 250
        : (screenWidth > 600 ? 200 : 180);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Loading Image Placeholder
        Container(
          width: double.infinity,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                  strokeWidth: 2,
                ),
                const SizedBox(height: 12),
                Text(
                  'جارٍ تحميل البيانات...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Loading Name Placeholder
        Container(
          height: 32,
          width: 180,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),

        // Loading Job Title Placeholder
        Container(
          height: 24,
          width: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth > 800
        ? 250
        : (screenWidth > 600 ? 200 : 180);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Error Image
        Container(
          width: double.infinity,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red.withOpacity(0.1),
            border: Border.all(color: Colors.red.withOpacity(0.3), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 80,
                color: Colors.red.withOpacity(0.5),
              ),
              const SizedBox(height: 8),
              Text(
                'فشل في تحميل البيانات',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red.withOpacity(0.7),
                ),
              ),
            ],
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
        const SizedBox(height: 8),

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
        ElevatedButton.icon(
          onPressed: () {
            context.read<PortfolioCubit>().loadAllPortfolioData();
          },
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('إعادة المحاولة'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),

        // عرض البيانات الافتراضية بعد الخطأ
        Text(
          'سيتم عرض البيانات الافتراضية:',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 16),

        // Default content after error
        _buildNameAndJobTitle(context, '', ''),
        const SizedBox(height: 12),
        Text(
          _getDefaultSummary('', ''),
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultContent(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth > 800
        ? 250
        : (screenWidth > 600 ? 200 : 180);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Default Image
        Container(
          width: double.infinity,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_outline,
                size: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
              const SizedBox(height: 8),
              Text(
                'صورة شخصية',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Default Name and Job Title
        _buildNameAndJobTitle(context, '', ''),
        const SizedBox(height: 16),

        // Default Summary Text
        Text(
          _getDefaultSummary('', ''),
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  String _getDefaultSummary(String name, String jobTitle) {
    String displayName = name.isNotEmpty ? name : 'المطور';
    String displayJobTitle = jobTitle.isNotEmpty
        ? jobTitle
        : 'مطور تطبيقات Flutter';

    return 'أنا $displayName، $displayJobTitle مع خبرة أكثر من 3 سنوات في تطوير التطبيقات المحمولة. أحب إنشاء تطبيقات جميلة وسهلة الاستخدام تحل مشاكل المستخدمين الحقيقية. لدي خبرة واسعة في العمل مع الـ State Management، APIs، والـ UI/UX Design. أسعى دائماً لتعلم التقنيات الجديدة ومشاركة المعرفة مع المجتمع.';
  }
}
