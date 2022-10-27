import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/GridView.dart';
import 'package:flutter_application_1/ListView.dart';
import 'package:flutter_application_1/ShoppingCart_page.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

class productList_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return productList_page_state();
  }
}



class productList_page_state extends State<productList_page> {
  // const productList_page({super.key});
  
  static  var fl=0;

  late ViewGrid gridViewPage;
  late Widget currentPage;
 
  @override
  void initState() {
    super.initState();
    gridViewPage = ViewGrid(this.callback);
    currentPage = gridViewPage;
  }

  void callback(Widget nextPage) {
    setState(() {
      this.currentPage = nextPage;
    });
  }



  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<produc_provider>(context);
    var SearchController = TextEditingController();
   
    

    if (productProvider.list.isEmpty) {
      productProvider.getList();
      print("Null");
    }


    // productProvider.checkProduct();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 85, 0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: 400,
                                height: 40,
                                child: TextFormField(
                                  controller: SearchController,
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Search Something Here!",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    //hintText: "Vui lòng nhập tên đăng nhập",
                                    // prefixIcon: Icon(Icons.person),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  var key = SearchController.text;
                                  if (!key.isEmpty) {
                                    setState(() {
                                      productProvider.key = key.toString();
                                      productProvider.mes = "none";
                                      productProvider.SearchProduct();
                                    });
                                  }
                                },
                                icon: Icon(Icons.search)),
                          ],
                        ),
                       Row(
                        children: [
                           Text(productProvider.ShoppingCart.length.toString()),
                        IconButton(
                            onPressed: () {
                              productProvider.TongTien();
                               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => shoppingCartPage()),
                          );
                            }, icon: Icon(Icons.shopping_cart))
                        ],
                       )
                      ],
                    ),
                    Row(
                      children: [
                        ...productProvider.list2.map((e) {
                          return Container(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    productProvider.categlory = e.toString();
                                    productProvider.checkProduct();
                                  });
                                },
                                child: Text(e)),
                          ));
                        }).toList()
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (productProvider.mes != "none")
                        ? Text(productProvider.mes,
                            style: TextStyle(fontWeight: FontWeight.w600))
                        : Text("All product",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                    IconButton(
                      
                        onPressed: () {
                          setState(() {
                            if (productProvider.showGrid == true) {
                              print("true");
                              productProvider.showGrid = false;
                            } else {
                              print("false");
                              productProvider.showGrid = true;
                            }
                          });
                        },
                        icon: productProvider.showGrid
                            ? Icon(Icons.grid_on)
                            : Icon(Icons.list)),
                  ],
                ),
              ),
              Expanded(
                  //width: 500,
                  child: (productProvider.showGrid) ? ViewGrid(this.callback) : ViewList(this.callback)),
            ],
          ),
        ),
      ),
    );
  }
  
  
}
