import 'dart:async';

import 'package:foods_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  Timer? _timer;
  final count = 1.obs;

  Response? response;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (count.value == 0) {
          timer.cancel();
          Get.offNamed(Routes.HOME_PAGE);
          //Get.off(() => const HomePageView());
          //Get.off(const HomePageView(), routeName: Routes.SPLASH_PAGE);
        } else {
          count.value--;
        }
      },
    );
  }
}
