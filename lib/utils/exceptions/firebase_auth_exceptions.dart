class TFirebaseAuthException implements Exception {

  /// The error associated with the exception
  final String code;

  TFirebaseAuthException(this.code);

  String get message {

    // TODO Make messages uniform
    switch (code) {
    // signInWithEmailAndPassword
      case 'wrong-password':
        return 'Invalid password, please try again.';
      case 'invalid-email':
        return 'Invalid email, please try again.';
      case 'user-disabled':
        return 'The account corresponding to the given email has been disabled.';
      case 'user-not-found':
        return 'No account has been found.';

    // createUserWithEmailAndPassword
      case 'email-already-in-use':
        return 'An account with this email address already exists';
      case 'invalid-email':
        return 'Invalid email, please try again.';
      case 'weak-password':
        return 'Password is not strong enough.';

    // signInWithCredential
      case 'account-exists-with-different-credential':
        return 'Account already exists under a different sign-in method.';
      case 'invalid-credential':
        return 'The credential is malformed or has expired.';
      // case 'operation-not-allowed':
      //   return 'The type of account corresponding to the credential is not enabled. Enable the account type in the Firebase Console, under the Auth tab.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'user-not-found':
        return 'There is no user corresponding to the given email.';
      case 'wrong-password':
        return 'The password is invalid for the given email, or the account corresponding to the email doesn\'t have a password set.';
      case 'invalid-verification-code':
        return 'The verification code of the credential is not valid.';
      case 'invalid-verification-id':
        return 'The verification ID of the credential is not valid.';

    // reauthenticateWithCredential
      case 'user-mismatch':
        return 'The credential given does not correspond to the user.';
      case 'invalid-credential':
        return 'The provider\'s credential is not valid. This can happen if it has already expired when calling link, or if it used invalid token(s).';
      case 'invalid-email':
        return 'The email address used in the credential is invalid.';
      case 'wrong-password':
        return 'The password used in the credential is incorrect, or the user associated with the email does not have a password.';
      case 'invalid-verification-code':
        return 'The verification code of the credential is not valid.';
      case 'invalid-verification-id':
        return 'The verification ID of the credential is not valid.';

    // signInWithAuthProvider
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';

    // signInAnonymously
      case 'operation-not-allowed':
        return 'Anonymous accounts are not enabled. Enable anonymous accounts in the Firebase Console, under the Auth tab.';

    // signInWithEmailLink
      case 'expired-action-code':
        return 'The OTP in the email link has expired.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';

      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
