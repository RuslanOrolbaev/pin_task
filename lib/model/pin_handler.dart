abstract class IPinHandler {
  void processPIN(String keyCode) {}
}

class PinHandler implements IPinHandler {
  @override
  void processPIN(String keyCode) {}
}
