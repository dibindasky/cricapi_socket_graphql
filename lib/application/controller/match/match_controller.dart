import 'dart:async';
import 'dart:developer';

import 'package:distinct_assignment/data/api_service/match/match_service.dart';
import 'package:distinct_assignment/domain/model/match/match_model/match_model.dart';
import 'package:distinct_assignment/domain/model/match/player/player.dart';
import 'package:distinct_assignment/domain/model/match/series_info/info.dart';
import 'package:distinct_assignment/domain/model/match/series_info/series_info.dart';
import 'package:distinct_assignment/domain/repository/match_repo.dart';
import 'package:get/get.dart';

class MatchController extends GetxController {
  /// Match repository instance
  final MatchRepo matchRepo = MatchService();

  /// current match loading state
  RxBool currentMatchLoading = false.obs;

  /// match detail loading state
  RxBool matchDetailLoading = false.obs;

  /// series info list loading state
  RxBool seriesInfoListLoading = false.obs;

  /// player search list loading state
  RxBool playerSearchListLoading = false.obs;

  /// fetch series info Loading state
  RxBool seriesInfoLoading = false.obs;

  /// match detail data
  Rx<MatchModel> currentMatch = Rx<MatchModel>(MatchModel());

  /// curret match list
  RxList<MatchModel> currentMatches = <MatchModel>[].obs;

  /// series info list
  RxList<Info> seriesInfoList = <Info>[].obs;

  /// series info data
  Rx<SeriesInfo> seriesInfo = Rx<SeriesInfo>(SeriesInfo());

  RxList<Player> playerSearchList = <Player>[].obs;

  Timer? matchDetailTimer;
  Timer? currentMatchTimer;

  @override
  void onInit() {
    super.onInit();
    updateCurrentMatchesInTimeInterval();
    fetchSeriesInfoList();
  }

  void cancelDetailTimer() {
    if (matchDetailTimer != null && matchDetailTimer!.isActive) {
      matchDetailTimer!.cancel();
      log('Match detail timer cancelled');
    }
  }

  void fetchMatchDetail(String matchId, {MatchModel? match}) {
    getMatchDetail(matchId, match: match);
    // matchDetailTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
    //   getMatchDetail(matchId, match: match);
    // });
  }

  /// fetch match details
  Future<void> getMatchDetail(String matchId, {MatchModel? match}) async {
    if (match != null) {
      currentMatch.value = match;
    } else {
      matchDetailLoading.value = true;
      playerSearchListLoading.value = true;
    }
    final result = await matchRepo.matchDetails(id: matchId);
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
    searchPlayer('');
  }

  void updateCurrentMatchesInTimeInterval() {
    fetchCurrentMatches();
    // currentMatchTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
    //   fetchCurrentMatches();
    // });
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
    final result = await matchRepo.currentMatches();
    result.fold(
      (failure) {
        // Handle error
        log(failure.message ?? 'Failed to fetch current matches');
        if (failure.data != null &&
            failure.data is Map<String, dynamic> &&
            (failure.data as Map<String, dynamic>)['reason'] ==
                'Blocked for 15 minutes') {
          log('Error data: ${failure.data}');
          cancelCurrentMatchTimer();
          Timer(const Duration(minutes: 15), () {
            updateCurrentMatchesInTimeInterval();
          });
        }
      },
      (matches) {
        // Process matches
        log('Fetched ${matches.length} current matches');
        currentMatches.value = matches;
      },
    );
    currentMatchLoading.value = false;
  }

  /// fetch  series infolist
  Future<void> fetchSeriesInfoList() async {
    if (seriesInfoList.isEmpty) {
      seriesInfoListLoading.value = true;
    }
    final result = await matchRepo.fetchSeriesInfoList();
    result.fold(
      (failure) {
        // Handle error
        log(failure.message ?? 'Failed to fetch series matches');
      },
      (matches) {
        // Process matches
        log('Fetched ${matches.length} series matches');
        seriesInfoList.value = matches;
      },
    );
    seriesInfoListLoading.value = false;
  }

  /// fetch match details
  Future<void> fetchSeriesInfo(String seriesId) async {
    seriesInfoLoading.value = true;

    final result = await matchRepo.seriesInfoDetails(id: seriesId);
    result.fold(
      (failure) {
        // Handle error
        log(failure.message ?? "Failed to fetch series info");
        seriesInfo.value = SeriesInfo();
      },
      (info) {
        seriesInfo.value = info;
      },
    );
    seriesInfoLoading.value = false;
  }

  void searchPlayer(String query) {
    if (query.isEmpty) {
      playerSearchList.clear();
      return;
    }
    playerSearchListLoading.value = true;

    matchRepo.playerSearch(query: query).then((result) {
      result.fold(
        (failure) {
          // Handle error
          log(failure.message ?? 'Failed to search players');
          playerSearchList.clear();
        },
        (players) {
          // Process players
          log('Found ${players.length} players for query: $query');
          playerSearchList.value = players;
        },
      );
      playerSearchListLoading.value = false;
    });
  }
}
