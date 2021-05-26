// import 'package:flutter/material.dart';

// Future<ApiResponse<Account>> deponsit({
//     @required int currentAccount,
//     @required num balance,
//   }) async {
//     try {
//       loading = true;
//       var url = '$BASE_URL/account/deposit/$currentAccount';
//       Map<String, String> headers = {"Content-type": "application/json"};

//       Map<String, dynamic> params = {"balance": balance};

//       String values = json.encode(params);
//       await Future.delayed(Duration(seconds: 2));
//       var response = await http.patch(url, body: values, headers: headers);

//       Map mapRensponse = json.decode(response.body);

//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         final account = Account.fromJson(mapRensponse);
//         loading = false;
//         getAccount(userId: account.clientId);
//         return ApiResponse.ok(account);
//       }

//       loading = false;

//       return ApiResponse.error(mapRensponse["message"]);
//     } catch (e, exception) {
//       print(
//         "Erro no login $e -> $exception",
//       );
//       return ApiResponse.error("$e");
//     }
//   }





//   Future<ApiResponse<Account>> raise({
//     @required int currentAccount,
//     @required num balance,
//   }) async {
//     try {
//       loading = true;
//       var url = '$BASE_URL/account/client/raise/$currentAccount';
//       UserManager user = await UserManager();

//       Map<String, String> headers = {
//         "Content-type": "application/json",
//         "x-access-token": "${user.user.token}"
//       };

//       Map<String, dynamic> params = {"balance": balance};

//       String values = json.encode(params);
//       await Future.delayed(Duration(seconds: 2));
//       var response = await http.patch(url, body: values, headers: headers);

//       Map mapRensponse = json.decode(response.body);

//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         final account = Account.fromJson(mapRensponse);
//         loading = false;
//         getAccount(userId: account.clientId);
//         return ApiResponse.ok(account);
//       }

//       loading = false;

//       return ApiResponse.error(mapRensponse["message"]);
//     } catch (e, exception) {
//       print(
//         "Erro no login $e -> $exception",
//       );
//       return ApiResponse.error("$e");
//     }
//   }
// }





// _onClickDeposit() async {
//       if (_contollerBalance.text.isNotEmpty) {
//         int currentAccount = account.id;
//         num balance = int.parse(_contollerBalance.text);

//         ApiResponse apiResponse = await context.read<AccountManager>().raise(
//               currentAccount: currentAccount,
//               balance: balance,
//             );

//         if (apiResponse.ok) {
//           messenger(context, "Levantamento realizado com sucesso");
//         } else {
//           messenger(context, apiResponse.msg, error: true);
//         }
//       } else {
//         messenger(context, "Preencha  valor ", error: true);
//       }
//     }