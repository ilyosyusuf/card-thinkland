import 'package:card/config/routes/page_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card',
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.light()),
      initialRoute: '/card',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}