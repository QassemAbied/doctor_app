import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class VoiceMessageWidget extends StatefulWidget {
  final String audioUrl;

  const VoiceMessageWidget({super.key, required this.audioUrl});

  @override
  State<VoiceMessageWidget> createState() => _VoiceMessageWidgetState();
}

class _VoiceMessageWidgetState extends State<VoiceMessageWidget> {
  final AudioPlayer player = AudioPlayer();

  bool playing = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  Future<void> play() async {
    try {
      if (playing) {
        await player.pause();

        setState(() {
          playing = false;
        });

        return;
      }

      if (duration == Duration.zero) {
        await player.setUrl(widget.audioUrl);
      }

      await player.play();

      setState(() {
        playing = true;
      });
    } catch (e) {
      debugPrint('Audio Error => $e');
    }
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.audioUrl);
    final progress = duration.inMilliseconds == 0
        ? 0.0
        : position.inMilliseconds / duration.inMilliseconds;

    return Container(
      width: 230,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: play,
            icon: Icon(
              playing ? Icons.pause_circle_filled : Icons.play_circle_fill,
              size: 32,
            ),
          ),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: progress.clamp(0, 1),
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(20),
                ),

                const SizedBox(height: 6),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    playing
                        ? formatDuration(position)
                        : formatDuration(duration),
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
