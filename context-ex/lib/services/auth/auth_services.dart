import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth_state.dart';
import '../../models/user.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState()) {
    checkAuthed();
  }

  Future<void> checkAuthed() async {
    final shPref = await SharedPreferences.getInstance();
    final jsonValue = json.decode(shPref.getString('authState') ?? "{}");

    if (jsonValue != null) {
      state = AuthState.fromJson(jsonValue);
    }
  }

  Future<void> login(String name, String phone, String password) async {
    state = state.copywith(isLoading: true);

    final shPref = await SharedPreferences.getInstance();
    int statusCode = 0;
    try {
      final response = await http.post(
        Uri.parse('http://localhost:800/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'password': password,
        }),
      );

      statusCode = response.statusCode;
      if (statusCode == 200) {
        final user = User.fromJson(json.decode(response.body));
        state = AuthState(user: user);
        await saveAuthState();
      } else {
        state = state.copywith(error: "error occured");
      }
    } catch (e) {
      state = state.copywith(error: "$statusCode: $e");
    } finally {
      state = state.copywith(isLoading: false);
    }
  }

  void logout() {
    state = AuthState();
  }

  Future<void> register(Map<String, dynamic> regValues) async {
    state = state.copywith(isLoading: true);
    print('tried auth?');
    print(regValues);
    int statusCode = 0;
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(regValues),
      );
      statusCode = response.statusCode;
      print(response.statusCode);
      if (response.statusCode == 201) {
        final user = User.fromJson(json.decode(response.body));
        state = AuthState(user: user);
        await saveAuthState();
      } else {
        state = state.copywith(error: 'Registration failed');
      }
    } catch (e) {
      state = state.copywith(error: "$statusCode: $e");
    } finally {
      state = state.copywith(isLoading: false);
    }
  }

  Future<void> saveAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    final authStateJson = jsonEncode(state.toJson());
    await prefs.setString('authState', authStateJson);
  }
}
