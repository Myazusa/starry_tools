import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starry_tools/router/router.dart';

void main() {
  runApp(ProviderScope(
    child: Main(),
  ),);
}

class Main extends StatelessWidget{
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ResourceHanRoundedCN',fontFamilyFallback: ['ResourceHanRoundedJP']),
    );
  }

}