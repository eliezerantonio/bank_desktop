import 'package:flutter/material.dart'; 

alertDialog( BuildContext context, String text){

  return showDialog(
       context: context, 
       builder: (context){
       
       return AlertDialog(
         title: Column(
           children: [
             Icon(
               Icons.person_add_disabled_sharp, 
               color: Colors.red, 
               size: 50
             ),
             Text(text),
           ],
         ),
         actions: [

           TextButton(
             child: Text('Ok'),
             onPressed: (){
                Navigator.pop(context);

             },
           ),
         ],
       ); 
});
}