import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  static const String _apiKey = "";

  RxBool isLoading = false.obs;
  RxString data = ''.obs;

  Future<void> getUsers(String token) async {
    final url = Uri.parse('http://testapi.alifouad91.com/api/users');

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Successfully retrieved users
        print('Users retrieved successfully');
        print(response.body);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> getUser(String token) async {
    final url = Uri.parse('http://testapi.alifouad91.com/api/user/1');

    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Successfully retrieved the user
        print('User retrieved successfully');
        print(response.body);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  static Future<void> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String countryCode,
    required String passwordConfirm,
  }) async {
    final url = Uri.parse('http://testapi.alifouad91.com/api/user/register');

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final body = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'country_code': countryCode,
      'password_confirm': passwordConfirm,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('User registered successfully');
        print(response.body);
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error: $error');
    }
  }



  static Future<dynamic> loginUser(
      {required String email, required String password}) async {
    final url = Uri.parse('http://testapi.alifouad91.com/api/login');

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final body = {
      'email': email,
      'password': password,
    };
    // final body = {
    //   'email': 'ahmad4@gmail.com',
    //   'password': '1234',
    // };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // Successful login
        print('User logged in successfully');
        print(response.body);
        return jsonDecode(response.body)["data"];
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  static Future<void> updateUser(
      {required String name,
      required String email,
      required String phone,
      required String countryCode}) async {
    final url = Uri.parse('http://testapi.alifouad91.com/api/user/update');

    final headers = {
      'Accept': "application/json",
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final body = {
      'name': name,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
    };

    // final body = {
    //   'name': 'aa12',
    //   'email': 'cc@gmail.com12',
    //   'phone': '96868686814',
    //   'country_code': '+91111',
    // };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Successfully updated user
        print('User updated successfully');
        print(response.body);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> changePassword(
      {required String password,
      required String passwordConfirm,
      required String currentPassword}) async {
    final url =
        Uri.parse('http://testapi.alifouad91.com/api/user/changepassword');

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final body = {
      'password': password,
      'password_confirm': passwordConfirm,
      'current_password': currentPassword,
    };

    // final body = {
    //   'password': '1234',
    //   'password_confirm': '1234',
    //   'current_password': '12345',
    // };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Successfully changed password
        print('Password changed successfully');
        print(response.body);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> deleteUser() async {
    final url = Uri.parse('http://testapi.alifouad91.com/api/user/delete');

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.delete(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Successfully deleted user
        print('User deleted successfully');
        print(response.body);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
