import 'package:flutter/material.dart';
import 'package:flutter_desktop/models/employee/employee_manager.dart';
import 'package:flutter_desktop/screens/hom_page.dart';
import 'package:flutter_desktop/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(

    providers: [

      ChangeNotifierProvider(
        create: (_) => EmployeeManager(),
        lazy: false,
      )
    ],

    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage(),
    ),
  )
);


