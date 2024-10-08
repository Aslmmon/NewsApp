import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/AppButton.dart';
import 'package:news_app/ui/Providers.dart';

class Mainlayout extends ConsumerWidget {
  const Mainlayout(
      {super.key,
      required this.AppBarTitle,
      required this.MiddleScene,
      required this.onNextClicked});

  final String AppBarTitle;
  final Widget MiddleScene;
  final VoidCallback onNextClicked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorLight,
            title: Text(
              AppBarTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).hintColor),
            ),
            centerTitle: true),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: MiddleScene),
              AppButton(
                isButtonDisabled: (ref.watch(IndexProvider) == -1),
                titleButton: 'Next',
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                onPressed: onNextClicked,
              )
            ]));
  }
}
