import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_desktop/helpers/api_response.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/helpers/prefs.dart';
import 'package:flutter_desktop/models/employee/employee.dart';
import 'package:http/http.dart' as http;


class EmployeeManager extends ChangeNotifier {

  EmployeeManager() {
    getUser();
  }
  Employee employee;


  Future<ApiResponse<Employee>> login(String email, String password) async {
   
     
    try {
      var url = '$BASE_URL/employee/login';
      Map<String, String> headers = {"Content-type": "application/json"};

      Map params = {
        'email': email,
        'password': password,
      };

      String credencials = jsonEncode(params);

      var response = await http.post(url, body: credencials, headers: headers);

      Map mapRensponse = json.decode(response.body);

      

      if (response.statusCode == 200) {
        final employeeFrom = Employee.fromJson(mapRensponse);

        print(employeeFrom);
        employeeFrom.save();
        notifyListeners();
        return ApiResponse.ok(employeeFrom);
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

  Future<Employee> getUser() async {
    String jsonS = await Prefs.getString("employee.prefs");

   

    if (jsonS.isEmpty) {
      return null;
    } else {
      // convertendo String para Map/Objecto
      Map map = json?.decode(jsonS);

      employee = Employee.fromJsonPrefs(map);
     
    }

    return employee;
  }


}