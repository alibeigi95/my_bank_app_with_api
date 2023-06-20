class AccountViewModel {
  final int id;
  final String name;

  AccountViewModel({
    required this.id,
    required this.name,
  });

  factory AccountViewModel.fromJson(Map<String, dynamic> json) {
    return AccountViewModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
