import 'package:artspire/Pages/addpage.dart';
import 'package:artspire/Pages/messagespage.dart';
import 'package:artspire/Pages/profilepage.dart';
import 'package:artspire/Pages/shellpage.dart';
import 'package:artspire/Pages/homepage.dart';
import 'package:artspire/Pages/searchpage.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => ShellPage(child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) => NoTransitionPage(
            child: SearchPage(),
          ),
        ),
        GoRoute(
          path: '/notification',
          pageBuilder: (context, state) => NoTransitionPage(
            child: MessagesPage(),
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage(
            child: ProfilePage(),
          ),
        ),
        GoRoute(
          path: '/add',
          pageBuilder: (context, state) => NoTransitionPage(
            child: AddPage(),
          ),
        ),
      ], 
    ),
  ],
);

