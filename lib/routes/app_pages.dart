import 'package:get/get.dart';
import 'package:statifi/app/module/auth/forgot/controllers/forgot_controller.dart';
import 'package:statifi/app/module/auth/forgot/view/forgot_view.dart';
import 'package:statifi/app/module/auth/login/controller/login_controller.dart';
import 'package:statifi/app/module/auth/signup/controller/signup_controller.dart';
import 'package:statifi/app/module/auth/signup/view/signup_view.dart';
import 'package:statifi/app/module/balgo_ai/bindings/balgo_ai_bindings.dart';
import 'package:statifi/app/module/balgo_ai/view/balgo_ai_view.dart';
import 'package:statifi/app/module/charts/binding/charts_binding.dart';
import 'package:statifi/app/module/charts/view/charts_view.dart';
import 'package:statifi/app/module/chats/bindings/chats_bindings.dart';
import 'package:statifi/app/module/chats/view/chats_view.dart';
import 'package:statifi/app/module/community/bindings/community_bindings.dart';
import 'package:statifi/app/module/community/view/community_view.dart';
import 'package:statifi/app/module/home/controller/home_controller.dart';
import 'package:statifi/app/module/home/view/home_view.dart';
import 'package:statifi/app/module/journal/bindings/journal_binding.dart';
import 'package:statifi/app/module/journal/view/journal_view.dart';
import 'package:statifi/app/module/notifications/bindings/notifications_bindings.dart';
import 'package:statifi/app/module/notifications/view/notifications_view.dart';
import 'package:statifi/app/module/overview/bindings/overview_bindings.dart';
import 'package:statifi/app/module/overview/view/overview.dart';
import 'package:statifi/app/module/platforms/bindings/platform_bindings.dart';
import 'package:statifi/app/module/platforms/view/platforms_view.dart';
import 'package:statifi/app/module/subscription_plans/binding/subscription_plan_binding.dart';
import 'package:statifi/app/module/subscription_plans/view/subscription_plan_view.dart';
import 'package:statifi/app/module/trades/bindings/trade_bindings.dart';
import 'package:statifi/app/module/trades/view/trade_view.dart';
import 'package:statifi/app/module/user_profile/binding/user_profile_binding.dart';
import 'package:statifi/app/module/user_profile/view/user_profile_view.dart';
import '../app/module/auth/login/bindings/login_bindings.dart';
import '../app/module/auth/login/view/login_view.dart';
import '../app/module/auth/splash/bindings/splash_bindings.dart';
import '../app/module/auth/splash/controller/splash_controller.dart';
import '../app/module/auth/splash/view/splash_view.dart';
import '../app/module/home/bindings/home_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() => Get.put(SplashController())),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: BindingsBuilder(() => Get.put(LoginController())),
    ),

    GetPage(
      name: AppRoutes.forgot,
      page: () => ForgotView(),
      binding: BindingsBuilder(() => Get.put(ForgotController())),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: BindingsBuilder(() => Get.put(SignupController())),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: AppRoutes.overview,
      page: () => Overview(),
      binding: OverviewBindings(),
    ),
    GetPage(
      name: AppRoutes.chats,
      page: () => ChatsView(),
      binding: ChatsBindings(),
    ),
    GetPage(
      name: AppRoutes.community,
      page: () => CommunityView(),
      binding: CommunityBindings(),
    ),
    GetPage(
      name: AppRoutes.trade,
      page: () => TradeView(),
      binding: TradeBindings(),
    ),
    GetPage(
      name: AppRoutes.platforms,
      page: () => PlatformsView(),
      binding: PlatformBindings(),
    ),
    GetPage(
      name: AppRoutes.userProfile,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.subPlan,
      page: () => SubscriptionPlanView(),
      binding: SubscriptionPlanBinding(),
    ),
    GetPage(
      name: AppRoutes.balgoAi,
      page: () => BalgoAiView(),
      binding: BalgoAiBindings(),
    ),
    GetPage(
      name: AppRoutes.journal,
      page: () => JournalView(),
      binding: JournalBinding(),
    ),
    GetPage(
      name: AppRoutes.charts,
      page: () => ChartsView(),
      binding: ChartsBinding(),
    ),
  ];
}
