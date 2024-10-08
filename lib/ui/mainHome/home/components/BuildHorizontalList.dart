import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/LatestTopicItem.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'package:news_app/data/models/user/user.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BuildTopicList extends ConsumerStatefulWidget {
  BuildTopicList(this.data, this.user, this.IndexToJumpTo, this.onTopicClicked);

  final List<Topics> data;
  final User user;
  final int IndexToJumpTo;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ValueChanged<Topics> onTopicClicked;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildHorizontalList();
}

class _BuildHorizontalList extends ConsumerState<BuildTopicList> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.itemScrollController.scrollTo(
        index: widget.IndexToJumpTo,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemScrollController: widget.itemScrollController,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: LatestTopicItem(
              data: widget.data[index],
              isSelected: widget.data[index].name?.compareTo(widget.user.topic.name ?? '') == 0,
              onTopicClicked: widget.onTopicClicked,
            ),
          );
        });
  }
}
