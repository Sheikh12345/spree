import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spree/screens/Home/main_widget.dart';
import 'package:spree/screens/OrderProvider/order_provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>OrderProvider())
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spree',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: HomePage(),
    );
  }
}
