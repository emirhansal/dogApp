import 'package:auto_route/auto_route.dart';

class RouteDestination {
  final PageRouteInfo route;
  final String iconSvgPath;
  final String label;

  const RouteDestination({
    required this.route,
    required this.iconSvgPath,
    required this.label,
  });
}