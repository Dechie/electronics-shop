import 'dart:convert';

import 'user.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  AuthState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      isLoading: json['isLoading'] ?? false,
      error: json['error'],
    );
  }
  AuthState copywith({User? user, bool? isLoading, String? error}) {
    return AuthState(
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user != null
          ? {
              'phone': user!.phone,
              'cardNumber': user!.cardNumber,
              'token': user!.token,
            }
          : null,
      "isLoading": isLoading,
      "error": error,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
