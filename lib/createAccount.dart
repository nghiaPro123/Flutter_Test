import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/login_page.dart';

class creater extends StatelessWidget {
  creater({super.key});
  var _formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passWordController = TextEditingController();
  var passWordController2 = TextEditingController();


// void _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Thông báo"),
//           content: Text("mật khẩu không trùng"),
//           actions: [
//             MaterialButton(
//               child: Text("ok"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("Đăng ký tài khoản mới"),
                  Image.asset(
                      "assets/images/logo.jpg",
                      width: 300,
                      height: 300,  
                    ),
                  TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          label: Text("Tên đăng nhập",style: TextStyle(color: Color.fromARGB(255, 255, 85, 0)),),
                          hintText: "Vui lòng nhập tên đăng nhập",
                          prefixIcon: Icon(Icons.person),
                          border: new OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(25.0),
                          ),
                        ),
                       
                        validator: (str){
                          if(str == null || str.isEmpty)
                            return "Tên đăng nhập không được rỗng";
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        child: TextFormField(
                          controller: passWordController,
                          decoration: InputDecoration(
                            label: Text("Mật khẩu",style: TextStyle(color: Color.fromARGB(255, 255, 85, 0)),),
                            hintText: "Vui lòng nhập mật khẩu",
                            prefixIcon: Icon(Icons.key),
                            border: new OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(25.0),
                            ),
                          ),
                         
                          validator: (str){
                            if(str == null || str.isEmpty)
                              return "Mật khẩu không được rỗng";
                            return null;
                          },
                        ),
                      ),
                      TextFormField(
                        controller: passWordController2,
                        decoration: InputDecoration(
                          label: Text("Nhập lại mật khẩu",style: TextStyle(color: Color.fromARGB(255, 255, 85, 0)),),
                          hintText: "Vui lòng nhập lại mật khẩu",
                          prefixIcon: Icon(Icons.key),
                          border: new OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (str){
                          if(str == null || str.isEmpty) return "Mật khẩu không được rỗng";
                          var pass1 = passWordController.text;
                          var pass2 = passWordController2.text;
                          if(pass1 != pass2){
                            return "Mật khẩu nhập lại không đúng";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                        style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 122, right: 122, top: 25, bottom: 25)),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Colors.blue)
                          )
                        )
                    ),
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                          //   var pass1 = passWordController.text;
                          //   var pass2 = passWordController2.text;
                          //   if(pass1 == pass2){
                              Navigator.push(
                                context,
                                 MaterialPageRoute(builder: (context) => login()),
                              );
                            }
                          //   else{
                          //     _showDialog(context);
                          //   }
                          //}
                          // else{
                          //   print("Dữ liệu không chính xác");
                          
                      },
                        child: Text("Đăng ký"),
                        ),
                      ),
                ],
                ) 
              ),
          ),
        ),
      ),
    );
  }
}