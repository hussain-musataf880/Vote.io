import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_services.dart';

class DBServices {
  static DBServices instance = DBServices();

  final _db = Firestore.instance;

  Map userData;

  void getUserData() async {
    var userID = AuthServices.instance.user.uid;
    var query = _db.collection('Users').document(userID);
    userData = await query.get().then((doc) {
      return doc.data;
    });
  }

  Stream getPolls() {
    Query query = _db.collection('Polls');
    return query.snapshots().map((snap) => snap.documents.map((doc) {
          var data = doc.data;
          data['id'] = doc.documentID;
          return data;
        }));
  }
}
