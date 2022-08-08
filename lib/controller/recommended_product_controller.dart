import 'package:food_delivary/data/repogetroy/popular_product_repo.dart';
import 'package:food_delivary/models/popular_product_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../data/repogetroy/recommended_product.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendProductList = [];
  List<ProductModel> get recommendProductList => _recommendProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendProductList = [];
      _recommendProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
