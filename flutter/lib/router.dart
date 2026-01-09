import 'package:artspire/screens/addpage.dart';
import 'package:artspire/screens/artworks.dart';
import 'package:artspire/screens/messagespage.dart';
import 'package:artspire/screens/profilepage.dart';
import 'package:artspire/screens/settings.dart';
import 'package:artspire/screens/shellpage.dart';
import 'package:artspire/screens/homepage.dart';
import 'package:artspire/screens/searchpage.dart';
import 'package:artspire/screens/searchpage_card.dart';
import 'package:artspire/screens/accountpage.dart';
import 'package:artspire/screens/confirmation_page.dart';
import 'package:artspire/screens/personalinformation.dart';
import 'package:artspire/models/artItem.dart';
import 'package:artspire/screens/paymentWindow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => ShellPage(child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) =>
            NoTransitionPage(child: SearchPage()),
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) {
                final item = state.extra as ArtItem;
                return NoTransitionPage(
                  child: SearchCardDetails(
                    item: item,
                  )
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/notification',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: MessagesPage()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ProfilePage()),
          routes: [
            GoRoute(
              path: 'editprofile',
              pageBuilder: (context, state) {
                return NoTransitionPage(child: AccountPage());
              },
              routes: [
                GoRoute(
                  path: 'personalinformation',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: Personalinformation());
                  },
                ),
                GoRoute(
                  path: 'artworks',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: Artworks());
                  },
                ),
                GoRoute(
                  path: 'settings',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: Settings());
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/add',
          pageBuilder: (context, state) => NoTransitionPage(child: AddPage()),
        ),
      ],
    ),

    //buying confirmation
    GoRoute(
      path: '/search/:id/details',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final item = state.extra as ArtItem;
        return NoTransitionPage(
          child: PurchaseConfirmation(
            id: id, 
            item: item,
          )
        );
      },
    ),
    GoRoute(
      path: '/payment',
      pageBuilder: (context, state) => const MaterialPage(
        child: PaymentWindow(),
      )
    )
  ],
);
