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
    /// Авторизация
    AdaptiveRoute(
      page: AuthRouterRoute.page,
      path: '/auth',
      children: [
        /// Экран "Регистрация"
        AdaptiveRoute(
          page: SignUpRoute.page,
          initial: true,
          path: '',
        ),

        /// Экран "Верификация"
        AdaptiveRoute(
          page: AuthCodeRoute.page,
          path: 'auth-code',
        ),

        /// Экран "Авторизация"
        AdaptiveRoute(
          page: LogInRoute.page,
          path: 'log-in',
        ),

        /// Экран "Забыли пароль"
        AdaptiveRoute(
          page: ForgotPasswordRoute.page,
          path: 'forgot-password',
        ),

        /// Экран "Новый пароль"
        AdaptiveRoute(
          page: NewPasswordRoute.page,
          path: 'new-passwrod',
        ),
      ],
    ),

    /// Главный экран
    AdaptiveRoute(
      page: RootRouterRoute.page,
      path: '/',
      children: [
        /// Главный экран с табами
        AdaptiveRoute(
          page: RootTabRoute.page,
          path: '',
          children: [
            /// Экран "Главная"
            AdaptiveRoute(
              initial: true,
              page: HomeTab.page,
              path: 'home-tab',
            ),

            /// Экран "Кошелек"
            AdaptiveRoute(
              page: WalletTab.page,
              path: 'wallet-tab',
            ),

            /// Экран "Отслеживание"
            AdaptiveRoute(
              page: TrackTab.page,
              path: 'track-tab',
            ),

            /// Экран "Профиль"
            AdaptiveRoute(
              page: ProfileTab.page,
              path: 'profile-tab',
            ),
          ],
        ),

        /// Экран "Уведомления"
        AdaptiveRoute(
          page: NotificationRoute.page,
          path: 'notification',
        ),

        /// Экран "Добавить способ оплаты"
        AdaptiveRoute(
          page: AddPaymentMethodRoute.page,
          path: 'add-payment-method',
        ),
      ],
    ),
  ];
}
