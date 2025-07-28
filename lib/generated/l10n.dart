// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Portfolio`
  String get title {
    return Intl.message(
      'My Portfolio',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Abdallah Tolba`
  String get name {
    return Intl.message(
      'Abdallah Tolba',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer`
  String get job_title {
    return Intl.message(
      'Flutter Developer',
      name: 'job_title',
      desc: '',
      args: [],
    );
  }

  /// `I am a Flutter developer, creating interactive and effective user interfaces. I combine creativity and programming to build beautiful and fast applications that work on multiple platforms like iOS and Android, using the Flutter framework. I focus on using Dart, and I love turning ideas into real applications with high performance and attractive designs. I always strive to deliver an excellent user experience, ensuring that the applications I design run smoothly on all devices.`
  String get description {
    return Intl.message(
      'I am a Flutter developer, creating interactive and effective user interfaces. I combine creativity and programming to build beautiful and fast applications that work on multiple platforms like iOS and Android, using the Flutter framework. I focus on using Dart, and I love turning ideas into real applications with high performance and attractive designs. I always strive to deliver an excellent user experience, ensuring that the applications I design run smoothly on all devices.',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Hire Me`
  String get hire_me {
    return Intl.message(
      'Hire Me',
      name: 'hire_me',
      desc: '',
      args: [],
    );
  }

  /// `My Work`
  String get my_work {
    return Intl.message(
      'My Work',
      name: 'my_work',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get about_me {
    return Intl.message(
      'About Me',
      name: 'about_me',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `27`
  String get age_value {
    return Intl.message(
      '27',
      name: 'age_value',
      desc: '',
      args: [],
    );
  }

  /// `Freelance`
  String get freelance {
    return Intl.message(
      'Freelance',
      name: 'freelance',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get freelance_value {
    return Intl.message(
      'Available',
      name: 'freelance_value',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `El-Mansoura, Egypt`
  String get address_value {
    return Intl.message(
      'El-Mansoura, Egypt',
      name: 'address_value',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills_title {
    return Intl.message(
      'Skills',
      name: 'skills_title',
      desc: '',
      args: [],
    );
  }

  /// `Flutter`
  String get skill_flutter {
    return Intl.message(
      'Flutter',
      name: 'skill_flutter',
      desc: '',
      args: [],
    );
  }

  /// `Dart`
  String get skill_dart {
    return Intl.message(
      'Dart',
      name: 'skill_dart',
      desc: '',
      args: [],
    );
  }

  /// `OOP`
  String get skill_oop {
    return Intl.message(
      'OOP',
      name: 'skill_oop',
      desc: '',
      args: [],
    );
  }

  /// `Material Design System`
  String get skill_material_design {
    return Intl.message(
      'Material Design System',
      name: 'skill_material_design',
      desc: '',
      args: [],
    );
  }

  /// `Google APIs`
  String get skill_google_apis {
    return Intl.message(
      'Google APIs',
      name: 'skill_google_apis',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Packages`
  String get skill_flutter_packages {
    return Intl.message(
      'Flutter Packages',
      name: 'skill_flutter_packages',
      desc: '',
      args: [],
    );
  }

  /// `Extra Skills`
  String get extra_skills_title {
    return Intl.message(
      'Extra Skills',
      name: 'extra_skills_title',
      desc: '',
      args: [],
    );
  }

  /// `Git`
  String get extra_skill_git {
    return Intl.message(
      'Git',
      name: 'extra_skill_git',
      desc: '',
      args: [],
    );
  }

  /// `Postman`
  String get extra_skill_postman {
    return Intl.message(
      'Postman',
      name: 'extra_skill_postman',
      desc: '',
      args: [],
    );
  }

  /// `HTML`
  String get extra_skill_html {
    return Intl.message(
      'HTML',
      name: 'extra_skill_html',
      desc: '',
      args: [],
    );
  }

  /// `CSS`
  String get extra_skill_css {
    return Intl.message(
      'CSS',
      name: 'extra_skill_css',
      desc: '',
      args: [],
    );
  }

  /// `Python`
  String get extra_skill_python {
    return Intl.message(
      'Python',
      name: 'extra_skill_python',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages_title {
    return Intl.message(
      'Languages',
      name: 'languages_title',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get language_arabic {
    return Intl.message(
      'Arabic',
      name: 'language_arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language_english {
    return Intl.message(
      'English',
      name: 'language_english',
      desc: '',
      args: [],
    );
  }

  /// `Contact Me`
  String get contact_title {
    return Intl.message(
      'Contact Me',
      name: 'contact_title',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `LinkedIn`
  String get linkedin {
    return Intl.message(
      'LinkedIn',
      name: 'linkedin',
      desc: '',
      args: [],
    );
  }

  /// `GitHub`
  String get github {
    return Intl.message(
      'GitHub',
      name: 'github',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Hello World`
  String get some_text {
    return Intl.message(
      'Hello World',
      name: 'some_text',
      desc: '',
      args: [],
    );
  }

  /// `Download CV`
  String get download_cv {
    return Intl.message(
      'Download CV',
      name: 'download_cv',
      desc: '',
      args: [],
    );
  }

  /// `Preview Pictures`
  String get previewPictures {
    return Intl.message(
      'Preview Pictures',
      name: 'previewPictures',
      desc: '',
      args: [],
    );
  }

  /// `preview Project`
  String get previewProject {
    return Intl.message(
      'preview Project',
      name: 'previewProject',
      desc: '',
      args: [],
    );
  }

  /// `Description :`
  String get descriptionProject {
    return Intl.message(
      'Description :',
      name: 'descriptionProject',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Links :`
  String get links {
    return Intl.message(
      'Links :',
      name: 'links',
      desc: '',
      args: [],
    );
  }

  /// `text1`
  String get text {
    return Intl.message(
      'text1',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `test1`
  String get test {
    return Intl.message(
      'test1',
      name: 'test',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
