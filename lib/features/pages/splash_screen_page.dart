import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant_images.dart';
import 'package:todo_app/constants/constant_texts.dart';
import 'package:todo_app/constants/constant_variables.dart';
import 'package:get/get.dart';
import 'package:todo_app/features/services/note_service.dart';
import 'package:todo_app/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            top: animate ? -10 : -40,
            left: animate ? -10 : -40,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            top: 100,
            left: animate ? 50 : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: defaultSize - 10,
                  ),
                  Text(
                    splashAppTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            bottom: animate ? 200 : 100,
            left: 15,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: Image(
                image: const AssetImage(welcomeSplashImage),
                height: size.height * 0.44,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() => animate = true);
    await loadNotes();

    await Future.delayed(const Duration(milliseconds: 3000)).then(
      (value) => Get.toNamed(Routes.getMainPageRoute()),
    );
  }
}
