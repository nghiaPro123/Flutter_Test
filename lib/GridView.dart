import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/productDetail_page.dart';
import 'package:flutter_application_1/productList_page.dart';
import 'package:flutter_application_1/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

class ViewGrid extends StatelessWidget {
  Function callback; 
  ViewGrid(this.callback);



  @override
 

  
  Widget build(BuildContext context) {
    var productProvider = Provider.of<produc_provider>(context);
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: (250 / 300),
        children: [
          ...productProvider.list.map((e) {
            return GestureDetector(
              onTap: (){
                productProvider.productDetail = e;
                
                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => productDetail()),
                          );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Center(
                              child:
                                  Image.network(e.image.toString(), height: 160)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title ?? "",
                                  style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$" + e.price.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 238, 77, 45)),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Color.fromARGB(255, 238, 77, 45)),
                              Icon(Icons.star,
                                  color: Color.fromARGB(255, 238, 77, 45)),
                              Icon(Icons.star,
                                  color: Color.fromARGB(255, 238, 77, 45)),
                              Icon(Icons.star,
                                  color: Color.fromARGB(255, 238, 77, 45)),
                              Icon(Icons.star_half,
                                  color: Color.fromARGB(255, 238, 77, 45)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(onPressed: () {
                            productProvider.addShoppingCart(e);
                            this.callback(productList_page());
                            
                          }, icon: Icon(Icons.add_shopping_cart)),
                        ],
              
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
