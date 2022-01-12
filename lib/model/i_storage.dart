abstract class IStorage {
  loadData(String uid);
  Future<void> saveData(dynamic data);
}
