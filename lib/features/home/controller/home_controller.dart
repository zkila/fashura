import 'package:get/get.dart';

class ListCheck {
  final String imagePath;
  final String name;
  final String discount;
  final String fullName;
  final String description;
  final String price;

  ListCheck(
      {required this.imagePath,
      required this.name,
      required this.discount,
      required this.fullName,
      required this.description,
      required this.price});
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
          fullName: 'Kain Batik Sido Mulyo',
          description: 'deskripsi produk',
          price: 'Rp. 500.000',
          discount: '-20%'),
      ListCheck(
          imagePath: 'assets/temp/batik4.jpg',
          name: 'Megamendung',
          fullName: 'Kain Batik Megamendung',
          description: 'deskripsi produk',
          price: 'Rp. 590.000',
          discount: '-50%'),
      ListCheck(
          imagePath: 'assets/temp/batik3.jpg',
          name: 'Sekar',
          fullName: 'Kain Batik Sekar',
          description: 'deskripsi produk',
          price: 'Rp. 1.500.000',
          discount: '-40%'),
      ListCheck(
          imagePath: 'assets/temp/batik2.jpg',
          name: 'Anggur',
          fullName: 'Kain Batik Anggur',
          description: 'deskripsi produk',
          price: 'Rp. 300.000',
          discount: '-10%'),
      ListCheck(
          imagePath: 'assets/temp/batik5.jpg',
          name: 'Ganggeng',
          fullName: 'Kain Batik Ganggeng',
          description: 'deskripsi produk',
          price: 'Rp. 150.000',
          discount: '-15%'),
      ListCheck(
          imagePath: 'assets/temp/batik6.jpg',
          name: 'Jombang',
          fullName: 'Kain Batik Jombang',
          description: 'deskripsi produk',
          price: 'Rp. 550.000',
          discount: '-5%'),
      // Add more data as needed
    ];
  }
}
