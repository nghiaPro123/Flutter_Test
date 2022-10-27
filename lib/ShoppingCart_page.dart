import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/productList_page.dart';
import 'package:flutter_application_1/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

class shoppingCartPage extends StatefulWidget {
  const shoppingCartPage({super.key});

  @override
  State<shoppingCartPage> createState() => _shoppingCartPageState();
}

class _shoppingCartPageState extends State<shoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<produc_provider>(context);
    var slController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(5, 0, 0, 0)),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 50,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 85, 0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => productList_page()),
                          );
                        },
                        icon: Icon(Icons.keyboard_return_sharp),
                        color: Colors.white,
                      ),
                      Text(
                        "| SHOPPING CART",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                 // width: 500,
                  child: Column(
                    children: [
                      ...productProvider.ShoppingCart.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                        e.product!.image.toString(),
                                        width: 60),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          e.product!.title.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Container(
                                      height: 50,
                                      width: 70,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("\$" + e.product!.price.toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 85, 0))),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                e.sl = (e.sl! + 1)!;
                                                productProvider.TongTien();
                                              });
                                            },
                                            icon: Icon(Icons.add)),
                                        Text(e.sl.toString()),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                e.sl = (e.sl! - 1)!;
                                                if (e.sl == 0)
                                                  productProvider.ShoppingCart
                                                      .remove(e);
                                                productProvider.TongTien();
                                              });
                                            },
                                            icon: Icon(Icons.remove)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Total: "),
                    Text("\$",
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 85, 0))),
                    Text(productProvider.tong.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 85, 0))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 85, 0),
                             ),
                          child: Text("ORDER NOW")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
