import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';
import 'package:my_portfolio/features/home/domain/repository/portfolio_repository.dart';
import 'package:my_portfolio/features/home/presentation/controller/cubit/portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepository repository;

  PortfolioCubit(this.repository) : super(PortfolioInitial());

  Future<void> getPersonalInfo() async {
    emit(PortfolioPersonalInfoLoading());
    final result = await repository.getPersonalInfo();
    result.fold(
      (error) => emit(PortfolioPersonalInfoError(error)),
      (personalInfo) => emit(PortfolioPersonalInfoLoaded(personalInfo)),
    );
  }

  Future<void> getExtraSkills() async {
    emit(PortfolioExtraSkillsLoading());
    final result = await repository.getExtraSkills();
    result.fold(
      (error) => emit(PortfolioExtraSkillsError(error)),
      (extraSkills) => emit(PortfolioExtraSkillsLoaded(extraSkills)),
    );
  }

  Future<void> getLanguages() async {
    emit(PortfolioLanguagesLoading());
    final result = await repository.getLanguages();
    result.fold(
      (error) => emit(PortfolioLanguagesError(error)),
      (languages) => emit(PortfolioLanguagesLoaded(languages)),
    );
  }

  Future<void> getSkills() async {
    emit(PortfolioSkillsLoading());
    final result = await repository.getSkills();
    result.fold(
      (error) => emit(PortfolioSkillsError(error)),
      (skills) => emit(PortfolioSkillsLoaded(skills)),
    );
  }

  Future<void> getSocialLinks() async {
    emit(PortfolioSocialLinksLoading());
    final result = await repository.getSocialLinks();
    result.fold(
      (error) => emit(PortfolioSocialLinksError(error)),
      (socialLinks) => emit(PortfolioSocialLinksLoaded(socialLinks)),
    );
  }

  Future<void> getWorkItems() async {
    emit(PortfolioWorkItemsLoading());
    final result = await repository.getWorkItems();
    result.fold(
      (error) => emit(PortfolioWorkItemsError(error)),
      (workItems) => emit(PortfolioWorkItemsLoaded(workItems)),
    );
  }

  // Method to load all data at once
  Future<void> loadAllPortfolioData() async {
    emit(PortfolioLoading());

    try {
      final results = await Future.wait([
        repository.getPersonalInfo(),
        repository.getExtraSkills(),
        repository.getLanguages(),
        repository.getSkills(),
        repository.getSocialLinks(),
        repository.getWorkItems(),
      ]);

      // Check if any request failed
      for (final result in results) {
        result.fold((error) => throw Exception(error), (data) => null);
      }

      // All requests succeeded, extract data
      final personalInfo = results[0].getOrElse(
        () => throw Exception('Personal info failed'),
      );
      final extraSkills = results[1].getOrElse(
        () => throw Exception('Extra skills failed'),
      );
      final languages = results[2].getOrElse(
        () => throw Exception('Languages failed'),
      );
      final skills = results[3].getOrElse(
        () => throw Exception('Skills failed'),
      );
      final socialLinks = results[4].getOrElse(
        () => throw Exception('Social links failed'),
      );
      final workItems = results[5].getOrElse(
        () => throw Exception('Work items failed'),
      );

      emit(
        PortfolioAllDataLoaded(
          personalInfo: personalInfo as PortfolioModel,
          extraSkills: extraSkills as List<String>,
          languages: languages as List<String>,
          skills: skills as List<String>,
          socialLinks: socialLinks as List<SocialLinksItem>,
          workItems: workItems as List<WorkItemModel>,
        ),
      );
    } catch (e) {
      emit(PortfolioError(e.toString()));
    }
  }
}
