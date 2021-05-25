import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/api_response.dart';

import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/employee/employee.dart';
import 'package:flutter_desktop/models/employee/employee_manager.dart';
import 'package:flutter_desktop/screens/home/hom_page.dart';
import 'package:flutter_desktop/util/nav.dart';
import 'package:flutter_desktop/widgets/messenger.dart';
import 'package:flutter_desktop/widgets/show_dialog.dart';
import 'package:flutter_desktop/widgets/text_form.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  final employee = Employee();
  final _formKey = GlobalKey<FormState>();
  final _focusPassword =FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

 
     _onClickLogin() async {
      if(_formKey.currentState.validate()){
        _formKey.currentState.save();

    ApiResponse apiResponse =  await context.read<EmployeeManager>().login(employee.email, employee.password);
        
      if (apiResponse.ok) {
      Employee employee = apiResponse.result;
      if (employee != null) {
         push( context, HomePage(), replace: true);

        return;
      }
    } else {
      alertDialog(context, apiResponse.msg);
    }
 
      }
   }

    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Color(PRIMARY_COLOR),
            width: size.width * 0.4,
            child: Center(child: Image.asset("assets/cards.gif")
          ),
          ),
          Container(
            width: size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 8,
                  child: Container(
                    margin: EdgeInsets.all(25.0),
                    width: 400,
                    height: 500,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bem vindo',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black45),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 36, color: Color(PRIMARY_COLOR)),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Form(
                              key: _formKey,
                              child: ListView(
                                padding: EdgeInsets.all(8.0),
                                shrinkWrap: true,
                                children: [
                                  Text("Email"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextField(
                                    validator: _validatorEmail,
                                    nextFocus: _focusPassword,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (email) => employee.email = email,
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Text('Password'),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextField(
                                    validator: _validatorPassword,
                                    focusNode: _focusPassword, 
                                    password: true,
                                    onSaved: (password) => employee.password = password,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 44,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Color(PRIMARY_COLOR),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: _onClickLogin
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

 
  String _validatorEmail(String value) {
    if (value.isEmpty){
       return 'Digite seu email';
    } else if (!value.contains("@")) {
      return "Preencha email valido";
    }
    return null;
  }

  String _validatorPassword(String value) {
    if (value.isEmpty){
      return 'Digitea senha';
    }
    if(value.length < 3){
      return 'A senha precisa ter pelo menus 3 números';
    }
      return null; 
  
  }
}
