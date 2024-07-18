import 'dart:convert';

import 'user.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;
  final String? redirectRoute;

  AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.redirectRoute,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      isLoading: json['isLoading'] ?? false,
      error: json['error'],
      redirectRoute: json['redirectRoute'],
    );
  }
  AuthState copywith({
    User? user,
    bool? isLoading,
    String? error,
    String? redirectRoute,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      redirectRoute: redirectRoute ?? this.redirectRoute,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user != null
          ? {
              'name': user!.name,
              'phone': user!.phone,
              'cardNumber': user!.cardNumber,
              'token': user!.token,
            }
          : null,
      "isLoading": isLoading,
      "error": error,
      "redirectRoute": redirectRoute,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
