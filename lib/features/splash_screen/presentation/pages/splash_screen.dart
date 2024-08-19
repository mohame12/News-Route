import 'package:flutter/material.dart';
import 'package:news_app_route1/core/themes/my_styles.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';
import 'package:news_app_route1/features/details_Features/presentation/pages/details_features.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'SplahScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    animatedController();
    timeOut();
  }

  void animatedController() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    slidingAnimation = Tween<Offset>(end: Offset.zero, begin:  const Offset(1, 0))
        .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyAssets.scaffoldBackground),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Image(image: AssetImage(MyAssets.splashLogo)),
              AnimatedBuilder(
                  animation: slidingAnimation,
                  builder: (context, _) {
                    return SlideTransition(
                        position: slidingAnimation,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('See Our News!',style: MyStyles.font22BlackWeight700Poppins,)));
                  })
            ],
          ),
        ),
      ),
    );
  }

  void timeOut() {
    Future.delayed(const Duration(seconds: 3), () {
      return Navigator.pushReplacementNamed(context, DetailsScreen.id);
    });
  }
}
