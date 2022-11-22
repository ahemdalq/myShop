import 'dart:ffi';

import 'package:get/instance_manager.dart';
import 'package:myshop_app/logic/controller/category_controller.dart';
import 'package:myshop_app/logic/controller/product_controller.dart';
import 'package:myshop_app/view/widgets/cart/cart_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
