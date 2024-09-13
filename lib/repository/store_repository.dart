import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stardust_app_skeleton/models/store.dart';

class StoreRepository extends GetxController {
  static StoreRepository get instance => Get.put(StoreRepository());
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _storesCollection;

  StoreRepository() {
    _storesCollection = _db.collection('store');
  }

  /// Stores from snapshot
  List<Store> _storesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return Store(
        id: doc.id,
        name: data['name'],
        cep: data['cep'],
        email: data['email'],
        insta: data['insta'],
        icon: data['icon'],
        cover: data['cover'],
      );
    }).toList();
  }

  /// Get all stores stream
  Stream<List<Store>> get stores {
    return _storesCollection.snapshots().map(_storesListFromSnapshot);
  }

  /// Get all stores once
  Future<List<Store>> getStores() async {
    var snapshot = await _storesCollection.get();
    return _storesListFromSnapshot(snapshot);
  }

  /// Create a store from a snapshot
  Store _storeFromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Store(
      id: snapshot.id,
      name: data['name'],
      cep: data['cep'],
      email: data['email'],
      insta: data['insta'],
      icon: data['icon'],
      cover: data['cover'],
    );
  }

  /// Get store by ID with real-time updates
  Stream<Store> getStore(String id) {
    return _storesCollection.doc(id).snapshots().map(_storeFromSnapshot);
  }

  /// Get store by ID once
  Future<Store> getStoreById(String id) async {
    var snapshot = await _storesCollection.doc(id).get();
    return _storeFromSnapshot(snapshot);
  }

  Future<String?> getStoreIconById(String id) async {
    var snapshot = await _storesCollection.doc(id).get();
    var data = snapshot.data() as Map<String, dynamic>?;
    return data?['icon'] as String?;
  }
}
