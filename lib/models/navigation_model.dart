class NavigationModel {
  final String title;

  NavigationModel({required this.title});

  factory NavigationModel.fromJson(Map<String, dynamic> json) =>
      NavigationModel(
        title: json['title'],
      );
}
