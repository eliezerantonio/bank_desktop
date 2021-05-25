import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/screens/cartoes/credit_card.dart';
import 'package:flutter_desktop/screens/client/client_screen.dart';
import 'package:flutter_desktop/screens/login_screen.dart';
import 'package:flutter_desktop/screens/raise/raiseScreen.dart'; 
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

          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomLeft: Radius.circular(100)),
            child: Container(
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
                      physics: BouncingScrollPhysics(),
                      children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text('Menu', style: TextStyle(fontSize: 16, color: Colors.white54),),
                       ),
                       ListTile(
                          leading: Icon(Icons.person_outline, color: Colors.white,),
                          title: Text('Cliente',style: TextStyle(color: Colors.white),),
                          onTap: (){
                            push(context, ClientScreen());
                            print("Item 1");
                            
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.credit_card, color: Colors.white,),
                          title: Text('Cartões de crédito',style: TextStyle(color: Colors.white),),
                          onTap: (){
                            push(context, CreditCardScreen());
                            print("Item 1");
                            
                          },
                        ), 
                         ListTile(
                          leading: Icon(Icons.money, color: Colors.white,),
                          title: Text('Levantamentos',style: TextStyle(color: Colors.white),),
                        
                          onTap: (){
                            push(context, RaiseScreen());
                            print("Item 1");
                           
                          },
                        ),
                        
                        ListTile(
                          leading: Icon(Icons.transform, color: Colors.white,),
                          title: Text('Financiamento',style: TextStyle(color: Colors.white),),
                         
                          onTap: (){
                            
                            push(context, CreditCardScreen());
                            print("Item 1");
                            
                          },
                        ),
                             ListTile(
                          leading: Icon(Icons.subdirectory_arrow_right_outlined, color: Colors.white,),
                          title: Text('Deposito',style: TextStyle(color: Colors.white),),
                        
                          onTap: (){
                            print("Item 1");
                            
                          },
                        ),
                               ListTile(
                          leading: Icon(Icons.transfer_within_a_station_rounded, color: Colors.white,),
                          title: Text('Transferencia',style: TextStyle(color: Colors.white),),
                      
                          onTap: (){
                            print("Item 1");
                            
                          },
                        ),
                         ListTile(
                          leading: Icon(Icons.trending_up, color: Colors.white,),
                          title: Text('Empréstimos',style: TextStyle(color: Colors.white),),
                         
                          onTap: (){
                            print("Item 1");
                           
                          },
                        ),
                        
                        ListTile(
                          leading: Icon(Icons.cancel_schedule_send_sharp, color: Colors.white,),
                          title: Text('Cancelar contas e outros',style: TextStyle(color: Colors.white),),
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