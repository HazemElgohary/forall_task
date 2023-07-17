import 'package:equatable/equatable.dart';

class ProblemModel extends Equatable {
  final int number;
  final bool petya;
  final bool vasya;
  final bool tonya;

  const ProblemModel({
    required this.number,
    required this.petya,
    required this.vasya,
    required this.tonya,
  });

  ProblemModel copyWith({
    int? number,
    bool? petya,
    bool? vasya,
    bool? tonya,
  }) {
    return ProblemModel(
      number: number ?? this.number,
      petya: petya ?? this.petya,
      vasya: vasya ?? this.vasya,
      tonya: tonya ?? this.tonya,
    );
  }

  @override
  List<Object?> get props => [
    number,
      ];
}
