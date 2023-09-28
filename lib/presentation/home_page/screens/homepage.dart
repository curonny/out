import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:outcode/domain/response_data.dart';
import 'package:outcode/presentation/home_page/controllers/homepage_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController get controller => Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.listArticles.length,
              itemBuilder: (context, index) {
                Article article = controller.listArticles[index];
                return getArticle(article);
              },
            ),
    ));
  }

  getArticle(Article article) {
    final formattedDate = DateFormat('MMMM dd, yyyy HH:mm:ss').format(
        DateTime.parse(article.publishedAt.toString()).toLocal());
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200, // Adjust image height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(article.urlToImage.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(article.title.toString()),
          ),
          Padding(
            padding: EdgeInsets.all(16.0), // Adjust padding as needed
            child: Text(
              'Published At: $formattedDate',
              style: TextStyle(
                fontSize: 16, // Adjust font size as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
