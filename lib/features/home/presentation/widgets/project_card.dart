// project_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/responsive_utils.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    final projectCount = ResponsiveUtils.getProjectCardCount(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            S.of(context).my_work,
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
            if (state is PortfolioWorkItemsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PortfolioWorkItemsError) {
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
                      'حدث خطأ في تحميل المشاريع',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PortfolioCubit>().getWorkItems();
                      },
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            } else if (state is PortfolioWorkItemsLoaded) {
              final workItems = state.workItems;

              if (workItems.isEmpty) {
                return const Center(
                  child: Text(
                    'لا توجد مشاريع للعرض',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: projectCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: workItems.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    workItem: workItems[index],
                    projectIndex: index,
                  );
                },
              );
            } else if (state is PortfolioAllDataLoaded) {
              final workItems = state.workItems;

              if (workItems.isEmpty) {
                return const Center(
                  child: Text(
                    'لا توجد مشاريع للعرض',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: projectCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: workItems.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    workItem: workItems[index],
                    projectIndex: index,
                  );
                },
              );
            }

            // Default state - show loading
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final WorkItemModel workItem;
  final int projectIndex;

  const ProjectCard({
    super.key,
    required this.workItem,
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
              child: workItem.imagePath.isNotEmpty
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        workItem.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            icons[projectIndex % icons.length],
                            size: 60,
                            color: colors[projectIndex % colors.length],
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    )
                  : Icon(
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
                    workItem.title.isNotEmpty
                        ? workItem.title
                        : 'مشروع ${projectIndex + 1}',
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
                      workItem.description.isNotEmpty
                          ? workItem.description
                          : 'وصف مختصر للمشروع ${projectIndex + 1}',
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
                      // Android Link
                      if (workItem.androidLink.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            _launchURL(workItem.androidLink);
                          },
                          icon: const Icon(Icons.android),
                          color: Colors.green,
                          tooltip: 'Android',
                        ),

                      // iOS Link
                      if (workItem.iosLink.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            _launchURL(workItem.iosLink);
                          },
                          icon: const Icon(Icons.phone_iphone),
                          color: Colors.blue,
                          tooltip: 'iOS',
                        ),

                      // Preview Photo
                      if (workItem.previewPhoto.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            _showImagePreview(context, workItem.previewPhoto);
                          },
                          icon: const Icon(Icons.photo),
                          color: Colors.purple,
                          tooltip: S.of(context).previewPictures,
                        ),

                      // General View Project Link
                      IconButton(
                        onPressed: () {
                          _showProjectDetails(context);
                        },
                        icon: const Icon(Icons.visibility),
                        color: Theme.of(context).colorScheme.primary,
                        tooltip: S.of(context).previewProject,
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

  void _launchURL(String url) async {
    final fullUrl = url.startsWith('http') ? url : 'https://$url';
    final uri = Uri.tryParse(fullUrl);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('لا يمكن فتح الرابط: $url');
    }
  }

  void _showImagePreview(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'لا يمكن تحميل الصورة',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            workItem.title.isNotEmpty ? workItem.title : 'تفاصيل المشروع',
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (workItem.imagePath.isNotEmpty)
                  Container(
                    height: 200,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        workItem.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                Text(
                  S.of(context).descriptionProject,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  workItem.description.isNotEmpty
                      ? workItem.description
                      : 'لا يوجد وصف متاح',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                // Links Section
                Text(
                  S.of(context).links,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                if (workItem.androidLink.isNotEmpty)
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.android, color: Colors.green),
                    title: const Text('Android'),
                    onTap: () => _launchURL(workItem.androidLink),
                  ),
                if (workItem.iosLink.isNotEmpty)
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.phone_iphone, color: Colors.blue),
                    title: const Text('iOS'),
                    onTap: () => _launchURL(workItem.iosLink),
                  ),
                if (workItem.previewPhoto.isNotEmpty)
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.photo, color: Colors.purple),
                    title: Text(S.of(context).previewPictures),
                    onTap: () {
                      Navigator.of(context).pop();
                      _showImagePreview(context, workItem.previewPhoto);
                    },
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).close),
            ),
          ],
        );
      },
    );
  }
}
