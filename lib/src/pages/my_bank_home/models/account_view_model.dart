class AccountViewModel {
  final int id;
  final String name;
  final int balance;

  AccountViewModel({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory AccountViewModel.fromJson(final Map<String, dynamic> json) {
    return AccountViewModel(
        id: json['id'], name: json['name'], balance: json['balance']);
  }
}
