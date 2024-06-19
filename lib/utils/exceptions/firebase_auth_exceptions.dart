class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'wrong-password':
        return 'The password you entered is incorrect. Please try again.';
      case 'invalid-email':
        return 'The email address you entered is invalid. Please check and try again.';
      case 'user-disabled':
        return 'Your account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'No account found with this email. Please sign up first.';
      case 'email-already-in-use':
        return 'This email is already in use. Please use a different email.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different credential.';
      case 'invalid-credential':
        return 'The credential you provided is invalid or expired.';
      case 'invalid-verification-code':
        return 'The verification code is invalid. Please try again.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid. Please try again.';
      case 'user-mismatch':
        return 'The provided credential does not match the user.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'expired-action-code':
        return 'The action code has expired. Please try again.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
