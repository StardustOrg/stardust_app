import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HightlightsRepository extends GetxController {
  static HightlightsRepository get instance => Get.put(HightlightsRepository());

  final _db = FirebaseFirestore.instance;
  late final CollectionReference _highlightsCollection;

  HightlightsRepository() {
    _highlightsCollection = _db.collection('highlights');
  }

  List<Map<String, dynamic>> _highlightsListFromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return {
        'photo': data['photo'],
        'active': data['active'],
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getAllHighlights() async {
    var snapshot = await _highlightsCollection.get();
    var highlights = _highlightsListFromSnapshot(snapshot);

    return highlights
        .where((highlight) => highlight['active'] == true)
        .toList();
  }
}
