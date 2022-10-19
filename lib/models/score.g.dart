// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Score extends _Score with RealmEntity, RealmObject {
  Score(
    String name,
    int score,
    String difficulty,
  ) {
    RealmObject.set(this, 'name', name);
    RealmObject.set(this, 'score', score);
    RealmObject.set(this, 'difficulty', difficulty);
  }

  Score._();

  @override
  String get name => RealmObject.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObject.set(this, 'name', value);

  @override
  int get score => RealmObject.get<int>(this, 'score') as int;
  @override
  set score(int value) => RealmObject.set(this, 'score', value);

  @override
  String get difficulty =>
      RealmObject.get<String>(this, 'difficulty') as String;
  @override
  set difficulty(String value) => RealmObject.set(this, 'difficulty', value);

  @override
  Stream<RealmObjectChanges<Score>> get changes =>
      RealmObject.getChanges<Score>(this);

  @override
  Score freeze() => RealmObject.freezeObject<Score>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Score._);
    return const SchemaObject(Score, 'Score', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('score', RealmPropertyType.int),
      SchemaProperty('difficulty', RealmPropertyType.string),
    ]);
  }
}
