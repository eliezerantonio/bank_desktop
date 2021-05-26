import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/api_response.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/account/account.dart';
import 'package:flutter_desktop/models/account/account_manager.dart';
import 'package:flutter_desktop/models/client/client.dart';
import 'package:flutter_desktop/models/client/client_manager.dart';
import 'package:flutter_desktop/widgets/text_form.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'components/custon_button.dart';

class AccountScreen extends StatelessWidget {

  AccountModel account = AccountModel();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    
       _onCriarConta() async {
      if(_formKey.currentState.validate()){
        _formKey.currentState.save();
          context.read<AccountManager>().store(account);
      }
   }


    return Container(
        width: size.width * 0.8,
        padding: EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Card(
                  elevation: 4,
                  child: Container(
                    margin: EdgeInsets.all(25.0),
                    width: 300,
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text('Criar conta', 
                         style: TextStyle(
                            color: Color(PRIMARY_COLOR), fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 3,
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
                             
                              SizedBox(height: 20,),
                              Text('ID_Client'),
                              SizedBox(height: 20,),
                              CustomTextField(
                                 keyboardType: TextInputType.number,
                                onSaved: (clientId) => account.clientId = int.parse(clientId) ,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text('Balance'),
                              SizedBox(height: 20,),
                               CustomTextField(
                                 keyboardType: TextInputType.number,
                                onSaved: (balance) => account.balance = double.parse(balance) ,
                              ),
                              SizedBox(
                                height: 15,
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
                                      'Criar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: _onCriarConta
                              )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), 


               

              ],
              
            ),

          ],
        ));
  }
}
