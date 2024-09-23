import 'dart:math';

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
        tags: (data['tags'] as List<dynamic>)
            .map((tag) => tag as Map<String, dynamic>)
            .toList(),
      );
    }).toList();
  }

  Future<List<Photocard>> getAllPhotocards({int? limit}) async {
    Query<Object?> query = _photocardsCollection;
    if (limit != null) {
      query = query.limit(limit);
    }
    var snapshot = await query.get();
    List<Photocard> photocards = _photocardsListFromSnapshot(snapshot);

    // Shuffle the list of photocards
    photocards.shuffle(Random());

    return photocards;
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
      tags: (data['tags'] as List<dynamic>)
          .map((tag) => tag as Map<String, dynamic>)
          .toList(),
    );
  }

  Future<List<Photocard>> getLowStockPhotocards({int? limit}) async {
    var query = _photocardsCollection.where('quantity', isLessThan: 4);
    if (limit != null) {
      query = query.limit(limit);
    }
    var snapshot = await query.get();
    return _photocardsListFromSnapshot(snapshot);
  }

  Future<List<Photocard>> getPhotocardsByIds(List<String> ids) async {
    // Create a list to hold the fetched photocards
    List<Photocard> photocards = [];

    // Fetch each document by ID
    for (String id in ids) {
      var snapshot = await _photocardsCollection.doc(id).get();
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        photocards.add(Photocard(
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
          tags: (data['tags'] as List<dynamic>)
              .map((tag) => tag as Map<String, dynamic>)
              .toList(),
        ));
      }
    }

    return photocards;
  }

  Future<List<Photocard>> getPhotocardsByTag(String tagId) async {
    // Query where 'tag_ids' contains the specified tagId
    var query = _photocardsCollection.where('tags_id', arrayContains: tagId);

    // Execute the query and get the snapshot
    var snapshot = await query.get();

    // Convert the snapshot to a list of Photocard objects
    return _photocardsListFromSnapshot(snapshot);
  }
}
