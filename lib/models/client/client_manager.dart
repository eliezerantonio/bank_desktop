import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_desktop/helpers/api_response.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/client/client.dart';
import 'package:flutter_desktop/models/employee/employee_manager.dart';
import 'package:http/http.dart' as http;

class ClientManager extends ChangeNotifier {
  ClientManager() {}

  ClientModel client;

  EmployeeManager employee = EmployeeManager();

  Future<ApiResponse<ClientModel>> store(ClientModel client) async {
    try {
      var url = '$BASE_URL/client/';
         employee.getUser();
      Map<String, String> headers = {
        "Content-type": "application/json",
        "x-access-token": "${employee.employee.token}"
      };

      Map params = {
        'email': client.email,
        'password': client.password,
        'name': client.name,
        'phone': client.phone,
        'genre': client.genre,
        'bi': client.bi,
        'birthDate': "1997-10-26"
      };

      String credencials = json.encode(params);

      var response = await http.post(url, body: credencials, headers: headers);
      print(response.body);
      Map mapRensponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final client = ClientModel.fromJSON(mapRensponse);
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
