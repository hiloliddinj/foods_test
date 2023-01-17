import 'dart:async';

import 'package:foods_test/app/modules/home_page/views/home_page_view.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  Timer? _timer;
  final count = 5.obs;

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
          Get.off(() => const HomePageView());
        } else {
          count.value--;
        }
      },
    );
  }
}
