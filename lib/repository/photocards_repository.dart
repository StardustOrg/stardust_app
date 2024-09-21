import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/models/photocard.dart';

class PhotocardsRepository extends GetxController {
  static PhotocardsRepository get instance => Get.put(PhotocardsRepository());
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _photocardsCollection;

  PhotocardsRepository() {
    _photocardsCollection = _db.collection('photocards');
  }

  /// Artists from snapshot
  List<Photocard> _photocardsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return Photocard(
        id: doc.id,
        pcName: data['name'],
        description: data['description'],
        imageUrl: data['image_url'],
        artistName: data['artist_name'],
        artistId: data['artist_id'],
        dt1: data['dt1'],
        dt2: data['dt2'],
        memberName: data['member_name'],
        memberId: data['member_id'],
        price: data['price'],
        quantity: data['quantity'],
        storeId: data['store_id'],
        storeName: data['store_name'],
        original: data['original'],
      );
    }).toList();
  }

  Future<List<Photocard>> getAllPhotocards({int? limit}) async {
    Query<Object?> query = _photocardsCollection;
    if (limit != null) {
      query = query.limit(limit);
    }
    var snapshot = await query.get();
    return _photocardsListFromSnapshot(snapshot);
  }

  Future<List<Photocard>> getPhotocardsByArtist(String artistId,
      {int? limit}) async {
    var query = _photocardsCollection.where('artist_id', isEqualTo: artistId);
    if (limit != null) {
      query = query.limit(limit);
    }
    var snapshot = await query.get();
    return _photocardsListFromSnapshot(snapshot);
  }

  Future<List<Photocard>> getPhotocardsByMember(String memberId,
      {int? limit}) async {
    var query = _photocardsCollection.where('member_id', isEqualTo: memberId);
    if (limit != null) {
      query = query.limit(limit);
    }
    var snapshot = await query.get();
    return _photocardsListFromSnapshot(snapshot);
  }

  Future<List<Photocard>> getPhotocardsByArtistAndMember(
      String artistId, String memberId,
      {int? limit}) async {
    var query = _photocardsCollection
        .where('artist_id', isEqualTo: artistId)
        .where('member_id', isEqualTo: memberId);
    if (limit != null) {
      query = query.limit(limit);
    }
    var snapshot = await query.get();
    return _photocardsListFromSnapshot(snapshot);
  }

  Future<List<Photocard>> getPhotocardByStore(String storeId,
      {int? limit}) async {
    var query = _photocardsCollection.where('store_id', isEqualTo: storeId);
    if (limit != null) {
      query = query.limit(limit);
    }
    var snapshot = await query.get();
    return _photocardsListFromSnapshot(snapshot);
  }

  Future<Photocard> getPhotocardById(String id) async {
    var snapshot = await _photocardsCollection.doc(id).get();
    var data = snapshot.data() as Map<String, dynamic>;
    return Photocard(
      id: snapshot.id,
      pcName: data['name'],
      description: data['description'],
      imageUrl: data['image_url'],
      artistName: data['artist_name'],
      artistId: data['artist_id'],
      dt1: data['dt1'],
      dt2: data['dt2'],
      memberName: data['member_name'],
      memberId: data['member_id'],
      price: data['price'],
      quantity: data['quantity'],
      storeId: data['store_id'],
      storeName: data['store_name'],
      original: data['original'],
    );
  }
}
