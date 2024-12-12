import "package:sample_app/data/datasources/secure_storage_impl.dart";

class PinUsecases {
  final SecureStorage repository = SecureStorage();

  Future<String?> getPin() async => await repository.getSecureData("pin");

  Future<void> storePin(String pin) async {
    if (pin.isNotEmpty) {
      await repository.saveSecureData("pin", pin);
    }
  }
}
