import 'package:shared_preferences/shared_preferences.dart';
import 'package:simex_app/app/core/interfaces/shared_local_storage_interface.dart';

class SharedLocalStorageService implements ISharedLocalStorage {

  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put(String key, value) async {
    var shared = await SharedPreferences.getInstance();
    
    if (value is bool){
      shared.setBool(key, value);
    } else if (value is String){
      shared.setString(key, value);
    } else if (value is int){
      shared.setInt(key, value);
    }
    
  }

}