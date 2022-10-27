import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/ShoppingCart_page.dart';
import 'package:flutter_application_1/model/ShoppingCart_model.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:http/http.dart' as http;

class produc_provider extends ChangeNotifier {
  List<ProductModel> list = [];
  List<ProductModel> listTemp = [];
  List<ShoppingCartModel> ShoppingCart = [];
  num tong = 0;
  List<String> list2 = [];
  String categlory = "none";
  String key = "none";
  String mes = "none";
  bool showGrid = true;
  late ProductModel productDetail;

  void show(bool isGrid) {
    showGrid = isGrid;
    notifyListeners();
  }

  void getList() async {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(apiURL));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;

    list = jsonObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    listTemp = List.from(list);
    getCateglory();
    notifyListeners();
  }

  void getCateglory() async {
    this.list.map((e) {
      if (!list2.contains(e.category.toString())) {
        list2.add(e.category.toString());
      }
    }).toList();
  }

  void checkProduct() async {
    list = List.from(listTemp);
    if (categlory != "none") {
      for (int i = 0; i < list.length; i++) {
        if (list[i].category != categlory) {
          list.removeAt(i);
          i--;
        }
      }
      mes = "Product for: " + categlory;
      //list =  list.where((e) => e.category==categlory);
    }
    print(categlory);
  }

  void SearchProduct() async {
    list = List.from(listTemp);
    if (key != "none") {
      for (int i = 0; i < list.length; i++) {
        if (!list[i]
                .title
                .toString()
                .toLowerCase()
                .contains(key.toLowerCase()) &&
            !list[i]
                .category
                .toString()
                .toLowerCase()
                .contains(key.toLowerCase())) {
          list.removeAt(i);
          i--;
        }
      }
      if (list.length != 0) mes = "Result for: " + key;
      //list =  list.where((e) => e.category==categlory);
    }
  }

  void deleteShoppingCart(ShoppingCartModel e) {
    ShoppingCart.remove(e);
  }

  void addShoppingCart(ProductModel product) {
    // ShoppingCart.add(pr);
    for (int i = 0; i < ShoppingCart.length; i++) {
      if (ShoppingCart[i].product!.id == product.id) {
        ShoppingCart[i].sl = ShoppingCart[i].sl! + 1;
        return;
      }
      ;
    }
    ;
    ShoppingCartModel pr = ShoppingCartModel(product: product, sl: 1);
    ShoppingCart.add(pr);
  }

  void TongTien() {
    tong = 0;
   
    for (int i = 0; i < ShoppingCart.length; i++) {
      
      this.tong =
          (ShoppingCart[i].sl! * ShoppingCart[i].product!.price!) + tong;
    }
    ;
  }
}
