import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/screens/login_screen.dart'; 
import 'package:flutter_desktop/util/nav.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;

  _onClickLogout() {
    push(context, LoginScreen(), replace: true);
  }

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
                SizedBox(height: 10,),
                Container(
                  width: size.width * 0.5,
                  height: size.height * 0.4,
                  child: ListView(
                    children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text('Menu', style: TextStyle(fontSize: 16, color: Colors.white54),),
                     ),
                      ListTile(
                        leading: Icon(Icons.star, color: Colors.white,),
                        title: Text('Cliente',style: TextStyle(color: Colors.white),),
                        onTap: (){
                          print("Item 1");
                          
                        },
                      ), 
                      ListTile(
                        leading: Icon(Icons.star, color: Colors.white,),
                        title: Text('Emprestimo',style: TextStyle(color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                        onTap: (){
                          print("Item 1");
                          
                        },
                      ),
                       ListTile(
                        leading: Icon(Icons.star, color: Colors.white,),
                        title: Text('Favoritos',style: TextStyle(color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                        onTap: (){
                          print("Item 1");
                         
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.star, color: Colors.white,),
                        title: Text('Emprestimo',style: TextStyle(color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward, color: Colors.white,),
                        onTap: (){
                          print("Item 1");
                          
                        },
                      ),
                    ],
                  ),
                ), 

                Spacer(),

                GestureDetector(
                  onTap:  _onClickLogout,
                  child: Container(
                    padding: EdgeInsets.only(right: 30, bottom: 20),
                    width: size.width,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon( Icons.logout, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                      ],
                    ),
                  ),
                )
             
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