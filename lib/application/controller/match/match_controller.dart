import 'dart:async';
import 'dart:developer';

import 'package:distinct_assignment/data/api_service/match/match_service.dart';
import 'package:distinct_assignment/domain/model/match/match_model/match_model.dart';
import 'package:distinct_assignment/domain/repository/match_repo.dart';
import 'package:get/get.dart';

class MatchController extends GetxController {
  /// Match repository instance
  final MatchRepo matchRepo = MatchService();

  /// current match loading state
  RxBool currentMatchLoading = false.obs;

  /// match detail loading state
  RxBool matchDetailLoading = false.obs;

  /// match detail data
  Rx<MatchModel> currentMatch = Rx<MatchModel>(MatchModel());

  /// curret match list
  RxList<MatchModel> currentMatches = <MatchModel>[].obs;

  Timer? matchDetailTimer;
  Timer? currentMatchTimer;

  @override
  void onInit() {
    super.onInit();
    // Fetch current matches when the controller is initialized
    updateCurrentMatchesInTimeInterval();
  }

  void cancelDetailTimer() {
    if (matchDetailTimer != null && matchDetailTimer!.isActive) {
      matchDetailTimer!.cancel();
      log('Match detail timer cancelled');
    }
  }

  void fetchMatchDetail(String matchId, {MatchModel? match}) {
    getMatchDetail(matchId, match: match);
    matchDetailTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
      getMatchDetail(matchId, match: match);
    });
  }

  /// fetch match details
  Future<void> getMatchDetail(String matchId, {MatchModel? match}) async {
    if (match != null) {
      currentMatch.value = match;
    } else {
      matchDetailLoading.value = true;
    }
    final result = await MatchService().matchDetails(id: matchId);
    result.fold(
      (failure) {
        // Handle error
        log(failure.message ?? "Failed to fetch match details");
      },
      (match) {
        currentMatch.value = match;
      },
    );
    matchDetailLoading.value = false;
  }

  void updateCurrentMatchesInTimeInterval() {
    fetchCurrentMatches();
    currentMatchTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
      fetchCurrentMatches();
    });
  }

  void cancelCurrentMatchTimer() {
    if (currentMatchTimer != null && currentMatchTimer!.isActive) {
      currentMatchTimer!.cancel();
      log('Current match timer cancelled');
    }
  }

  /// fetch current matches
  Future<void> fetchCurrentMatches() async {
    if (currentMatches.isEmpty) {
      currentMatchLoading.value = true;
    }
    final result = await MatchService().currentMatches();
    result.fold(
      (failure) {
        // Handle error
        print(failure.message);
      },
      (matches) {
        // Process matches
        print('Fetched ${matches.length} current matches');
        currentMatches.value = matches;
      },
    );
    currentMatchLoading.value = false;
  }
}
