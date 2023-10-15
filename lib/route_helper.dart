import 'package:go_router/go_router.dart';
import 'package:go_router_test/main.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ErrorPage(),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: "/",
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: "page_4",
          builder: (_, __) => const Page4(),
          routes: [
            GoRoute(
              path: "page_5",
              builder: (_, __) => const Page5(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: "/page_1",
      builder: (_, __) => const Page1(),
    ),
    GoRoute(
      path: "/page_2/:id1/:id2",
      builder: (_, state) {
        final int id1 = int.parse(state.pathParameters["id1"] ?? "0");
        final int id2 = int.parse(state.pathParameters["id2"] ?? "0");
        return Page2(
          id1: id1,
          id2: id2,
        );
      },
    ),
    GoRoute(
      path: "/page_3",
      builder: (_, GoRouterState state) {
        String platform = state.uri.queryParameters["platform"] ?? "IOS";
        return Page3(
          platform: platform,
        );
      },
    ),
    GoRoute(
      path: "/activity",
      redirect: (_, __) => "/dashboard",
    ),
    GoRoute(
      path: "/dashboard",
      builder: (_, __) => const DashboardPage(),
    ),
  ],
);
