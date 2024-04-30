import 'package:ecommerce_app/model/gadget_detail.dart';
import 'package:ecommerce_app/router/router_name.dart';
import 'package:ecommerce_app/screen/bottom_navigation_tab.dart';
import 'package:ecommerce_app/screen/detail_page/details.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(routes: [
    GoRoute(
        path: '/', builder: (context, state) => const BottomNavigationTab()),
    GoRoute(
      path: AppRouterName.detailPage,
      builder: (context, state) {
        GadgetDetail data = state.extra as GadgetDetail;
        return ProductDetailsPage(
          gadgetDetail: data,
        );
      },
    ),
  ]);
}
