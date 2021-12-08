abstract class Database {

  Future<void> savePassword(String password);
  Future<String?> getPassword();
}