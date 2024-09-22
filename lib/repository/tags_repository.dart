import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/models/star_tag.dart';

class TagsRepository extends GetxController {
  static TagsRepository get instance => Get.put(TagsRepository());
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _tagsCollection;

  TagsRepository() {
    _tagsCollection = _db.collection('tags');
  }

  /// Tags from snapshot
  List<Tag> _tagsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return Tag(
        id: doc.id,
        label: data['label'],
        cover: data['cover'],
      );
    }).toList();
  }

  /// Get all tags stream
  Stream<List<Tag>> get tags {
    return _tagsCollection.snapshots().map(_tagsListFromSnapshot);
  }

  /// Get all tags once
  Future<List<Tag>> getTags() async {
    var snapshot = await _tagsCollection.get();
    return _tagsListFromSnapshot(snapshot);
  }

  /// Create a tag from a snapshot
  Tag _tagFromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Tag(
      id: snapshot.id,
      label: data['label'],
      cover: data['cover'],
    );
  }

  /// Get tag by ID with real-time updates
  Stream<Tag> getTag(String id) {
    return _tagsCollection.doc(id).snapshots().map(_tagFromSnapshot);
  }

  /// Get tag by ID once
  Future<Tag> getTagById(String id) async {
    var snapshot = await _tagsCollection.doc(id).get();
    return _tagFromSnapshot(snapshot);
  }
}
