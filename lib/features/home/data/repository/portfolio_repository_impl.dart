import 'package:dartz/dartz.dart';
import 'package:my_portfolio/core/error/exception.dart';
import 'package:my_portfolio/features/home/data/data_source/portfolio_data_source.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';
import 'package:my_portfolio/features/home/domain/repository/portfolio_repository.dart';
class PortfolioRepositoryImpl extends PortfolioRepository {
  final PortfolioRemoteDataSource remoteDataSource;
  PortfolioRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, PortfolioModel>> getPersonalInfo() async {
    try {
      final personalInfo = await remoteDataSource.getPersonalInfo();
      return Right(personalInfo);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<String>>> getExtraSkills() async {
    try {
      final skills = await remoteDataSource.getExtraSkills();
      return Right(skills);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<String>>> getLanguages() async {
    try {
      final languages = await remoteDataSource.getLanguages();
      return Right(languages);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<String>>> getSkills() async {
    try {
      final skills = await remoteDataSource.getSkills();
      return Right(skills);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<SocialLinksItem>>> getSocialLinks() async {
    try {
      final socialLinks = await remoteDataSource.getSocialLinks();
      return Right(socialLinks);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<WorkItemModel>>> getWorkItems() async {
    try {
      final workItems = await remoteDataSource.getWorkItems();
      return Right(workItems);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}