 import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

alert(BuildContext context, String msg){
     showDialog(
       context: context, 
       barrierDismissible: false,
       builder: (context){
       
       return WillPopScope(
         onWillPop: () async => false,
         child: AlertDialog(
           title: Text('Carros'),
           content: Text(msg),
           actions: [
             FlatButton(
               child: Text('Ok'),
               onPressed: (){
                  Navigator.pop(context);
                 
               },
             )
           ],
         ),
       );
     });
  }