import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/widgets/circular_background.dart';
import 'package:flutter_desktop/widgets/text_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _focusNode = FocusNode();

    bool _showProgress = false;

    final size = MediaQuery.of(context).size;
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
                              'Bem vindo ao Bai',
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
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
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
                                      onPressed: () {
                                        _formKey.currentState.validate();
                                      },
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
    if (value.isEmpty) return 'Digite seu email';
    return null;
  }

  String _validatorPassword(String value) {
    if (value.isEmpty) return 'Digitea senha';
    return null;
  }
}
