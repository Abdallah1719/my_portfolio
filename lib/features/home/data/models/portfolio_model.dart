// lib/data/models/portfolio_model.dart
class PortfolioModel {
  final String name;
  final String jobTitle;
  final String summary;
  final String age;
  final String freelance;
  final String address;
  final String email;
  final String phoneNumber;
  final String profilePicture;
  final String summaryImage;
  final String cvLink;
  final List<SocialLink> socialLinks;
  final List<String> skills;
  final List<String> extraSkills;
  final List<Language> languages;
  final List<WorkItem> workItems;

  PortfolioModel({
    required this.name,
    required this.jobTitle,
    required this.summary,
    required this.age,
    required this.freelance,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.summaryImage,
    required this.cvLink,
    required this.socialLinks,
    required this.skills,
    required this.extraSkills,
    required this.languages,
    required this.workItems,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      name: json['name'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      summary: json['summary'] ?? '',
      age: json['age'] ?? '',
      freelance: json['freelance'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      summaryImage: json['summaryImage'] ?? '',
      cvLink: json['cvLink'] ?? '',
      socialLinks:
          (json['socialLinks'] as List<dynamic>?)
              ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      extraSkills:
          (json['extraSkills'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      languages:
          (json['languages'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      workItems:
          (json['workItems'] as List<dynamic>?)
              ?.map((e) => WorkItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'jobTitle': jobTitle,
      'summary': summary,
      'age': age,
      'freelance': freelance,
      'address': address,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'summaryImage': summaryImage,
      'cvLink': cvLink,
      'socialLinks': socialLinks.map((e) => e.toJson()).toList(),
      'skills': skills,
      'extraSkills': extraSkills,
      'languages': languages.map((e) => e.toJson()).toList(),
      'workItems': workItems.map((e) => e.toJson()).toList(),
    };
  }
}

class SocialLink {
  final String platform;
  final String url;
  final String icon;

  SocialLink({required this.platform, required this.url, required this.icon});

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      platform: json['platform'] ?? '',
      url: json['url'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'platform': platform, 'url': url, 'icon': icon};
  }
}

class Language {
  final String language;
  final String level;

  Language({required this.language, required this.level});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      language: json['language'] ?? '',
      level: json['level'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'language': language, 'level': level};
  }
}

class WorkItem {
  final String imagePath;
  final String title;
  final String description;
  final String androidLink;
  final String iosLink;
  final String previewPhoto;

  WorkItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.androidLink,
    required this.iosLink,
    required this.previewPhoto,
  });

  factory WorkItem.fromJson(Map<String, dynamic> json) {
    return WorkItem(
      imagePath: json['imagePath'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      androidLink: json['androidLink'] ?? '',
      iosLink: json['iosLink'] ?? '',
      previewPhoto: json['previewPhoto'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'title': title,
      'description': description,
      'androidLink': androidLink,
      'iosLink': iosLink,
      'previewPhoto': previewPhoto,
    };
  }
}
