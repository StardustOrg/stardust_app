import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/models/artist.dart';

class ArtistsRepository extends GetxController {
  static ArtistsRepository get instance => Get.put(ArtistsRepository());
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _artistsCollection;

  ArtistsRepository() {
    _artistsCollection = _db.collection('artists');
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
        groupId: data['group_id'],
      );
    }).toList();
  }

  /// Get all artists stream
  Stream<List<Artist>> get artists {
    return _artistsCollection.snapshots().map(_artistsListFromSnapshot);
  }

  Future<List<Artist>> getArtists() async {
    var snapshot = await _artistsCollection.get();
    return _artistsListFromSnapshot(snapshot);
  }

  Future<List<Artist>> getSoloAndGroups() async {
    var snapshot =
        await _artistsCollection.where('active', isEqualTo: true).get();

    var artists = _artistsListFromSnapshot(snapshot);

    return artists.where((artist) => artist.groupId == null).toList();
  }

  /// Fetch members based on the groupId (members have the groupId of the group artist)
  Future<List<Artist>> _fetchMembers(String groupId) async {
    var snapshot =
        await _artistsCollection.where('group_id', isEqualTo: groupId).get();

    return _artistsListFromSnapshot(snapshot);
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
    return _artistsCollection.doc(id).snapshots().asyncMap((snapshot) async {
      var artistData = snapshot.data() as Map<String, dynamic>;

      // Check if the artist is a group (no group_id, but has members)
      if (artistData['group_id'] == null) {
        // Fetch members for the group (members have the group's id as their groupId)
        var members = await _fetchMembers(id);
        return _artistFromSnapshot(snapshot, members);
      } else {
        // Solo artist or member of a group, no members to fetch
        return _artistFromSnapshot(snapshot);
      }
    });
  }

  /// Get artist by ID once including members
  Future<Artist> getArtistById(String id) async {
    var snapshot = await _artistsCollection.doc(id).get();
    var artistData = snapshot.data() as Map<String, dynamic>;

    // Check if the artist is a group (no group_id, but has members)
    if (artistData['group_id'] == null) {
      // Fetch members for the group (members have the group's id as their groupId)
      var members = await _fetchMembers(id);
      return _artistFromSnapshot(snapshot, members);
    } else {
      // Solo artist or member of a group, no members to fetch
      return _artistFromSnapshot(snapshot);
    }
  }

  List<Map<String, dynamic>> _artistHightlights(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return {
        'photo': data['photo'],
        'active': data['active'],
      };
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getArtistHighlights(
      String artistId) async {
    var snapshot =
        await _artistsCollection.doc(artistId).collection('highlights').get();
    var highlights = _artistHightlights(snapshot);

    return highlights
        .where((highlight) => highlight['active'] == true)
        .toList();
  }
}
