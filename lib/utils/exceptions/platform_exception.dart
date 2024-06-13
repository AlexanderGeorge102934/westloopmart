class TPlatformException implements Exception{

  TPlatformException(this.code);

  final String code;

  String get message{
    switch (code) {
      case 'not_available':
        return 'The requested platform is not available.';
      case 'operation_failed':
        return 'The operation failed on the platform.';
      case 'missing_plugin':
        return 'The specified plugin is not implemented for the current platform.';
      case 'method_not_implemented':
        return 'The method called is not implemented on the platform.';
      case 'permission_denied':
        return 'The operation was denied due to missing permissions.';
      case 'network_error':
        return 'There was a network error.';
      case 'timeout':
        return 'The operation timed out.';
      default:
        return 'An unspecified platform error occurred.';
    }


  }




}