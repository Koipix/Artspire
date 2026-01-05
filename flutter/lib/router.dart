import 'package:artspire/screens/addpage.dart';
import 'package:artspire/screens/messagespage.dart';
import 'package:artspire/screens/profilepage.dart';
import 'package:artspire/screens/shellpage.dart';
import 'package:artspire/screens/homepage.dart';
import 'package:artspire/screens/searchpage.dart';
import 'package:artspire/screens/searchpage_card.dart';
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
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;
                return NoTransitionPage(
                  child: SearchCardDetails(id: id)
                );
              }
            ),
          ],
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

