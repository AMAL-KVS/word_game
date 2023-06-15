import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:word_game/view/core/color/colors.dart';
import 'package:word_game/view/home/home_screen.dart';

import '../core/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> scaleAnimation =
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startNavigate();
    });
    return Scaffold(
      backgroundColor: kWhite,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          heightFactor: 4,
          child: ScaleTransition(
            scale: controller,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(kSplashImageAsset))),
            ),
          ),
        ),
        const Spacer(),
        const Text('Powerd By Amal Kvs'),
        khight10
      ]),
    );
  }

  Future<void> startNavigate() async {
    await Future.delayed(const Duration(seconds: 6));
    Get.off(
      () => const HomeScreen(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 600),
    );
  }
}





// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// Future gotohome() async {
//   await Future.delayed(const Duration(seconds: 2));

//   Get.offAll(() => const StateCheckingWidget(),
//       transition: Transition.circularReveal,
//       duration: const Duration(seconds: 1));
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController controller = AnimationController(
//     vsync: this,
//     duration: const Duration(seconds: 2),
//   )..repeat(reverse: true);

//   late final Animation<double> scaleAnimation = CurvedAnimation(
//     parent: controller,
//     curve: Curves.fastOutSlowIn,
//   );
//   @override
//   // void initState() {
//   //   super.initState();
//   //   navigateToOnboarding();
//   // }

//   // navigateToOnboarding() async {
//   //   await Future.delayed(const Duration(seconds: 3), () {});
//   //   if (mounted) {
//   //     Get.to(() => const OnboardingScreen());
//   //   }
//   // }

//   @override
//   dispose() {
//     controller.dispose(); // you need this
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       gotohome();
//     });
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 250, 250, 250),
//               Color.fromARGB(255, 106, 61, 251),
//               Color.fromARGB(255, 12, 3, 42)
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ScaleTransition(
//               scale: controller,
//               child: ClipOval(
//                 child: SizedBox.fromSize(
//                   size: const Size.fromRadius(75), // Image radius
//                   child:
//                       Image.asset('assets/chatapp icon.jpg', fit: BoxFit.cover),
//                 ),
//               ),
//             ),
//             kHeight10,
//             Text(
//               "CHATTER",
//               style: TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//                 color: textWhite.withBlue(10),
//               ),
//             ),
//           ],
//         ),
//    ),
// );
// }
// }