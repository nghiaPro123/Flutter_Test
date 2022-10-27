import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/productDetail_page.dart';
import 'package:flutter_application_1/productList_page.dart';
import 'package:flutter_application_1/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

class ViewList extends StatelessWidget {
  Function callback;
  ViewList(this.callback);


  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<produc_provider>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...productProvider.list.map((e) {
              return GestureDetector(
                onTap: () {
                  productProvider.productDetail = e;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => productDetail()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(e.image.toString(), width: 65),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            "\$" + e.price.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color:
                                                    Color.fromARGB(255, 238, 77, 45)),
                                          ),
                                        ),
                                         IconButton(
                                        onPressed: () {
                                          productProvider.addShoppingCart(e);
                                          this.callback(productList_page());
                                        },
                                        icon: Icon(Icons.add_shopping_cart)),
                                      ],
                                    ),
                                   
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.star,
                                            color: Color.fromARGB(
                                                255, 238, 77, 45),
                                            size: 16),
                                        Icon(Icons.star,
                                            color: Color.fromARGB(
                                                255, 238, 77, 45),
                                            size: 16),
                                        Icon(Icons.star,
                                            color: Color.fromARGB(
                                                255, 238, 77, 45),
                                            size: 16),
                                        Icon(Icons.star,
                                            color: Color.fromARGB(
                                                255, 238, 77, 45),
                                            size: 16),
                                        Icon(Icons.star_half,
                                            color: Color.fromARGB(
                                                255, 238, 77, 45),
                                            size: 16),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                e.description.toString(),
                                style: TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
