import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/classnum.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/dest.dart';
import 'package:flutter_application_1/productList_page.dart';

class login extends StatelessWidget {
  login({super.key});
  var userNameController = TextEditingController();
  var userNameController2 = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 300,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.jpg",
                      width: 300,
                      height: 300,
                    ),
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        label: Text(
                          "Tên đăng nhập",
                          style:
                              TextStyle(color: Color.fromARGB(255, 255, 85, 0)),
                        ),
                        hintText: "Vui lòng nhập tên đăng nhập",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      validator: (str) {
                        if (str == null || str.isEmpty)
                          return "Tên đăng nhập không được rỗng";
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        controller: userNameController2,
                        decoration: InputDecoration(
                          label: Text(
                            "Mật khẩu",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 85, 0)),
                          ),
                          hintText: "Vui lòng nhập mật khẩu",
                          prefixIcon: Icon(Icons.key),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (str) {
                          if (str == null || str.isEmpty)
                            return "Mật khẩu không được rỗng";
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(
                                  left: 115, right: 115, top: 25, bottom: 25)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(color: Colors.orange)))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var userName = userNameController.text;
                          print("Xin chào: ${userName}");
                        } else {
                          print("Dữ liệu không chính xác");
                        }
                      },
                      child: Text("Đăng nhập"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.only(
                                    left: 122,
                                    right: 122,
                                    top: 25,
                                    bottom: 25)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.blue)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => creater()),
                          );
                        },
                        child: Text("Đăng ký"),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      )),
    );
  }
}
