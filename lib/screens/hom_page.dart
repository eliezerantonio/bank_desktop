import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/consts.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;

    return Scaffold(
     
      body: Row(
        children: [

          Container(
            width: size.width * 0.2,
            color: Color(PRIMARY_COLOR),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30),
                  alignment: Alignment.center,
                 width: size.width,
                 height: 100,
                  child: Row(
              
                    children: [
                      Icon( 
                        Icons.admin_panel_settings_outlined, 
                        color: Colors.white,
                        size: 40
                      ),
                      SizedBox(width:35 ,),
                      Text(
                        'Admin', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 30
                        )
                      ),
                    ],
                  ),
                ), 
                SizedBox(height: 40,), 
                
             
              ],
            ),
          ), 

          Container(
            width: size.width * 0.8,
            color: Colors.white
          )
        ],
      )
    );
  }
}