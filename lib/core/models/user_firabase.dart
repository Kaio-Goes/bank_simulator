class UserFirabase {
  late String id;
  late String name;

  UserFirabase({
    required this.id,
    required this.name,
  });

  UserFirabase.fromJson(Map<String, dynamic> json) {
    id = json['id']['stringValue'];
    name = json['name']['stringValue'];
  }
}
