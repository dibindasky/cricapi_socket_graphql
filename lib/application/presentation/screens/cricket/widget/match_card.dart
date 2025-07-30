import 'package:animate_do/animate_do.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:distinct_assignment/domain/model/match/match_model/match_model.dart';
import 'package:distinct_assignment/domain/model/match/match_model/score.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (match.matchStarted == true && match.matchEnded == false)
          Positioned(
            top: 3,
            right: 8,
            child: SlideInUp(
              from: 10,
              delay: animationDuration,
              duration: animationDuration,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Flash(
                      infinite: true,
                      duration: const Duration(seconds: 4),
                      child: Icon(
                        Icons.radio_button_checked,
                        color: kwhite,
                        size: 10,
                      ),
                    ),
                    adjustWidth(4),
                    Text(
                      "live",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: kwhite),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Hero(
          tag: 'match_${match.id}',
          child: SizedBox(
            width:
                MediaQuery.of(context).size.width > 600 ? 600 : double.infinity,
            child: Card(
              margin: EdgeInsets.only(top: 16),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Match Name
                      if (match.matchType != null)
                        Center(
                          child: Text(
                            '${(match.matchType ?? "").toUpperCase()} (${match.date})',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      if (match.matchType != null) SizedBox(height: 8),
                      // Teams
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _teamStatus(
                              context,
                              teamName: match.teams?[0] ?? "Team A",
                              score:
                                  (match.score ?? []).length == 1
                                      ? match.score?.last
                                      : null,
                            ),
                          ),
                          Text(
                            " vs ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(color: kgrey),
                          ),
                          Expanded(
                            child: _teamStatus(
                              context,
                              teamName: match.teams?[1] ?? "Team B",
                              score:
                                  (match.score ?? []).length == 2
                                      ? match.score?.last
                                      : null,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Current Status
                      FittedBox(fit: BoxFit.scaleDown,
                        child: Text(
                          match.status ?? "Status",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: kprimary),
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Match Status Indicator
      ],
    );
  }

  Widget _teamStatus(
    BuildContext context, {
    String teamName = 'Team',
    Score? score,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Column(
      crossAxisAlignment:
          textAlign == TextAlign.end
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
      children: [
        Text(
          teamName,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: textAlign,
        ),
        Text(
          score != null
              ? "${score.r ?? 0}/${score.w ?? 0} (${score.o ?? 0} overs)"
              : 'N/A',

          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kgrey),
        ),
      ],
    );
  }
}
