class TFormatException implements Exception{


  final String message;


  /// Default constructor with a generic error message
  const TFormatException([this.message = "A unexpecged format error ocurred. Please check your input."]);

  /// Create a format exception from a specific error message
  factory TFormatException.fromMessage(String message){
    return TFormatException(message);
  }

  /// Get error message
  String get formattedMessage => message;

  factory TFormatException.fromCode(String code){
    switch (code) {

      case 'invalid-date':
        return const TFormatException('The date format is invalid.');
      case 'invalid-email':
        return const TFormatException('The email format is invalid.');
      case 'invalid-number':
        return const TFormatException('The number format is invalid.');
      case 'invalid-url':
        return const TFormatException('The URL format is invalid.');
      case 'invalid-json':
        return const TFormatException('The JSON format is invalid.');
      case 'invalid-phone':
        return const TFormatException('The phone number format is invalid.');
      case 'empty-string':
        return const TFormatException('The string is empty.');
      case 'invalid-boolean':
        return const TFormatException('The boolean format is invalid.');
      default:
        return const TFormatException('An unknown formatting error occurred.');
    }



  }



}