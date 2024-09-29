class User {
  final int id;
  final String name;
  final String? profilePicture; // Nullable field
  final String? bio; // Nullable field

  // Constructor with nullable fields
  User({
    required this.id,
    required this.name,
    this.profilePicture,
    this.bio,
  });

  // Factory constructor for creating a User from a map (for JSON or database)
  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      profilePicture: map['profilePicture'],
      bio: map['bio'],
    );
  }

  // Convert a User to a map (for JSON or database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profilePicture': profilePicture,
      'bio': bio,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, profilePicture: $profilePicture, bio: $bio)';
  }
}
