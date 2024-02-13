mixin StudentValidationMixin {
  String? validationFirstName(String? value) {
    String deger = value!;
    if (deger.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    }
    return null;
  }

  String? validationLastName(String? value) {
    String deger = value!;
    if (deger.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    }
    return null;
  }

  String? validationGradeName(String? value) {
    int? grade;
    String except = "Lütfen 1 ile 100 arası bir değer giriniz.";
    try {
      grade = int.parse(value!);
    } catch (e) {
      return except;
    }
    if (grade > 100 || grade < 0) {
      return except;
    }

    return null;
  }
}
