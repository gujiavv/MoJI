import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_ripple/model/note.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100,
];

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key key,
    this.note,
    this.index = 0,
  }) : super(key: key);
  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);
    var text = '';
    var numberColor = Colors.white;
    if (note.number == 1) {
      text = '重要且紧急';
      numberColor = Colors.redAccent;
    } else if (note.number == 2) {
      text = '重要不紧急';
      numberColor = Colors.orangeAccent;
    } else if (note.number == 3) {
      text = '不重要紧急';
      numberColor = Colors.yellowAccent;
    } else if (note.number == 4) {
      text = '不重要不紧急';
      numberColor = Colors.blueAccent;
    }
    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(
          minHeight: minHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  time,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    color: numberColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              note.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  /// To return different heightfor different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
