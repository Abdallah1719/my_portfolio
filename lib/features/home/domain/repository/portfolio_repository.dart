import 'package:dartz/dartz.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';

abstract class PortfolioRepository {
  Future<Either<String, PortfolioModel>> getPersonalInfo();
  Future<Either<String, List<WorkItemModel>>> getWorkItems();
  Future<Either<String, List<SocialLinksItem>>> getSocialLinks();
  Future<Either<String, List<String>>> getSkills();
  Future<Either<String, List<String>>> getExtraSkills();
  Future<Either<String, List<String>>> getLanguages();
}
