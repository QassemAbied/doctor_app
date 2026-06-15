import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:path_provider/path_provider.dart';

class VoiceRecorderService {
  final RecorderController recorderController = RecorderController();

  String? recordedPath;

  Future<void> start() async {
    final dir = await getTemporaryDirectory();

    recordedPath =
        '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await recorderController.record(path: recordedPath!);
  }

  Future<String?> stop() async {
    return await recorderController.stop();
  }

  void dispose() {
    recorderController.dispose();
  }
}
