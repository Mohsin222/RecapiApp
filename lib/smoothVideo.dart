import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp2/controller/VideoController.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoController videoController = Get.put(VideoController());

    return Scaffold(
      appBar: AppBar(title: const Text('Smooth TikTok-like Video Player')),
      body: Obx(() {
        return videoController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: videoController.controllers.length,
                onPageChanged: videoController.onPageChanged,
                itemBuilder: (context, index) {
                  final playerController = videoController.controllers[index];
                  if (playerController != null) {
                    return BetterPlayer(controller: playerController);
                  } else {
                    // Placeholder while waiting for video to load
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
      }),
    );
  }
}
