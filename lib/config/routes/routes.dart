
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:podcast_project/config/routes/route_name.dart';
import 'package:podcast_project/features/authentication/presentation/pages/login_page.dart';
import 'package:podcast_project/features/authentication/presentation/pages/signup_page.dart';
import 'package:podcast_project/features/events/presentation/pages/events_page.dart';
import 'package:podcast_project/features/home/presentation/pages/home_page.dart';
import 'package:podcast_project/features/onboarding/presentation/pages/onboardingScreen.dart';
import 'package:podcast_project/features/podcasts/presentation/pages/audio_player_screen.dart';
import 'package:podcast_project/features/podcasts/presentation/pages/podcast_page.dart';
import 'package:podcast_project/features/reels/presentation/pages/reels_page.dart';
import 'package:podcast_project/features/sermons/presentation/pages/sermons_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding', 
        name: onboardingRoute,
        builder: (context, state) => const OnboardingScreen(),
    ),
      GoRoute(
        path: '/login', 
        name: loginRoute,
        builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
        path: '/signup', 
        name: signUpRoute,
        builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
        path: '/home', 
        name: homeRoute,
        builder: (context, state) => const HomePage(),
    ),
     GoRoute(
        path: '/podcast', 
        name: podcastRoute,
        builder: (context, state) => const AudioPlayerScreen(),
    ),
    GoRoute(
        path: '/reel', 
        name: reelRoute,
        builder: (context, state) => const SocialMediaMage(),
    ),
    GoRoute(
        path: '/sermons', 
        name: sermonsRoute,
        builder: (context, state) => const SermonPage(),
    ),
    GoRoute(
        path: 'git ', 
        name: eventsRoute,
        builder: (context, state) => const EventPage(),
    ),
    ],
  );
});