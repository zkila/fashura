import 'package:get/get.dart';

class ListCheck {
  final String imagePath;
  final String name;
  final String discount;

  ListCheck(
      {required this.imagePath, required this.name, required this.discount});
}

class HomeListController extends GetxController {
  RxList<ListCheck> listPerbaikan = <ListCheck>[].obs;
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
      ListCheck(
          imagePath: 'assets/temp/batik1.jpg',
          name: 'Sido Mulyo',
          discount: '-20%'),
      ListCheck(
          imagePath: 'assets/temp/batik4.jpg',
          name: 'Megamendung',
          discount: '-50%'),
      ListCheck(
          imagePath: 'assets/temp/batik3.jpg', name: 'Sekar', discount: '-40%'),
      ListCheck(
          imagePath: 'assets/temp/batik2.jpg',
          name: 'Anggur',
          discount: '-10%'),
      ListCheck(
          imagePath: 'assets/temp/batik5.jpg',
          name: 'Ganggeng',
          discount: '-15%'),
      ListCheck(
          imagePath: 'assets/temp/batik6.jpg',
          name: 'Jombang',
          discount: '-5%'),
      // Add more data as needed
    ];
  }
}
