import 'package:realm/realm.dart';

part 'score.g.dart';

@RealmModel()
class _Score {
  late String name;
  late int score;
  late String difficulty;
}
