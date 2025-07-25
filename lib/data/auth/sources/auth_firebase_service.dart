part of '../index.dart';

abstract class AuthFirebaseService {
  Future<String> signUp(StoreUserRequest userRequest);

  Future<UserEntity> signIn(LoginUserRequest userRequest);

  Future<String> signOut();

  Future<bool> isLogged();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<String> signUp(StoreUserRequest userRequest) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userRequest.email,
          password: userRequest.password,
        );
    final CollectionReference users = FirebaseFirestore.instance.collection(
      'users',
    );
    final String userId = const Uuid().v4();

    await users.doc(credential.user!.uid).set({
      'user_id': userId,
      'first_name': userRequest.firstName,
      'last_name': userRequest.lastName,
      'email_address': userRequest.email,
      'created_at': DateTime.now(),
    });
    return "User Account created Successfully!";
  }

  @override
  Future<UserEntity> signIn(LoginUserRequest userRequest) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: userRequest.email,
          password: userRequest.password,
        );
    var userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(credential.user!.uid)
        .get();
    UserEntity userEntity = UserModel.fromJson(userDoc.data()!).toEntity();
    return userEntity;
  }

  @override
  Future<bool> isLogged() async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser?.reload();
    if( firebaseAuth.currentUser!=null){
      return firebaseAuth.currentUser != null;
    }
    throw Exception(ServerFailure("You are not logged"));
  }

  @override
  Future<String> signOut() async {
    await FirebaseAuth.instance.signOut();
    return 'Sign out Successfully!';
  }
}
