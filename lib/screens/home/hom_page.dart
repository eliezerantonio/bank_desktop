import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/consts.dart';

import 'package:flutter_desktop/models/employee/employee.dart';
import 'package:flutter_desktop/screens/client/client_screen.dart';
import 'package:flutter_desktop/screens/conta/account_screen.dart';
import 'package:flutter_desktop/screens/deposit/deposit_screen.dart';
import 'package:flutter_desktop/screens/login_screen.dart';
import 'package:flutter_desktop/util/nav.dart';
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
    
      if (menu == "Deposito")
         DepositScreen()
      else if(menu == "Conta")
          AccountScreen()
      else if(menu == "Levantamento")
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
        )
        else 
         ClientScreen()
    ]));
  }
}
