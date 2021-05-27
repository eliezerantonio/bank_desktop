

class AccountModel {
  

  int id;
  int clientId;
  String state;
  num balance;
AccountModel();


  AccountModel.fromJSON(Map<String, dynamic> fromJSON) {
    Map json = fromJSON["data"];
    id = json['id'];
    clientId = json['clientId'];
    state = json['state'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientId'] = this.clientId;
    data['state'] = this.state;
    data['balance'] = this.balance;
    return data;
  }

   @override
  String toString() {
    return "Account(id: $id, clientId: $clientId, state: $state, balance: $balance)";
  }
}