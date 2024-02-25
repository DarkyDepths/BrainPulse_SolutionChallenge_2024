// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  // final String id;
  final String text;
  final DateTime timestamp;
  final bool isSentByUser;
  Message({
    // required this.id,
    required this.text,
    required this.timestamp,
    required this.isSentByUser,
  });





  Message copyWith({
    String? id,
    String? text,
    DateTime? timestamp,
    bool? isSentByUser,
  }) {
    return Message(
      // id: id ?? this.id,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
      isSentByUser: isSentByUser ?? this.isSentByUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'text': text,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'isSentByUser': isSentByUser,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      // id: map['id'] as String,
      text: map['text'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
      isSentByUser: map['isSentByUser'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message( text: $text, timestamp: $timestamp, isSentByUser: $isSentByUser)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;
  
    return 
      // other.id == id &&
      other.text == text &&
      other.timestamp == timestamp &&
      other.isSentByUser == isSentByUser;
  }

  @override
  int get hashCode {
    return 
    // id.hashCode ^
      text.hashCode ^
      timestamp.hashCode ^
      isSentByUser.hashCode;
  }
}
