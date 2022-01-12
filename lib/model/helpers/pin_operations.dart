import 'package:pin_task/model/i_buffer.dart';
import 'package:pin_task/model/i_pin.dart';
import 'package:pin_task/model/i_storage.dart';
import 'package:collection/collection.dart';
import 'package:pin_task/constants.dart' as constants;

class PinOperations {
  static receivePinFromKeyCodes(
      {required String keyCode,
      required IPin pin,
      required Function onPinReceivingComplete,
      IBufferController? bufferToUpdate}) async {
    if (keyCode == constants.backspaceKeyCode) {
      pin.removeLast();
    } else {
      pin.addToPin(keyCode);
    }
    if (bufferToUpdate != null) {
      bufferToUpdate.update(pin.length);
    }
    if (pin.length == constants.pinLength) {
      onPinReceivingComplete();
    }
  }

  static bool receivedPinIsEqualToStoredPin(
      List<String> receivedPin, List<String> storedPin) {
    if (receivedPin.equals(storedPin)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<String>?> loadPin(
      IStorage localStorage, String pinUid) async {
    try {
      List<String>? storedPin = await localStorage.loadData(pinUid);
      return Future.value(storedPin);
    } catch (e, s) {
      return Future.error(e, s);
    }
  }

  static Future<void> savePin(
      List<String> pin, String pinUid, IStorage localStorage) async {
    await localStorage.saveData(pin, pinUid);
  }
}
