import 'package:dartz/dartz.dart';
import 'package:distinct_assignment/domain/model/common/failure.dart';
import 'package:distinct_assignment/domain/model/match/match_model/match_model.dart';

abstract class MatchRepo {
  Future<Either<Failure, MatchModel>> matchDetails({required String id});
  Future<Either<Failure, List<MatchModel>>> currentMatches();
}
