import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:outcode/core/app.dart';
import 'package:outcode/domain/response_data.dart';

class HomePageController extends GetxController {
  RxBool isLoading = false.obs;
  AppConstants appConstants = AppConstants();
  final RxList<Article> _listArticles = <Article>[].obs;
  List<Article> get listArticles => _listArticles;

  @override
  void onInit() {
    super.onInit();
    loadGraphicInfo();
  }

  void setList(List<Article> listData) {
    _listArticles.value = listData;
  }

  void loadGraphicInfo() async {
    isLoading.value = true;
    final dio = Dio();
    String url =
        '${appConstants.apiBaseUrl}/everything?q=Apple&from=2023-09-27&sortBy=popularity&apiKey=${appConstants.token}';
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data;
        final NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
        setList(newsResponse.articles);
        isLoading.value = false;
      } else {
        // Handle other status codes or errors here
      }
    } catch (e) {
      // Handle exceptions here
      isLoading.value = false;
      print('Error: $e');
    }
  }
}
