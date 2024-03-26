import 'dart:typed_data';

import 'package:flutter_rust/generated/bridge_generated.dart';
import 'package:flutter_rust/generated/rust.dart';

class FlutterBluetoothWindows {

  const FlutterBluetoothWindows._();

 static Stream<BluetoothDevice> bluetoothStartScan({
    required Duration timeoutOnSeconds,
  }) {
    return RustLib.instance
        .bluetoothStartScan(timeoutSec: timeoutOnSeconds)
        .asyncMap<BluetoothDevice>((event) async {
      return event;
    });
  }


  static Future<String> connect({
    required BluetoothDevice device,
  }) async {
    final channel = MethodChannel(
      command: 'connect',
      device: device,
    );
    return await RustLib.instance.invokeMethod(channel: channel);
  }


  static Future<bool> disconnectBluetoothDevice({required String serviceUuid}) async {
    return await RustLib.instance.disconnectBluetoothDevice(
      serviceUuid: serviceUuid,
    );
  }


  static Future<bool> getBluetoothAdapterState() async {
    return await RustLib.instance.getBluetoothAdapterState();
  }


  static Future<void> stopScan() async {
    return await RustLib.instance.bluetoothStopScan();
  }


  static Future<String> writeBytes({
    required BluetoothDevice device,
    required Uint8List bytes,
  }) async{
     final channel = MethodChannel(
      command: 'write_bytes',
      device: device,
      bytes: bytes,
    );
    return await RustLib.instance.invokeMethod(channel: channel);
  }
}
