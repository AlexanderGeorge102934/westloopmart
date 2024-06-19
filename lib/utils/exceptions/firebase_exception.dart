class TFirebaseException implements Exception{
  TFirebaseException(this.code);

  final String code;

  String get message {

    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'No user found for the provided email.';
      case 'wrong-password':
        return 'The password is invalid for the provided email.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'operation-not-allowed':
        return 'Operation not allowed. Please contact support.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'requires-recent-login':
        return 'The operation requires recent authentication. Log in again before retrying this request.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'invalid-credential':
        return 'The provided authentication credential is not valid.';
      default:
        return 'An unknown error occurred.';
    }


  }

}