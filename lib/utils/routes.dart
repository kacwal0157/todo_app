import 'package:get/get.dart';
import 'package:todo_app/features/pages/create_note_page.dart';
import 'package:todo_app/features/pages/main_page.dart';
import 'package:todo_app/features/pages/splash_screen_page.dart';

class Routes {
  static String home = '/';
  static String mainPage = '/main';
  static String createNotePage = '/create_note';

  static String getHomeRoute() => home;
  static String getMainPageRoute() => mainPage;
  static String getCreateNotePageRoute() => createNotePage;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: mainPage,
      page: () => const MainPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: createNotePage,
      page: () => const CreateNotePage(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
