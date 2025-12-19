import 'package:get/get.dart';

import '../../../../data/models/strategy_model.dart';

class JournalController extends GetxController {
  var notes = <NoteModel>[].obs;
  var showRecommendations = false.obs;

  void addNote(String title, String content) {
    final newNote = NoteModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    notes.insert(0, newNote);
  }

  void deleteNote(String id) {
    notes.removeWhere((note) => note.id == id);
  }

  void showRecommendedStrategies() {
    showRecommendations.value = true;
  }

  void hideRecommendedStrategies() {
    showRecommendations.value = false;
  }

  String formatDateTime(DateTime dateTime) {
    return '${_formatDate(dateTime)} | ${_formatTime(dateTime)}';
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}
