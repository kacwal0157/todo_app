class SplashScreenService
{
  bool animate = false;

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate = true;
    /*await Future.delayed(const Duration(milliseconds: 5000)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      ),
    );*/
  }
}