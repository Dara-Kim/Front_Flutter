import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasori/providers/auth_provider.dart';
import 'package:dasori/screens/login/login.dart';
import 'package:dasori/screens/login/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(
          builder: (context, auth, child) {
            return auth.isAuthenticated ? Home() : login();
          },
        ),
      ),
    );
  }
}
