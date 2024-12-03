import 'package:get/get.dart';

class Feed {
  final String imagePath;
  final String username;
  final String title;

  Feed({required this.imagePath, required this.username, required this.title});
}

class FeedListController extends GetxController {
  RxList<Feed> listPerbaikan = <Feed>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData(); // Initialize the data manually
  }

  // Manually initialize the list of data
  void initializeData() {
    // Sample data to initialize
    listPerbaikan.value = [
      Feed(
          imagePath: 'assets/temp/model1.jpg',
          username: 'Sekar_Ayu1999',
          title: 'Trying on the new batik drop, tell me what you think?'),
      Feed(
          imagePath: 'assets/temp/model2.jpg',
          username: 'Asrimutiaaaaa',
          title:
              'Just got this lovely piece the other day and had to show it off!'),
      Feed(
          imagePath: 'assets/temp/model3.jpg',
          username: 'jonijoniyespapa',
          title: 'Tryna vibe with this piece, did I pull it off?'),
    ];
  }
}
