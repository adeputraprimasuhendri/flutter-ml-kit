class FormValidation {
  String validatePhone(String phone) =>
      phone.length <= 8 ? "Phone must be more equal than 8 number" : null;
}
