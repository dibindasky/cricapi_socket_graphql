import 'package:dartz/dartz.dart';
import 'package:distinct_assignment/core/endpoints/api_endpoints.dart';
import 'package:distinct_assignment/data/api_service/api_service.dart';
import 'package:distinct_assignment/domain/model/api_response/api_response.dart';
import 'package:distinct_assignment/domain/model/common/failure.dart';
import 'package:distinct_assignment/domain/model/match/match_model/match_model.dart';
import 'package:distinct_assignment/domain/repository/match_repo.dart';
import 'package:distinct_assignment/secrets/secrets.dart';

class MatchService implements MatchRepo {
  final ApiService apiService = ApiService(ApiEndPoints.cricBaseUrl);

  @override
  Future<Either<Failure, MatchModel>> matchDetails({required String id}) async {
    try {
      final ApiResponse response = await apiService.get(
        ApiEndPoints.matchDetails,
        queryParameters: {'id': id, 'apikey': AppSecrets.crickApikey},
      );
      if (response.success ?? false) {
        final matchModel = MatchModel.fromJson(
          response.data as Map<String, dynamic>? ?? {},
        );
        return Right(matchModel);
      } else {
        return Left(
          Failure(message: response.error ?? 'Failed to fetch match details'),
        );
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch match details'));
    }
  }

  @override
  Future<Either<Failure, List<MatchModel>>> currentMatches() async {
    try {
      final ApiResponse response = await apiService.get(
        ApiEndPoints.currentMatches,
        queryParameters: {'apikey': AppSecrets.crickApikey},
      );
      if (response.success ?? false) {
        final List<MatchModel> matches =
            (response.data as List<dynamic>? ?? [])
                .map(
                  (match) =>
                      MatchModel.fromJson(match as Map<String, dynamic>? ?? {}),
                )
                .toList();
        return Right(matches);
      } else {
        return Left(
          Failure(message: response.error ?? 'Failed to fetch current matches'),
        );
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch current matches'));
    }
  }
}
