import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:convert/convert.dart';

class BrandService {
  Firestore _firestore = Firestore.instance;
  String ref = 'brands';

  Future createBrand (String name) {
    var id = new Uuid();
    String brandID = id.v1();
    _firestore.collection('brands').document(brandID).setData(
        {
          'brand': name,
        }

    );
  }

  Future<List<DocumentSnapshot>> getBrands () =>
    _firestore.collection(ref).getDocuments().then((snaps)  {
      return  snaps.documents;
    }
    );



  Future<List<DocumentSnapshot>> getSuggestionss (String suggestion) =>
      _firestore.collection(ref)
          .where('brand', isEqualTo: suggestion)
          .getDocuments()
          .then((snap)  {
        return snap.documents;
      });

}