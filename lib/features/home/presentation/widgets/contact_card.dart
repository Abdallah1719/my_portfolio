// // // contact_card.dart
// // import 'package:flutter/material.dart';
// // import 'package:my_portfolio/generated/l10n.dart';

// // class ContactCard extends StatelessWidget {
// //   const ContactCard({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           children: [
// //             Text(
// //               S.of(context).contact_title,
// //               style: TextStyle(
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.bold,
// //                 color: Theme.of(context).colorScheme.primary,
// //               ),
// //             ),
// //             const SizedBox(height: 24),

// //             // Contact Icons Row
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 ContactIconButton(
// //                   icon: Icons.email,
// //                   label: S.of(context).email,
// //                   color: Colors.red,
// //                   onPressed: () {
// //                     // Email functionality
// //                   },
// //                 ),
// //                 ContactIconButton(
// //                   icon: Icons.phone,
// //                   label: S.of(context).phoneNumber,
// //                   color: Colors.green,
// //                   onPressed: () {
// //                     // Phone functionality
// //                   },
// //                 ),

// //                 ContactIconButton(
// //                   icon: Icons.code,
// //                   label: S.of(context).github,
// //                   color: Colors.indigo,
// //                   onPressed: () {
// //                     // Facebook functionality
// //                   },
// //                 ),
// //                 ContactIconButton(
// //                   icon: Icons.work,
// //                   label: S.of(context).linkedin,
// //                   color: Colors.blueAccent,
// //                   onPressed: () {
// //                     // LinkedIn functionality
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ContactIconButton extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final Color color;
// //   final VoidCallback onPressed;

// //   const ContactIconButton({
// //     super.key,
// //     required this.icon,
// //     required this.label,
// //     required this.color,
// //     required this.onPressed,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       mainAxisSize: MainAxisSize.min,
// //       children: [
// //         Container(
// //           width: 50,
// //           height: 50,
// //           decoration: BoxDecoration(
// //             color: color.withOpacity(0.1),
// //             borderRadius: BorderRadius.circular(12),
// //             border: Border.all(color: color.withOpacity(0.3)),
// //           ),
// //           child: IconButton(
// //             onPressed: onPressed,
// //             icon: Icon(icon, color: color),
// //             tooltip: label,
// //           ),
// //         ),
// //         const SizedBox(height: 8),
// //         Text(
// //           label,
// //           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
// //           textAlign: TextAlign.center,
// //         ),
// //       ],
// //     );
// //   }
// // }
// // contact_card.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:my_portfolio/generated/l10n.dart';
// import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';
// import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
// import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

// class ContactCard extends StatelessWidget {
//   const ContactCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: BlocBuilder<PortfolioCubit, PortfolioState>(
//           builder: (context, state) {
//             if (state is PortfolioLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is PortfolioError) {
//               return Center(
//                 child: Column(
//                   children: [
//                     const Icon(
//                       Icons.error_outline,
//                       color: Colors.red,
//                       size: 48,
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       'حدث خطأ في تحميل البيانات',
//                       style: TextStyle(color: Colors.red, fontSize: 16),
//                     ),
//                     const SizedBox(height: 8),
//                     ElevatedButton(
//                       onPressed: () {
//                         context.read<PortfolioCubit>().loadAllPortfolioData();
//                       },
//                       child: const Text('إعادة المحاولة'),
//                     ),
//                   ],
//                 ),
//               );
//             } else if (state is PortfolioAllDataLoaded) {
//               return _buildContactContent(context, state);
//             }

//             // Default loading state
//             return const Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildContactContent(
//     BuildContext context,
//     PortfolioAllDataLoaded state,
//   ) {
//     final personalInfo = state.personalInfo;
//     final socialLinks = state.socialLinks;

//     return Column(
//       children: [
//         Text(
//           S.of(context).contact_title,
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//         const SizedBox(height: 24),

//         // Contact Icons Row
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             // Email
//             ContactIconButton(
//               icon: Icons.email,
//               label: S.of(context).email,
//               color: Colors.red,
//               onPressed: personalInfo.email.isNotEmpty
//                   ? () => _launchURL('mailto:${personalInfo.email}')
//                   : null,
//             ),

//             // Phone
//             ContactIconButton(
//               icon: Icons.phone,
//               label: S.of(context).phoneNumber,
//               color: Colors.green,
//               onPressed: personalInfo.phoneNumber.isNotEmpty
//                   ? () => _launchURL('tel:${personalInfo.phoneNumber}')
//                   : null,
//             ),

//             // GitHub
//             ContactIconButton(
//               icon: Icons.code,
//               label: S.of(context).github,
//               color: Colors.indigo,
//               onPressed: () {
//                 final githubLink = _findSocialLink(socialLinks, 'github');
//                 if (githubLink != null) {
//                   _launchURL(githubLink.url);
//                 }
//               },
//             ),

//             // LinkedIn
//             ContactIconButton(
//               icon: Icons.work,
//               label: S.of(context).linkedin,
//               color: Colors.blueAccent,
//               onPressed: () {
//                 final linkedinLink = _findSocialLink(socialLinks, 'linkedin');
//                 if (linkedinLink != null) {
//                   _launchURL(linkedinLink.url);
//                 }
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   SocialLinksItem? _findSocialLink(
//     List<SocialLinksItem> socialLinks,
//     String platform,
//   ) {
//     try {
//       return socialLinks.firstWhere(
//         (link) => link.platform.toLowerCase() == platform.toLowerCase(),
//       );
//     } catch (e) {
//       return null;
//     }
//   }

//   void _launchURL(String url) async {
//     try {
//       final Uri uri = Uri.parse(url);
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//       } else {
//         print('Could not launch $url');
//       }
//     } catch (e) {
//       print('Error launching URL: $e');
//     }
//   }
// }

// class ContactIconButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback? onPressed; // Made nullable to handle disabled state

//   const ContactIconButton({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 50,
//           height: 50,
//           decoration: BoxDecoration(
//             color: onPressed != null
//                 ? color.withOpacity(0.1)
//                 : Colors.grey.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: onPressed != null
//                   ? color.withOpacity(0.3)
//                   : Colors.grey.withOpacity(0.3),
//             ),
//           ),
//           child: IconButton(
//             onPressed: onPressed,
//             icon: Icon(icon, color: onPressed != null ? color : Colors.grey),
//             tooltip: label,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//             color: onPressed != null ? null : Colors.grey,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
// contact_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_cubit.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

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
              return _buildContactContent(context, state);
            }

            // Default loading state
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildContactContent(
    BuildContext context,
    PortfolioAllDataLoaded state,
  ) {
    final personalInfo = state.personalInfo;
    final socialLinks = state.socialLinks;

    return Column(
      children: [
        Text(
          S.of(context).contact_title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),

        // Contact Icons Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Email
            ContactIconButton(
              icon: Icons.email,
              label: S.of(context).email,
              color: Colors.red,
              onPressed: personalInfo.email.isNotEmpty
                  ? () => _launchURL('mailto:${personalInfo.email}')
                  : null,
            ),

            // WhatsApp
            ContactIconButton(
              icon: Icons.chat,
              label: S.of(context).whatsapp,
              color: Colors.green,
              onPressed: () {
                final whatsappLink = _findSocialLink(socialLinks, 'whatsapp');
                if (whatsappLink != null) {
                  _launchURL(whatsappLink.url);
                }
              },
            ),

            // GitHub
            ContactIconButton(
              icon: Icons.code,
              label: S.of(context).github,
              color: Colors.indigo,
              onPressed: () {
                final githubLink = _findSocialLink(socialLinks, 'github');
                if (githubLink != null) {
                  _launchURL(githubLink.url);
                }
              },
            ),

            // LinkedIn
            ContactIconButton(
              icon: Icons.work,
              label: S.of(context).linkedin,
              color: Colors.blueAccent,
              onPressed: () {
                final linkedinLink = _findSocialLink(socialLinks, 'linkedin');
                if (linkedinLink != null) {
                  _launchURL(linkedinLink.url);
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  SocialLinksItem? _findSocialLink(
    List<SocialLinksItem> socialLinks,
    String platform,
  ) {
    try {
      return socialLinks.firstWhere(
        (link) => link.platform.toLowerCase() == platform.toLowerCase(),
      );
    } catch (e) {
      return null;
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

class ContactIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed; // Made nullable to handle disabled state

  const ContactIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: onPressed != null
                ? color.withOpacity(0.1)
                : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: onPressed != null
                  ? color.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3),
            ),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: onPressed != null ? color : Colors.grey),
            tooltip: label,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: onPressed != null ? null : Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
