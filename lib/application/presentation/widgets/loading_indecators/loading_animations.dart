import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key, this.width = 60, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.ballPulse,
            colors: colors ?? [Theme.of(context).colorScheme.primary]),
      ),
    );
  }
}

class LoadingAudioAnimation extends StatelessWidget {
  const LoadingAudioAnimation({super.key, this.width = 60, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.lineScalePulseOut,
            colors: colors ?? [Theme.of(context).colorScheme.primary]),
      ),
    );
  }
}

class LoadingTypingAnimation extends StatelessWidget {
  const LoadingTypingAnimation({super.key, this.width = 60, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.ballPulseSync,
            colors: colors ?? [Theme.of(context).colorScheme.primary]),
      ),
    );
  }
}

class LoadingOrbitAnimation extends StatelessWidget {
  const LoadingOrbitAnimation({super.key, this.width = 60, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.orbit,
            colors: colors ?? [Theme.of(context).colorScheme.primary]),
      ),
    );
  }
}

class LoadingBallRotateChaseAnimation extends StatelessWidget {
  const LoadingBallRotateChaseAnimation(
      {super.key, this.width = 60, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: colors ?? [Theme.of(context).colorScheme.primary]),
      ),
    );
  }
}

class LoadingLineSpinFadeLoaderAnimation extends StatelessWidget {
  const LoadingLineSpinFadeLoaderAnimation(
      {super.key, this.width = 60, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.lineSpinFadeLoader,
            colors: colors ?? [Theme.of(context).colorScheme.primary]),
      ),
    );
  }
}

class LoadingCircleStrokeSpinAnimation extends StatelessWidget {
  const LoadingCircleStrokeSpinAnimation(
      {super.key, this.width = 60, this.colors});

  final double? width;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: LoadingIndicator(
            indicatorType: Indicator.circleStrokeSpin,
            colors: colors ?? [Theme.of(context).colorScheme.primary]),
      ),
    );
  }
}
