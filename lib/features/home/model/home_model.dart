import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeModel {
  final String? name;
  final int? age;
  final bool? isStudent;
  HomeModel({
     this.name,
     this.age,
     this.isStudent,
  });
  HomeModel copyWith({
    String? name,
    int? age,
    bool? isStudent,
  }) {
    return HomeModel(
      name: name ?? this.name,
      age: age ?? this.age,
      isStudent: isStudent ?? this.isStudent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'isStudent': isStudent,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      name: map['name'] as String,
      age: map['age'] as int,
      isStudent: map['isStudent'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) => HomeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomeModel(name: $name, age: $age, isStudent: $isStudent)';

  @override
  bool operator ==(covariant HomeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age &&
      other.isStudent == isStudent;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ isStudent.hashCode;
}
