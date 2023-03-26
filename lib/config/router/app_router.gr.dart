// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    WineListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const WineList(),
      );
    },
    WineDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<WineDetailsViewRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: WineDetailsView(
          key: args.key,
          wine: args.wine,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          LoginViewRoute.name,
          path: '/',
        ),
        RouteConfig(
          WineListRoute.name,
          path: '/wine-list',
        ),
        RouteConfig(
          WineDetailsViewRoute.name,
          path: '/wine-details-view',
        ),
      ];
}

/// generated route for
/// [LoginView]
class LoginViewRoute extends PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/',
        );

  static const String name = 'LoginViewRoute';
}

/// generated route for
/// [WineList]
class WineListRoute extends PageRouteInfo<void> {
  const WineListRoute()
      : super(
          WineListRoute.name,
          path: '/wine-list',
        );

  static const String name = 'WineListRoute';
}

/// generated route for
/// [WineDetailsView]
class WineDetailsViewRoute extends PageRouteInfo<WineDetailsViewRouteArgs> {
  WineDetailsViewRoute({
    Key? key,
    required Wine wine,
  }) : super(
          WineDetailsViewRoute.name,
          path: '/wine-details-view',
          args: WineDetailsViewRouteArgs(
            key: key,
            wine: wine,
          ),
        );

  static const String name = 'WineDetailsViewRoute';
}

class WineDetailsViewRouteArgs {
  const WineDetailsViewRouteArgs({
    this.key,
    required this.wine,
  });

  final Key? key;

  final Wine wine;

  @override
  String toString() {
    return 'WineDetailsViewRouteArgs{key: $key, wine: $wine}';
  }
}
