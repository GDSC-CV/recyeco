import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreLinks {
  final String title;
  final String url;

  FirestoreLinks({required this.title, required this.url});

  factory FirestoreLinks.fromFirestore(Map<String, dynamic> data) {
    return FirestoreLinks(
      title: data['title'],
      url: data['url'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'url': url,
    };
  }
}
