sed -i '1s/^/import '"'"'package:perfect_volume_control\/perfect_volume_control.dart'"'"';\n/' lib/ui/screens/video_screen/video_screen.dart

sed -i '/void initState() {/a \
    sharedStorage.getBool("media_volume_warning").then((warn) async {\n      if (warn == true) {\n        try {\n          double vol = await PerfectVolumeControl.getVolume();\n          if (vol > 0.7 && mounted) {\n            showToast("Warning: Media volume is high", context);\n          }\n        } catch (e) {\n          logger.w("Could not get device volume: $e");\n        }\n      }\n    });' lib/ui/screens/video_screen/video_screen.dart
