import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_desktop/helpers/api_response.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/models/account/account.dart';
import 'package:flutter_desktop/models/employee/employee_manager.dart';
import 'package:http/http.dart' as http;

class AccountManager extends ChangeNotifier {

  AccountManager() {}
  
    AccountModel account;
    EmployeeManager employee =  EmployeeManager();

  Future<ApiResponse<AccountModel>> store(AccountModel account) async {
    try {
      var url = '$BASE_URL/account/';
     
      Map<String, String> headers = {
        "Content-type": "application/json",
        "x-access-token":"${employee.employee.token}"
  
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
  

  Future<ApiResponse<AccountModel>> deponsit({
    @required int currentAccount,
    @required num balance,
  }) async {
    try {
    
      var url = '$BASE_URL/account/deposit/$currentAccount';
      Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, dynamic> params = {"balance": balance};

      String values = json.encode(params);
      await Future.delayed(Duration(seconds: 2));
      var response = await http.patch(url, body: values, headers: headers);

      Map mapRensponse = json.decode(response.body);

      print(response.statusCode);
      if (response.statusCode == 200) {
        final account = Account.fromJson(mapRensponse);
      
        getAccount(userId: account.clientId);
        return ApiResponse.ok(account);
      }

   

      return ApiResponse.error(mapRensponse["message"]);
    } catch (e, exception) {
      print(
        "Erro no login $e -> $exception",
      );
      return ApiResponse.error("$e");
    }
  }



}
