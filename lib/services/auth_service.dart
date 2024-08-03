import 'dart:convert';

import 'package:ecomnode/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class Authserrvices{
  static String? userId;

  AuthServices() {
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    print('Loaded user ID: $userId');
  }

  Future<void> _saveUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', id);
    userId = id;
    print('Saved user ID: $userId');
  }


  Future<void>register({required authmodel auth})

async {
    print(auth.name);
    print(auth.username);
    print(auth.email); print(auth.password); print(auth.phone);

    final Uri url=Uri.parse('$baseurl/api/auth/register');
    try{final response=await http.post(url,body: auth.toJson());

      if (response.statusCode==200){
        print("Registratoin success");
      }
      else{
        throw Exception("Failed to register${response.statusCode}");

      }

         }
        catch(e){print("error $e");
      throw Exception("error occured during registration");

        }

}
  Future<void> login(
      { required  password, required email}) async {
    final Uri url = Uri.parse('$baseurl/api/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Response data: $responseData');
        print('User ID from response: ${responseData['_id']}');
        print('Username from response: ${responseData['username']}');
        print('Email from response: ${responseData['email']}');

        userId = responseData['loginid'];
        if (userId != null) {
          await _saveUserId(userId!);
          print('Login successful');
          print('User ID: $userId');
        } else {
          print('User ID is null');
          throw Exception('User ID not found in response');
        }
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
      throw Exception('An error occurred during login');
    }
  }
}