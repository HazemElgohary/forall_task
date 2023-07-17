import 'package:forall_task/models/problem.dart';
import 'package:forall_task/repositories/problem.dart';

class ProblemService extends ProblemRepository {
  @override
  List<ProblemModel> fetchAll(int length) {
    return List.generate(
      length,
      (index) => ProblemModel(
        number: index + 1,
        petya: false,
        vasya: false,
        tonya: false,
      ),
    );
  }

  int countValidProblems(List<ProblemModel> problems) {
    int count = 0;

    for (final problem in problems) {
      final votes = [problem.petya, problem.vasya, problem.tonya];
      final validLength = votes.where((vote) => vote).length;

      if (validLength >= 2) {
        count++;
      }
    }

    return count;
  }

}
