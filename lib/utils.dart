import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String getCurrentTime() {
  final now = DateTime.now();
  return now.hour.toString() + ":" + now.minute.toString();
}

Future<bool> insertData(name, supervisor, purpose, startTime) async {
  final prefs = await SharedPreferences.getInstance();

  final res = await Supabase.instance.client.from("history").insert([
    {
      "name": name,
      "pc_number": int.parse(prefs.getString("pc_num") ?? "1"),
      "supervisor": supervisor,
      "purpose": purpose,
      "start_time": startTime,
      "end_time": getCurrentTime(),
    }
  ]).execute();
  if (res.error != null) {
    return false;
  }
  return true;
}
