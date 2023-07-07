import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

class AuthController extends GetxController{
   static AuthController instance = Get.find();
   late Rx<User?> _user;
   FirebaseAuth auth = FirebaseAuth.instance;

   @override
  void onReady(){
     super.onReady();
     _user = Rx<User?>(auth.currentUser);
     _user.bindStream(auth.userChanges());
     // ever(_user, _initialScreen);
   }
   _initialScreen(User? user){
     if(user == null){
       print("login page");
       Get.offAll(()=> const SignInScreen());
     }
     else{
       Get.off(()=> const SignInScreen());
     }
   }

  // Getter method to access the current user value
  User? get currentUser => _user.value;

  Future<void> register(String email, password) async{
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.to(const SignInScreen());
    }
    catch(e){
      rethrow;
    }
  }

  Future<void> login(String email, password) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.off(const LoginSuccessScreen());
    }
    catch(e){
      if(e is FirebaseAuthException) {
        var ex = handleFirebaseAuthException(e);
        throw(ex);
      }
    }
  }

  void logout() async{
    await auth.signOut();
    Get.offAll(const SignInScreen());
  }
}

String handleFirebaseAuthException(FirebaseAuthException exception) {
  String errorMessage = '';

  switch (exception.code) {
    case 'invalid-email':
      errorMessage = 'Invalid email address.';
      break;
    case 'user-not-found':
      errorMessage = 'User not found.';
      break;
    case 'wrong-password':
      errorMessage = 'Invalid password.';
      break;
    case 'email-already-in-use':
      errorMessage = 'Email address is already in use.';
      break;
  // Add more cases to handle other Firebase Auth exceptions
    default:
      errorMessage = 'An error occurred during authentication.';
      break;
    }
    return errorMessage;
  }