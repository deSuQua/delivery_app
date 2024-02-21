import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/core/router/src/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  late final List<AutoRoute> routes = [
    /// "Приветственные" экраны
    AdaptiveRoute(
      page: SignUpRoute.page,
      initial: true,
      path: '/sign-up',
    ),
  ];
}
