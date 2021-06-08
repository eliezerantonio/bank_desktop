import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/client/client.dart';
import 'package:flutter_desktop/models/client/client_manager.dart';
import 'package:flutter_desktop/screens/home/hom_page.dart';
import 'package:flutter_desktop/util/nav.dart';
import 'package:flutter_desktop/widgets/text_form.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'components/custon_button.dart';

class ClientScreen extends StatefulWidget {
  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  ClientModel client = ClientModel();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: EdgeInsets.all(30),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Novo Cliente",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text("Nome"),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSaved: (name) => client.name = name,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("E-mail"),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onSaved: (email) => client.email = email,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Telefone"),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onSaved: (phone) => client.phone = phone,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Genero"),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onSaved: (genre) => client.genre = genre,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BI"),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onSaved: (bi) => client.bi = bi,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Password"),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            password: true,
                            onSaved: (password) => client.password = password,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 23,
                          ),
                          GestureDetector(
                            onTap: () async {
                              _formKey.currentState.save();

                              setState(() {
                                isLoading = true;
                              });
                              await Future.delayed(Duration(seconds: 5));
                              final api =
                                  context.read<ClientManager>().store(client);
                              api.then((value) {
                                push(context, HomePage(), replace: true);
                              });
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 1200),
                              alignment: !isLoading
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: AnimatedContainer(
                                height: !isLoading ? 44 : 50,
                                width: !isLoading ? 250 : 50,
                                alignment: Alignment.center,
                                child: !isLoading
                                    ? Text(
                                        "Cadastrar",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator()),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(PRIMARY_COLOR),
                                ),
                                duration: Duration(milliseconds: 1200),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
