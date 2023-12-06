import 'package:flutter/material.dart';

import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

ZegoLiveStreamingPKBattleV2Config pkConfig() {
  return ZegoLiveStreamingPKBattleV2Config(
      // mixerLayout: PKGridLayout(),
      // pKBattleViewTopPadding: 100,
      // hostReconnectingBuilder: (
      //   BuildContext context,
      //   ZegoUIKitUser? host,
      //   Map<String, dynamic> extraInfo,
      // ) {
      //   return const CircularProgressIndicator(
      //     backgroundColor: Colors.red,
      //     color: Colors.purple,
      //   );
      // },
      // pkBattleViewForegroundBuilder: (
      //   BuildContext context,
      //   List<ZegoUIKitUser?> hosts,
      //   Map<String, dynamic> extraInfo,
      // ) {
      //   return Positioned(
      //     bottom: 80,
      //     left: 0,
      //     right: 0,
      //     child: Container(
      //       color: Colors.red,
      //       child: const Center(
      //         child: Text('pkBattleViewForegroundBuilder'),
      //       ),
      //     ),
      //   );
      // },
      // pkBattleViewTopBuilder: (
      //   BuildContext context,
      //   List<ZegoUIKitUser?> hosts,
      //   Map<String, dynamic> extraInfo,
      // ) {
      //   return Container(
      //     color: Colors.red,
      //     child: const Center(
      //       child: Text('pkBattleViewTopBuilder'),
      //     ),
      //   );
      // },
      // pkBattleViewBottomBuilder: (
      //   BuildContext context,
      //   List<ZegoUIKitUser?> hosts,
      //   Map<String, dynamic> extraInfo,
      // ) {
      //   return Container(
      //     color: Colors.red,
      //     child: const Center(
      //       child: Text('pkBattleViewBottomBuilder'),
      //     ),
      //   );
      // },
      );
}

/// two:
/// ┌───┬────┐
/// │😄 │ 😄 │
/// └───┴────┘
/// four:
/// ┌───┬───┐
/// │😄 │😄 │
/// ├───┼───┤
/// │😄 │   │
/// └───┴───┘
/// nine:
/// ┌───┬───┬───┐
/// │😄 │😄 │😄 │
/// ├───┼───┼───┤
/// │😄 │😄 │😄 │
/// ├───┼───┼───┤
/// │😄 │😄 │   │
/// └───┴───┴───┘
class PKGridLayout extends ZegoPKV2MixerLayout {
  @override
  Size getResolution() => const Size(1080, 960);

  @override
  List<Rect> getRectList(
    int hostCount, {
    double scale = 1.0,
  }) {
    final resolution = getResolution();
    final rowCount = getRowCount(hostCount);
    final columnCount = getColumnCount(hostCount);
    final itemWidth = resolution.width / columnCount;
    final itemHeight = resolution.height / rowCount;

    final rectList = <Rect>[];
    var hostRowIndex = 0;
    var hostColumnIndex = 0;
    for (var hostIndex = 0; hostIndex < hostCount; ++hostIndex) {
      if (hostColumnIndex == columnCount) {
        hostColumnIndex = 0;
        hostRowIndex++;
      }

      rectList.add(
        Rect.fromLTWH(
          itemWidth * hostColumnIndex * scale,
          itemHeight * hostRowIndex * scale,
          itemWidth * scale,
          itemHeight * scale,
        ),
      );

      ++hostColumnIndex;
    }

    return rectList;
  }

  int getRowCount(int hostCount) {
    if (hostCount > 6) {
      return 3;
    }
    if (hostCount > 2) {
      return 2;
    }
    return 1;
  }

  int getColumnCount(int hostCount) {
    if (hostCount > 4) {
      return 3;
    }
    return 2;
  }
}
