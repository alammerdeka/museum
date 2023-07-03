part of 'utils.dart';
class AppRoute {
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const walkThrough = '/walkThrough';
  static const loader = '/loader';

  static GoRouter routerConfig = GoRouter(
    errorBuilder: (context, state) => ErrorPage(
      title: 'Something Error',
      description: state.error.toString(),
    ),
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      User? user = await Session.getUser();
      if (user == null) {
        if (state.location == login || state.location == register) {
          return null;
        }

        return walkThrough;
      }

      return loader;
    },
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) =>  HomePage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) =>  LoginPage(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: walkThrough,
        builder: (context, state) => OpeningPage(),
      ),
      GoRoute(
        path: loader,
        builder: (context, state) => LoaderPageEmpty(),
      ),
      // GoRoute(
      //   path: detailBeasiswa,
      //   builder: (context, state) =>
      //       DetailBeasiswaPage(beasiswa: state.extra as Beasiswa),
      // ),
      // GoRoute(
      //   path: addTopic,
      //   builder: (context, state) => ChangeNotifierProvider(
      //     create: (_) => CAddTopic(),
      //     child: AddTopic(),
      //   ),
      // ),
      // GoRoute(
      //   path: profile,
      //   builder: (context, state) => ChangeNotifierProvider(
      //     create: (_) => CProfile(),
      //     child: ProfilePage(user: state.extra as User),
      //   ),
      // ),
      // GoRoute(
      //   path: search,
      //   builder: (context, state) => ChangeNotifierProvider(
      //     create: (_) => CSearch(),
      //     child: const SearchPage(),
      //   ),
      // ),
      // GoRoute(
      //   path: follower,
      //   builder: (context, state) => ChangeNotifierProvider(
      //     create: (_) => CFollower(),
      //     child: FollowerPage(user: state.extra as User),
      //   ),
      // ),
      // GoRoute(
      //   path: following,
      //   builder: (context, state) => ChangeNotifierProvider(
      //     create: (_) => CFollowing(),
      //     child: FollowingPage(user: state.extra as User),
      //   ),
      // ),
      // GoRoute(
      //   path: comment,
      //   builder: (context, state) => ChangeNotifierProvider(
      //     create: (_) => CComment(),
      //     child: CommentPage(topic: state.extra as Topic),
      //   ),
      // ),

      // GoRoute(
      //   path: updateTopic,
      //   builder: (context, state) =>
      //       UpdateTopicPage(topic: state.extra as Topic),
      // ),
    ],
  );
}