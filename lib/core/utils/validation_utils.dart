class ValidationUtils {
  //Validates if String is not empty or null
  String? isNotEmpty(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      return null;
    }
    return "Field is required";
  }

  //validates if String is proper email format
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    if (emailRegex.hasMatch(value)) {
      return null;
    } else {
      return "Email format is invalid";
    }
  }

  /// Validates if the string is a valid password (at least 8 characters, includes upper/lowercase, number, and special character).
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    final RegExp passwordRegex = RegExp(
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$",
    );
    if (passwordRegex.hasMatch(value)) {
      return null;
    } else {
      return "Password must contain at least 8 characters, includes upper/lowercase, number, and special character";
    }
  }

  /// Validates if the string is a valid phone number (simple format, can be adjusted based on requirements).
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone Number is required";
    }
    final RegExp phoneRegex = RegExp(r"^\+?[0-9]{10,13}$");
    if (phoneRegex.hasMatch(value)) {
      return null;
    }
    return null;
  }

  /// Validates if the string has a specific minimum length.
  bool hasMinLength(String? value, int minLength) {
    if (value == null) {
      return false;
    }
    return value.length >= minLength;
  }

  /// Validates if the string has a specific maximum length.
  bool hasMaxLength(String? value, int maxLength) {
    if (value == null) {
      return false;
    }
    return value.length <= maxLength;
  }

  /// Validates if the string matches a specific pattern.
  bool matchesPattern(String? value, String pattern) {
    if (value == null) {
      return false;
    }
    final RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }
}
