import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:appwrite/models.dart';

class AppWriteProvider {
  static Client client = Client();

  Account? account;
  AppWriteProvider() {
    client
        .setEndpoint('http://172.23.112.1/v1') // Your Appwrite Endpoint
        .setProject('644fc90bd18f1732a7eb') // Your project ID
        .setSelfSigned(status: true);
    account = Account(client);
  }

  Future<void> signUp(String email, String password, String userId) async {
    final account = Account(AppWriteProvider.client);

    try {
      final response = await account.create(
          email: email, password: password, userId: ID.unique(), name: userId);
    } catch (e) {
      print('Error registering user: $e');
      throw e;
    }
  }

  Future<bool> login(String email, String password) async {
    final account = Account(AppWriteProvider.client);

    try {
      final response =
          await account.createEmailSession(email: email, password: password);
      // Check if the response status code is 201, which indicates a successful login
      if (response.current) {
        print('Logged in successfully');
        return true;
      } else {
        print('Failed to log in2');
        return false;
      }
    } catch (e) {
      print('Error logging in: $e');
      throw e;
    }
  }

  Future<String> getUserName() async {
    final account = Account(AppWriteProvider.client);
    User response = await account.get();
    return response.name;
  }
}


  // Future<void> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   final user = await _auth.signUp(
  //     email,
  //     password,
  //   );

  //   // you can also store the user in Database
  // }