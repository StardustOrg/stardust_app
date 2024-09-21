class Photocard {
  final String artistName, artistId;
  final String? memberName, memberId;
  final String? dt1, dt2;
  final String pcName;
  final String? description;
  final String imageUrl;
  final double price;
  final String id;
  final int quantity;
  final String storeId, storeName;
  final bool original;

  Photocard({
    required this.artistName,
    required this.description,
    required this.imageUrl,
    required this.pcName,
    required this.price,
    required this.id,
    required this.artistId,
    required this.memberName,
    required this.memberId,
    required this.quantity,
    required this.storeId,
    required this.storeName,
    required this.dt1,
    required this.dt2,
    required this.original,
  });
}
