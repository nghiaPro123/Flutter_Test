
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/test2.dart';
import 'package:flutter_application_1/test3.dart';
import 'package:flutter_slidable/flutter_slidable.dart';



class classnum extends StatelessWidget {
  classnum(this.listview);
  List<classroom> listview;


  void _showDialog(BuildContext context, String monhoc, String malop, String sl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(monhoc),
          content: Text(malop),
          actions: [
            MaterialButton(
              child: Text("Delete"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: Text("Return"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          ...listview.map((e){
              return Container(
                margin: EdgeInsets.only(top:5, bottom:5),
                width:  500,
                height: 200,
                // decoration: BoxDecoration(
                //         image: DecorationImage(
                //           image: AssetImage(e.anh), fit: BoxFit.cover
                //         ),
                //         borderRadius: BorderRadius.circular(10)),
                        child: Slidable(
                          endActionPane: const ActionPane(
                          extentRatio: 0.4,
                          motion: DrawerMotion(),
                          children:
                          [
                            
                            SlidableAction(
                                
                                onPressed:null,
                                backgroundColor: Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10) ),
                                
                              ),
                            SlidableAction(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10) ),
                              onPressed: null,
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Share',

                              
                            ),
                            
                          ],
              ),
                          child: Container(
                            decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(e.anh), fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment :MainAxisAlignment.spaceBetween,
                                      children: [
                                        
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 400,
                                                child: Text(
                                                e.monhoc,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                ),
                                                
                                               ),
                                              ),
                                              
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: IconButton(
                                                  onPressed: (){
                                                       _showDialog(context,e.monhoc,e.mamon,e.hocvien);
                                                  }, 
                                                  icon:const Icon(Icons.more_horiz, color: Colors.white,))
                                              ),
                                            ],
                                          ),
                                        
                                        Text(
                                          e.mamon,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            fontSize: 17,
                                            height: 2,
                                          ),
                                        ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                e.hocvien+" Học Viên",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
              );
          }).toList()
        ]
      )

    );
  }
  

}