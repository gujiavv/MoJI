import 'package:flutter/material.dart';

const String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [id, number, title, description, time];
  static const String id = '_id';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Note {
  final int id;
  final int number; //优先级
  final String title; //标题
  final String description; //备注
  final DateTime createdTime; //时间
  const Note({
    this.id,
    @required this.number,
    @required this.title,
    @required this.description,
    @required this.createdTime,
  });

  Note copy({
    int id,
    int number,
    String title,
    String description,
    DateTime createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object> json) => Note(
        id: json[NoteFields.id] as int,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object> toJson() => {
        NoteFields.id: id,
        NoteFields.number: number,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
