
class CategoryModel {
  String? categoryName;
  String? imageUrl;

  CategoryModel({
    this.categoryName,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'imageUrl': imageUrl,
    };
  }

  CategoryModel.fromSnapshot(snapshot)
      : categoryName = snapshot.data()['categoryName'],
        imageUrl = snapshot.data()['imageUrl'];

}