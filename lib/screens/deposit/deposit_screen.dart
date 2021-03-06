import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/api_response.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/account/account.dart';
import 'package:flutter_desktop/models/account/account_manager.dart';
import 'package:flutter_desktop/widgets/messenger.dart';

import 'package:flutter_desktop/widgets/text_form.dart';

import 'package:provider/provider.dart';

class DepositScreen extends StatelessWidget {
  AccountModel account = AccountModel();

  final _formKey = GlobalKey<FormState>();
  String initialValue = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    _onCriarConta() async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        ApiResponse apiResponse = await context
            .read<AccountManager>()
            .deposit(account: account.id, balance: account.balance);
        print('$apiResponse');
        if (apiResponse.ok) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: Column(
                    children: [
                      Icon(Icons.upload_outlined,
                          color: Colors.green, size: 50),
                      Text("Deposito realizado com sucesso"),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: () {
                        _formKey.currentState.reset();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        } else {
          messenger(context, apiResponse.msg, error: true);
        }
      } else {
        messenger(context, "Preencha  valor ", error: true);
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
            Card(
              elevation: 4,
              child: Container(
                margin: EdgeInsets.all(25.0),
                width: 300,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Deposito',
                        style: TextStyle(
                            color: Color(PRIMARY_COLOR),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
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
                          Text('Numero de conta'),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            onSaved: (id) => account.id = int.parse(id),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Balance'),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            onSaved: (balance) =>
                                account.balance = double.parse(balance),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 100,
                            height: 44,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(PRIMARY_COLOR),
                              child: Text(
                                'Depositar',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: _onCriarConta,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
