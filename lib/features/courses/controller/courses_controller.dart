import 'package:get/get.dart';

class Courses {
  final int rating;
  final String duration;
  final String title;
  final String author;
  final String imagePath;

  Courses(
      {required this.rating,
      required this.duration,
      required this.title,
      required this.author,
      required this.imagePath});
}

class CoursesController extends GetxController {
  RxList<Courses> listPerbaikan = <Courses>[].obs;
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
      Courses(
        rating: 4,
        duration: '2 Hours',
        author: 'MegaFashion',
        title: 'Make a Custom Piece',
        imagePath: 'assets/temp/model2.jpg',
      ),
      Courses(
        rating: 5,
        duration: '3 Hours',
        author: 'Reseller',
        title: 'Batik Tutorial',
        imagePath: 'assets/temp/model3.jpg',
      ),
      Courses(
        rating: 3,
        duration: '1 Hour',
        author: 'Guys',
        title: 'Document Prepping',
        imagePath: 'assets/temp/model1.jpg',
      ),
      Courses(
        rating: 5,
        duration: '15 Minutes',
        author: 'Folks',
        title: 'How to Style your Garments',
        imagePath: 'assets/temp/model2.jpg',
      ),
      Courses(
        rating: 4,
        duration: '2 Days',
        author: 'OfficialStore',
        title: 'How to Set Up your Store',
        imagePath: 'assets/temp/model3.jpg',
      ),
      Courses(
        rating: 3,
        duration: '30 Minutes',
        author: 'ProFashion',
        title: 'What Who Where',
        imagePath: 'assets/temp/model1.jpg',
      ),
      // Add more data as needed
    ];
  }
}
