
import 'package:hive_flutter/hive_flutter.dart';


class HiveFunctions{
  static final userBox=Hive.box(userHiveBox);

  static createUser(Map data){
    userBox.add(data);
  }
  static addUser(List data){
    userBox.addAll(data);
  }
  // Get All data  stored in hive
  static List getAllUsers() {
    final data = userBox.keys.map((key) {
      final value = userBox.get(key);
      return {"key": key, "title": value["title"], "description": value['description']};
    }).toList();

    return data.reversed.toList();
  }
  static Map getUser(int key){
    return userBox.get(key);
  }
  static updateUser(int key,Map data){
    userBox.put(key, data);
  }
  static deleteUser(int key){
    return userBox.delete(key);
  }
  static deleteAllUser(int key){
    return userBox.deleteAll(userBox.keys);
  }


  }

const String userHiveBox="User_Box";