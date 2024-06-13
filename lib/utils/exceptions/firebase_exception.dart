class TFirebaseException implements Exception{
  TFirebaseException(this.code);

  final String code;

  String get message {

    switch (code) {
      case 'auth/email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'auth/invalid-email':
        return 'The email address is not valid.';
      case 'auth/user-not-found':
        return 'No user found for the provided email.';
      case 'auth/wrong-password':
        return 'The password is invalid for the provided email.';
      case 'auth/weak-password':
        return 'The password is too weak.';
      case 'auth/operation-not-allowed':
        return 'Operation not allowed. Please contact support.';
      case 'auth/user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'auth/requires-recent-login':
        return 'The operation requires recent authentication. Log in again before retrying this request.';
      case 'auth/account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'auth/invalid-credential':
        return 'The provided authentication credential is not valid.';
      default:
        return 'An unknown error occurred.';
    }


  }

}