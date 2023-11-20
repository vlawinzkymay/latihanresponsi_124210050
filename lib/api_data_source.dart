import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadNews() {
    return BaseNetworkNews.get("users");
  }

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetworkBlogs.get("users");
  }

  Future<Map<String, dynamic>> loadReports() {
    return BaseNetworkReports.get("users");
  }
}
