import 'package:flutter/material.dart';
import 'package:forall_task/models/problem.dart';

class ProblemItem extends StatelessWidget {
  final ProblemModel problem;
  final ValueChanged<ProblemModel> onChanged;

  const ProblemItem({
    Key? key,
    required this.problem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'Problem number ${problem.number}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          ...List.generate(
            3,
            (index) => CheckboxListTile(
              title: Text(
                index == 0
                    ? 'petya'
                    : index == 1
                        ? 'vasya'
                        : 'tonya',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              value: index == 0
                  ? problem.petya
                  : index == 1
                      ? problem.vasya
                      : problem.tonya,
              onChanged: (value) {
                if (value == null) return;
                onChanged(
                  problem.copyWith(
                    petya: index == 0 ? value : problem.petya,
                    vasya: index == 1 ? value : problem.vasya,
                    tonya: index == 2 ? value : problem.tonya,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
