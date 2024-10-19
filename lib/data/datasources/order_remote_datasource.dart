import 'package:megonopos/core/constants/variables.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

import 'package:megonopos/data/models/request/order_request_model.dart';

class OrderRemoteDatasource {
  Future<bool> sendOrder(OrderRequestModel orderRequestModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    print(orderRequestModel.toJson());
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/orders'),
      headers: {
        'Authorization': 'Bearer ${authData.result?.token.toString()}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: orderRequestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
