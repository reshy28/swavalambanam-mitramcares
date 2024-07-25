import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/controller/newspapper_info_controller.dart';
import 'package:rest_api/view/Loginscreen/Loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewspapperController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
