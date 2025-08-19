import 'package:go_router/go_router.dart';
import 'package:proximore/widgets/pages/connexion_page.dart';
import 'package:proximore/widgets/pages/home_page.dart';
import 'package:proximore/widgets/pages/map_page.dart';
import 'package:proximore/widgets/pages/chat_page.dart';
import 'package:proximore/widgets/pages/messagerie_page.dart';
import 'package:proximore/widgets/pages/settings_page.dart';
import 'package:proximore/widgets/components/bars/navBarWidget.dart';
import 'package:proximore/widgets/pages/new_post_page.dart';
import 'package:proximore/widgets/pages/profil_page.dart';
import 'package:proximore/widgets/pages/sign_in_page.dart';
import 'package:proximore/widgets/pages/sign_up_page.dart';

import '../models/Chat.dart';

final GoRouter router = GoRouter(
  initialLocation: '/connexion',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return NavigationExample();
      },
      routes: [
        GoRoute(
          path: '/connexion',
          builder: (context, state) {
            return const ConnexionPage();
          },
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) {
            return const SignUpPage();
          },
        ),
        GoRoute(
          path: '/signin',
          builder: (context, state) {
            return const SignInPage();
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) {
            return const MapPage();
          },
        ),
        GoRoute(
          path: '/messagerie',
          builder: (context, state) {
            return const MessageriePage();
          },
        ),
        GoRoute(
          path: '/profil',
          builder: (context, state) {
            return const ProfilPage();
          },
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) {
            return const SettingsPage();
          },
        ),
        GoRoute(
          path: '/addPost',
          builder: (context, state) {
            return NewPostPage();
          },
        ),
        GoRoute(
          path: '/chat_page',
          builder: (context, state) {
            final chat = state.extra as Chat; // Récupérez l'objet Album
            return ChatPage(chat: chat); // Passez l'objet Album à PlayPage
          },
        ),
      ],
    ),
  ],
);
