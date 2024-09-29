import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class secondVideoPage extends StatelessWidget {
  const secondVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoController videoController = Get.put(VideoController());

    return Scaffold(
      appBar: AppBar(title: const Text('Smooth Video Player')),
      body: Obx(() {
        return videoController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: videoController.videoUrls.length,
                onPageChanged: videoController.onPageChanged,
                itemBuilder: (context, index) {
                  if (videoController.controllers[index] != null) {
                    return BetterPlayer(
                      controller: videoController.controllers[index]!,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
      }),
    );
  }
}

class VideoController extends GetxController {
  RxList<BetterPlayerController?> controllers = <BetterPlayerController?>[].obs;
  RxInt currentVideoIndex = 0.obs;
  RxBool isLoading = true.obs;

  List<String> videoUrls = [
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  ];

  @override
  void onInit() {
    super.onInit();
    initializeControllers();
  }

  Future<void> initializeControllers() async {
    // Initialize the first 2 videos for smoother start
    for (int i = 0; i < 2 && i < videoUrls.length; i++) {
      BetterPlayerController controller = await createController(videoUrls[i]);
      controllers.add(controller);

      await controller.setupDataSource(
        BetterPlayerDataSource(
            BetterPlayerDataSourceType.network, videoUrls[i]),
      );

      // Play the first video immediately
      if (i == 0) {
        controller.play();
      }
    }
    isLoading.value = false;
  }

  Future<BetterPlayerController> createController(String videoPath) async {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      autoPlay: false,
      looping: true,
      aspectRatio: 9 / 16,
    );
    return BetterPlayerController(betterPlayerConfiguration);
  }

  void onPageChanged(int index) {
    // Ensure the index is within the range of loaded controllers
    if (index >= controllers.length) return;

    // Pause all other videos except the current one
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i] != null) {
        if (i == index) {
          controllers[i]?.play();
        } else {
          controllers[i]?.pause();
        }
      }
    }

    currentVideoIndex.value = index;

    // Prefetch the next and previous videos for smooth playback
    if (index + 1 < videoUrls.length) {
      _prefetchVideo(index + 1);
    }
    if (index - 1 >= 0) {
      _prefetchVideo(index - 1);
    }

    // Dispose of videos that are too far from the current index to save memory
    if (index - 3 >= 0) {
      _disposeVideo(index - 3); // dispose videos that are too far behind
    }
    if (index + 3 < videoUrls.length) {
      _disposeVideo(index + 3); // dispose videos that are too far ahead
    }
  }

  Future<void> _prefetchVideo(int index) async {
    if (index >= controllers.length) {
      // Expand the controllers list to the correct size
      controllers.add(null);
    }

    if (controllers[index] == null) {
      BetterPlayerController controller =
          await createController(videoUrls[index]);
      controllers[index] = controller;

      await controller.setupDataSource(
        BetterPlayerDataSource(
            BetterPlayerDataSourceType.network, videoUrls[index]),
      );
    }
  }

  void _disposeVideo(int index) {
    // Ensure the index exists before disposing
    if (index < controllers.length && controllers[index] != null) {
      controllers[index]?.dispose();
      controllers[index] = null;
    }
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.onClose();
  }
}
