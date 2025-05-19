class Validators {
  static String? validateName(String? value) {
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    } else if (!nameRegex.hasMatch(value.trim())) {
      return 'Name must contain only letters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return 'Enter a valid email!';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    final phoneRegex = RegExp(r'^[()]?\d{3}[()]?[-.\s]?\d{3}[-.\s]?\d{4}$');
    if (value!.isEmpty) {
      return 'Phone number is required';
    } else if (!phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid phone number!';
    }
    return null;
  }
}
