class Recomandare {
  final String rezultat;

  const Recomandare({required this.rezultat});
  factory Recomandare.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'prescriptie': String r,
      } =>
        Recomandare(rezultat: r),
      _ => throw const FormatException('Failed to load prescriptie'),
    };
  }
}
