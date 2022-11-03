import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final ValueChanged<int> onChangeNumber;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;
  const NoteFormWidget({
    Key key,
    this.number,
    this.title,
    this.description,
    @required this.onChangeNumber,
    @required this.onChangeTitle,
    @required this.onChangeDescription,
  }) : super(key: key);

  Widget buildTitle() {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      style: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: '标题',
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
      ),
      validator: (title) => title != null && title.isEmpty ? '标题不可为空' : null,
      onChanged: onChangeTitle,
    );
  }

  Widget buildDescription() {
    return TextFormField(
      maxLines: 5,
      initialValue: description,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 18,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: '备注',
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
      ),
      onChanged: onChangeDescription,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '优先级',
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: (number ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (number) => onChangeNumber(number.toInt()),
                    ),
                  ),
                ],
              ),
              buildTitle(),
              const SizedBox(
                height: 8,
              ),
              buildDescription(),
              const SizedBox(
                height: 16,
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          )),
    );
  }
}
