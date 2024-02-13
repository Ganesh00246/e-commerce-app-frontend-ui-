import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product.dart';
class HomeController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  List<Product> products =[];
  @override
  Future<void> onInit() async{
    productCollection = firestore.collection('products');
    await fetchproducts();
    super.onInit();
  }
  fetchproducts()async{
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retriveProducts = productSnapshot.docs.map((doc) =>
          Product.fromJson(doc.data() as Map <String ,dynamic>),

      ).toList();
      products.clear();
      products.assignAll(retriveProducts);
      Get.snackbar('Success', 'The Product fetch Successfully from database',colorText: Colors.green);

    } catch (e) {
      Get.snackbar('Failed ',e.toString(),colorText: Colors.red);
      print(e);
    }finally{
      update();
    }
  }
}
