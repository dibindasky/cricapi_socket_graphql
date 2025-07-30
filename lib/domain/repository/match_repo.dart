import 'package:dartz/dartz.dart';
import 'package:distinct_assignment/domain/model/common/failure.dart';
import 'package:distinct_assignment/domain/model/match/match_model/match_model.dart';
import 'package:distinct_assignment/domain/model/match/player/player.dart';
import 'package:distinct_assignment/domain/model/match/series_info/info.dart';
import 'package:distinct_assignment/domain/model/match/series_info/series_info.dart';

abstract class MatchRepo {
  Future<Either<Failure, MatchModel>> matchDetails({required String id});
  Future<Either<Failure, List<MatchModel>>> currentMatches();
  Future<Either<Failure, List<Info>>> fetchSeriesInfoList();
  Future<Either<Failure, SeriesInfo>> seriesInfoDetails({required String id});
  Future<Either<Failure, List<Player>>> playerSearch({required String query});
}
