import 'dart:convert';
import 'dart:developer';

import 'package:my_portfolio/core/api/api_constances.dart';
import 'package:my_portfolio/core/api/api_methods.dart';
import 'package:my_portfolio/features/home/data/models/portfolio_model.dart';


abstract class PortfolioRemoteDataSource {
  Future<PortfolioModel> getPersonalInfo();
  Future<List<String>> getExtraSkills();
  Future<List<String>> getLanguages();
  Future<List<String>> getSkills();
  Future<List<SocialLinksItem>> getSocialLinks();
  Future<List<WorkItemModel>> getWorkItems();
}

class PortfolioRemoteDataSourceImpl extends PortfolioRemoteDataSource {
  final ApiMethods api;
  PortfolioRemoteDataSourceImpl(this.api);

  @override
  Future<PortfolioModel> getPersonalInfo() async {
    final response = await api.get(ApiConstances.baseUrl);
    final Map<String, dynamic> data = json.decode(response);
    return PortfolioModel.fromJson(data);
  }

  @override
  Future<List<String>> getExtraSkills() async {
    final response = await api.get(ApiConstances.baseUrl);
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> dataList = data['extraSkills'];
    return dataList.map((item) => item.toString()).toList();
  }

  @override
  Future<List<String>> getLanguages() async {
    final response = await api.get(ApiConstances.baseUrl);
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> dataList = data['languages'];
    final List<String> languages = dataList.map((item) => item.toString()).toList();
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Languages List: $languages');
    return languages;
  }

  @override
  Future<List<String>> getSkills() async {
    final response = await api.get(ApiConstances.baseUrl);
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> dataList = data['skills'];
    final List<String> skills = dataList.map((item) => item.toString()).toList();
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Skills List: $skills');
    return skills;
  }

  @override
  Future<List<SocialLinksItem>> getSocialLinks() async {
    final response = await api.get(ApiConstances.baseUrl);
    log('Response: $response');
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> dataList = data['socialLinks'];
    return dataList.map((item) => SocialLinksItem.fromJson(item)).toList();
  }

  @override
  Future<List<WorkItemModel>> getWorkItems() async {
    final response = await api.get(ApiConstances.baseUrl);
    log('Response: $response');
    final Map<String, dynamic> data = json.decode(response);
    print('Decoded data: $data');
    if (data['workitems'] == null) {
      print('workitems key not found or is null!');
      throw Exception('No workitems found');
    }
    final List<dynamic> dataList = data['workitems'];
    final List<WorkItemModel> workItems = dataList.map((item) => WorkItemModel.fromJson(item)).toList();
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Work Items List: $workItems');
    return workItems;
  }
}