import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/client/client_manager.dart';
import 'package:flutter_desktop/models/employee/employee_manager.dart';
import 'package:flutter_desktop/screens/home/hom_page.dart';
import 'package:flutter_desktop/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'models/account/account_manager.dart';
import 'models/employee/employee.dart';

void main() => runApp(
  MultiProvider(

    providers: [
  ChangeNotifierProvider(
        create: (_) => Employee(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => EmployeeManager(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => ClientManager(),
        lazy: false,
      ), 
      ChangeNotifierProvider(
        create: (_) => AccountManager(),
        lazy: false,
      ),
    ],

    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginScreen(),
    ),
  )
);


