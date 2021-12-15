class UpdateModel {
  final String version;
  final String title;
  final String content;

  UpdateModel(
      {required this.version, required this.title, required this.content});

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      version: json["version"],
      title: json["title"],
      content: json["content"],
    );
  }
}
