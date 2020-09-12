import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
class CategoryService {
  Firestore _firestore = Firestore.instance;
  String ref = 'categories';


  Future createCategory (String name) {
    var id = new Uuid();
    String categoryID = id.v1();
    _firestore.collection('categories').document(categoryID).setData(
        {
          'categoery': name,
        }

    );
  }

  Future<List<DocumentSnapshot>> getCategories () =>
      _firestore.collection(ref).getDocuments().then((snaps)  {
        return  snaps.documents;
      }
      );



  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
    _firestore.collection(ref)
        .where('categoery', isEqualTo: suggestion)
        .getDocuments()
        .then((snap)  {
      return  snap.documents;
    });






}