import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_desktop/helpers/api_response.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/account/account.dart';
import 'package:flutter_desktop/models/client/client_manager.dart';
import 'package:flutter_desktop/models/employee/employee_manager.dart';
import 'package:http/http.dart' as http;

class AccountManager extends ChangeNotifier {
  AccountModel account;

  AccountManager() {}

  bool _isLoading = false;
  set loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<ApiResponse<AccountModel>> store(AccountModel account) async {
    try {
      var url = '$BASE_URL/account/';

      EmployeeManager employee;

      Map<String, String> headers = {
        "Content-type": "application/json",
        "x-access-token": "${employee.employee.token}"
      };

      Map params = {
        'clientId': account.clientId,
        'balance': account.balance,
      };

      String credencials = json.encode(params);

      var response = await http.post(url, body: credencials, headers: headers);
      print(response.body);
      Map mapRensponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final account = AccountModel.fromJSON(mapRensponse);
        notifyListeners();
        return ApiResponse.ok(account);
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

  Future<ApiResponse<AccountModel>> deposit(
      {@required int account, double balance}) async {
    try {
      loading = true;
      var url = '$BASE_URL/account/deposit/$account';
      Map<String, String> headers = {
        "Content-type": "application/json",
      };

      Map params = {
     
        'balance': balance,
      };

      String credencials = json.encode(params);

      var response = await http.patch(url, body: credencials, headers: headers);
 
      Map mapRensponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final account = AccountModel.fromJSON(mapRensponse);
        loading = false;
        return ApiResponse.ok(account);
      }

      loading = false;

      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro ao Depositar $e",
      );
      // notifyListeners();
      return ApiResponse.error("$e");
    }
  }
}
