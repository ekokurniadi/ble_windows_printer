import 'package:flutter_rust/generated/bridge_generated.dart';
import 'package:flutter_rust/generated/rust.dart';

class FlutterRustPlugin {
  Future<WindowsOSInfo> getPlatformVersion() async {
    final info = await RustLib.instance.getWindowsInfo();
    return info;
  }

  Future<LocalIP> findMyLocalIp() async {
    final result = await RustLib.instance.findMyLocalIp();
    return result;
  }

  Future<void> initLogger() async {
    await RustLib.instance.init();
  }

  Future<CameraScanner> scannerProcessImage({
    required String imagePath,
  }) async {
    return await RustLib.instance.scannerProcessImage(
      imagePath: imagePath,
    );
  }

  Future<void> moveCursor({required int x,required int y})async{
      await RustLib.instance.mouseCursor(x:x,y:y);
  }
}
