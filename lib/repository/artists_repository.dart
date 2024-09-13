import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/models/artist.dart';

class ArtistsRepository extends GetxController {
  static ArtistsRepository get instance => Get.put(ArtistsRepository());
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _artists_collection;

  ArtistsRepository() {
    _artists_collection = _db.collection('artists');
  }

  /// Artists from snapshot
  List<Artist> _artistsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return Artist(
        id: doc.id,
        name: data['name'],
        icon: data['icon'],
        cover: data['cover'],
      );
    }).toList();
  }

  /// Get all artists stream
  Stream<List<Artist>> get artists {
    return _artists_collection.snapshots().map(_artistsListFromSnapshot);
  }

  Future<List<Artist>> getArtists() async {
    var snapshot = await _artists_collection.get();
    return _artistsListFromSnapshot(snapshot);
  }

  /// Fetch members subcollection for an artist
  Future<List<Artist>> _fetchMembers(String artistId) async {
    var membersCollection =
        await _artists_collection.doc(artistId).collection('members').get();

    return membersCollection.docs
        .map((doc) => _artistFromSnapshot(doc))
        .toList();
  }

  /// Create an artist from snapshot including members
  Artist _artistFromSnapshot(DocumentSnapshot snapshot,
      [List<Artist>? members]) {
    var data = snapshot.data() as Map<String, dynamic>;

    return Artist(
      id: snapshot.id,
      name: data['name'],
      icon: data['icon'],
      cover: data['cover'],
      members: members ?? [], // Include members if provided
    );
  }

  /// Get artist by ID with real-time updates including members
  Stream<Artist> getArtist(String id) {
    return _artists_collection.doc(id).snapshots().asyncMap((snapshot) async {
      var members = await _fetchMembers(id);
      return _artistFromSnapshot(snapshot, members);
    });
  }

  /// Get artist by ID once including members
  Future<Artist> getArtistById(String id) async {
    var snapshot = await _artists_collection.doc(id).get();
    var members = await _fetchMembers(id);
    return _artistFromSnapshot(snapshot, members);
  }
}
