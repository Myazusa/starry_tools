import 'package:go_router/go_router.dart';

import '../layout/home_layout.dart';
import '../page/home/json_editor.dart';
import '../page/home/setting.dart';

final router = GoRouter(
  initialLocation: '/json_editor',
  routes: [
    ShellRoute(
      builder: (context, state ,child) => HomeLayout(child: child),
      routes: [
        GoRoute(
            path: '/json_editor',
            builder: (context, state) => JsonEditor()
        ),
        GoRoute(
            path: '/setting',
            builder: (context, state) => Setting()
        )
      ]
    )
  ]
);