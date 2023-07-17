import 'package:forall_task/models/problem.dart';

abstract class ProblemRepository {
  List<ProblemModel> fetchAll(int length);
}
