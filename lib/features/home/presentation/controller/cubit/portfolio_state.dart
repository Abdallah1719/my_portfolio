import 'package:equatable/equatable.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioError extends PortfolioState {
  final String message;
  PortfolioError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Personal Info States
class PortfolioPersonalInfoLoading extends PortfolioState {}

class PortfolioPersonalInfoLoaded extends PortfolioState {
  final PortfolioModel personalInfo;
  PortfolioPersonalInfoLoaded(this.personalInfo);
  
  @override
  List<Object?> get props => [personalInfo];
}

class PortfolioPersonalInfoError extends PortfolioState {
  final String message;
  PortfolioPersonalInfoError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Extra Skills States
class PortfolioExtraSkillsLoading extends PortfolioState {}

class PortfolioExtraSkillsLoaded extends PortfolioState {
  final List<String> extraSkills;
  PortfolioExtraSkillsLoaded(this.extraSkills);
  
  @override
  List<Object?> get props => [extraSkills];
}

class PortfolioExtraSkillsError extends PortfolioState {
  final String message;
  PortfolioExtraSkillsError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Languages States
class PortfolioLanguagesLoading extends PortfolioState {}

class PortfolioLanguagesLoaded extends PortfolioState {
  final List<String> languages;
  PortfolioLanguagesLoaded(this.languages);
  
  @override
  List<Object?> get props => [languages];
}

class PortfolioLanguagesError extends PortfolioState {
  final String message;
  PortfolioLanguagesError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Skills States
class PortfolioSkillsLoading extends PortfolioState {}

class PortfolioSkillsLoaded extends PortfolioState {
  final List<String> skills;
  PortfolioSkillsLoaded(this.skills);
  
  @override
  List<Object?> get props => [skills];
}

class PortfolioSkillsError extends PortfolioState {
  final String message;
  PortfolioSkillsError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Social Links States
class PortfolioSocialLinksLoading extends PortfolioState {}

class PortfolioSocialLinksLoaded extends PortfolioState {
  final List<SocialLinksItem> socialLinks;
  PortfolioSocialLinksLoaded(this.socialLinks);
  
  @override
  List<Object?> get props => [socialLinks];
}

class PortfolioSocialLinksError extends PortfolioState {
  final String message;
  PortfolioSocialLinksError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Work Items States
class PortfolioWorkItemsLoading extends PortfolioState {}

class PortfolioWorkItemsLoaded extends PortfolioState {
  final List<WorkItemModel> workItems;
  PortfolioWorkItemsLoaded(this.workItems);
  
  @override
  List<Object?> get props => [workItems];
}

class PortfolioWorkItemsError extends PortfolioState {
  final String message;
  PortfolioWorkItemsError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Combined State for all data
class PortfolioAllDataLoaded extends PortfolioState {
  final PortfolioModel personalInfo;
  final List<String> extraSkills;
  final List<String> languages;
  final List<String> skills;
  final List<SocialLinksItem> socialLinks;
  final List<WorkItemModel> workItems;

  PortfolioAllDataLoaded({
    required this.personalInfo,
    required this.extraSkills,
    required this.languages,
    required this.skills,
    required this.socialLinks,
    required this.workItems,
  });
  
  @override
  List<Object?> get props => [
    personalInfo,
    extraSkills,
    languages,
    skills,
    socialLinks,
    workItems,
  ];
}