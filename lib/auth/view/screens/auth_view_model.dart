// import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthViewModel extends Cubit<void> {
//   AuthViewModel() : super(null);

//   void login({required String email, required String password}) {
//     // login logic
//   }

//   void signUp(
//       {required String name, required String email, required String password}) {
//     // signup logic
//   }
// }
/////////////////////////////
///
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/user_model.dart';

class AuthViewModel extends Cubit<void> {
  AuthViewModel() : super(null);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserModel? currentUser;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    final userDoc = await _firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();

    currentUser = UserModel.fromJson(userDoc.data()!);
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    currentUser = UserModel(
      id: userCredential.user!.uid,
      name: name,
      email: email,
    );

    await _firestore
        .collection('users')
        .doc(currentUser!.id)
        .set(currentUser!.toJson());
  }
}
