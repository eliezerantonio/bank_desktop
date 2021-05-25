import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_desktop/helpers/api_response.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/client/client.dart';
import 'package:http/http.dart' as http;

class ClientManager extends ChangeNotifier {
  ClientManager() {
  }
  Client client;
  Future<ApiResponse<Client>> store(Client client) async {
    try {
      var url = '$BASE_URL/client/store';
      Map<String, String> headers = {"Content-type": "application/json"};

      Map params = {
        'email': client.email,
        'password': client.password,
        'nome':client.name
      };

      String credencials = jsonEncode(params);

      var response = await http.post(url, body: credencials, headers: headers);

      Map mapRensponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final client = Client.fromJSON(mapRensponse);
        notifyListeners();
        return ApiResponse.ok(client);
      }
      notifyListeners();

      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      // notifyListeners();
      return ApiResponse.error("Impossivel fazer login");
    }
  }

  


}