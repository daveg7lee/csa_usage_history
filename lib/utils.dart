String getCurrentTime() {
  final now = DateTime.now();
  return now.hour.toString() + ":" + now.minute.toString();
}
