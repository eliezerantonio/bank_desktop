import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/client/client.dart';
import 'package:flutter_desktop/models/client/client_manager.dart';
import 'package:flutter_desktop/models/employee/employee.dart';
import 'package:flutter_desktop/screens/cartoes/credit_card.dart';
import 'package:flutter_desktop/screens/client/client_screen.dart';
import 'package:flutter_desktop/screens/conta/account_screen.dart';
import 'package:flutter_desktop/screens/login_screen.dart';
import 'package:flutter_desktop/screens/raise/raiseScreen.dart';
import 'package:flutter_desktop/util/nav.dart';
import 'package:flutter_desktop/widgets/text_form.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  String menu = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    _onClickLogout() {
      context.read<Employee>().clear();
      push(context, LoginScreen(), replace: true);
    }

    return Scaffold(
        body: Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), bottomLeft: Radius.circular(100)),
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
                    Icon(Icons.admin_panel_settings_outlined,
                        color: Colors.white, size: 40),
                    SizedBox(
                      width: 35,
                    ),
                    Text('Admin',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: size.width * 0.5,
                height: size.height * 0.4,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Menu',
                        style: TextStyle(fontSize: 16, color: Colors.white54),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Cliente',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          menu = "cliente";
                        });
                      },
                    ),
                     ListTile(
                      leading: Icon(
                        Icons.account_balance,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Conta',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          menu = "Conta";
                        });
                      },
                    ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.credit_card,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text(
                    //     'Cartões de crédito',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onTap: () {
                    //     setState(() {});
                    //     menu = "Cartões de crédito";
                    //   },
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.money,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text(
                    //     'Levantamentos',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onTap: () {
                    //     setState(() {});
                    //    menu = "Levantamentos";
                    //   },
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.transform,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text(
                    //     'Financiamento',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onTap: () {
                    //     setState(() {});
                    //     menu = "Financiamento";
                    //   },
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.subdirectory_arrow_right_outlined,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text(
                    //     'Deposito',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onTap: () {
                    //     setState(() {
                    //       menu = "deposito";
                    //     });
                    //   },
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.transfer_within_a_station_rounded,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text(
                    //     'Transferencia',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onTap: () {
                    //     setState(() {});
                    //     menu = "Transferencia";
                    //   },
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.trending_up,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text(
                    //     'Empréstimos',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onTap: () {
                    //     setState(() {});
                    //     menu = "Empréstimos";
                    //   },
                    // ),
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.cancel_schedule_send_sharp,
                    //     color: Colors.white,
                    //   ),
                    //   title: Text(
                    //     'Cancelar contas e outros',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onTap: () {
                    //     setState(() {});
                    //     menu = "Cancelar contas e outros";
                    //   },
                    // ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: _onClickLogout,
                child: Container(
                  padding: EdgeInsets.only(right: 30, bottom: 20),
                  width: size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      /////////////////////////////////////////////////////////
      if (menu == "deposito")
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        )
      else if(menu == "Conta")
          AccountScreen()
      else if(menu == "Empréstimos")
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        )
      else if(menu =="Cancelar contas e outros")
        Container(
          height: 100,
          width: 100,
          color: Colors.grey,
        )
      else if(menu == "Transferencia")
      Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        )
      else if(menu == "Cartões de crédito")
      Container(
          height: 100,
          width: 100,
          color: Colors.purple,
        )
      else if( menu =="Levantamentos")
         Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        )
        else if(menu == "Financiamento")
        Container(
          height: 100,
          width: 100,
          color: Colors.orange,
        ) 
        else 
         ClientScreen()
    ]));
  }
}
