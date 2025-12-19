// import 'package:flutter/material.dart';
//
// import '../../app/module/journal/view/widgets/add_strategy_sheet.dart';
// import '../../app/module/journal/view/widgets/recent_notes.dart';
// import '../models/strategy_model.dart';
//
// class StrategyNoteHelper {
//   static void strategyNoteSheet({
//     required BuildContext context,
//     required GlobalKey<RecentNotesState> recentNotesKey,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => AddStrategySheet(
//         title: 'Add Strategy Notes',
//         subtitle: 'Please enter the correct information to add strategy notes.',
//         onSave: (noteTitle, noteText) {
//           // Add the note to RecentNotes
//           recentNotesKey.currentState?.addNote(
//             StrategyNote(
//               title: noteTitle,
//               subtitle: noteText,
//               dateTime: DateTime.now(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
