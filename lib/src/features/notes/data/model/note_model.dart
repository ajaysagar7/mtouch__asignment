// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// category
// input
// 
class NoteModel {
  final String? id;
  final String title;
  final String category;
  final String dateTime;

  NoteModel({
    this.id,
    required this.title,
    required this.category,
    required this.dateTime,
  });


  NoteModel copyWith({
    String? id,
    String? title,
    String? category,
    String? dateTime,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'category': category,
      'dateTime': dateTime,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      category: map['category'] as String,
      dateTime: map['dateTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, category: $category, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant NoteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.category == category &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      category.hashCode ^
      dateTime.hashCode;
  }
}
