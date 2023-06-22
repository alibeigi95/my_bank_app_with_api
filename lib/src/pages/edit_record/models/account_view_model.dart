class EditAccountViewModel {
  final int id;
  final String name;


  EditAccountViewModel({
    required this.id,
    required this.name,
  });

  factory EditAccountViewModel.fromJson(Map<String, dynamic> json) {
    return EditAccountViewModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
