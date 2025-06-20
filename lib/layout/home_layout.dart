import 'package:flutter/material.dart';
import 'package:starry_tools/page/home/dashboard.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
          children: [
            SizedBox(width: 200, child: Dashboard()),
            VerticalDivider(width: 1),
            Expanded(child: child),
          ],
        ),
    );
  }
}