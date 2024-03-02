import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/src/core/router/src/app_router.gr.dart';

export 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  late final List<AutoRoute> routes = [
    /// Экран "Регистрация"
    AdaptiveRoute(
      page: SignUpRoute.page,
      initial: true,
      path: '/sign-up',
    ),

    /// Экран "Верификация"
    AdaptiveRoute(
      page: AuthCodeRoute.page,
      path: '/auth-code',
    ),

    /// Экран "Авторизация"
    AdaptiveRoute(
      page: LogInRoute.page,
      path: '/log-in',
    ),

    /// Экран "Забыли пароль"
    AdaptiveRoute(
      page: ForgotPasswordRoute.page,
      path: '/forgot-password',
    ),

    /// Экран "Новый пароль"
    AdaptiveRoute(
      page: NewPasswordRoute.page,
      path: '/new-passwrod',
    ),
  ];
}
