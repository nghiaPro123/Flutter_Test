import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/productList_page.dart';
import 'package:flutter_application_1/product_provider/product_provider.dart';
import 'package:provider/provider.dart';

class productDetail extends StatefulWidget {
  const productDetail({super.key});
  

  @override
  State<productDetail> createState() => _productDetailState();
}

class _productDetailState extends State<productDetail> {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<produc_provider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: Container(
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
                          "| Product detail",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  width: 460,
                  height: 460,
                  decoration: const BoxDecoration(
                      border:  Border(
                          top: BorderSide(
                              color:Color.fromARGB(255, 238, 77, 45),
                              width: 10,
                              style: BorderStyle.solid),
                          left: BorderSide(
                              color: Color.fromARGB(255, 238, 77, 45),
                              width: 10,
                              style: BorderStyle.solid),
                              
                              bottom: BorderSide(
                              color: Color.fromARGB(255, 238, 77, 45),
                              width: 10,
                              style: BorderStyle.solid),
                          right: BorderSide(
                              color: Color.fromARGB(255, 238, 77, 45),
                              width: 10,
                              style: BorderStyle.solid))    
                              ),
                           
                              
                              
                  child: Image.network(
                    productProvider.productDetail.image.toString(),
                  )),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 460,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productProvider.productDetail.title.toString(),
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:15.0,bottom: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\$" + productProvider.productDetail.price.toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 238, 77, 45)),
                                  ),
                                  IconButton(onPressed: () {
                              productProvider.addShoppingCart( productProvider.productDetail);
                            
                              
                            }, icon: Icon(Icons.add_shopping_cart)),
                                ],
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
                      ),
                      Text(
                        productProvider.productDetail.description.toString(),
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                        
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
