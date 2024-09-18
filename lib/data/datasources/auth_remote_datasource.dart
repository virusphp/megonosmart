import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:megonopos/core/constants/variables.dart';
import 'package:megonopos/data/models/response/auth_response_model.dart';

class AuthRemoteDatasource 
{
  Future<Either<String, AuthResponseModel>> login(String email, String password) async {
    // final url = Variables().
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      body: {
        'email': email,
        'password': password
      }
    );
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}