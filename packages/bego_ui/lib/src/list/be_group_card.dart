import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BeGroupCard extends StatefulWidget {
  const BeGroupCard({
    super.key,
    required this.groupData,
  });
  final BeGroupItemData groupData;

  @override
  State<StatefulWidget> createState() => BeGroupCardState();
}

class BeGroupCardState extends State<BeGroupCard>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  late final BeExpandableContainerController _controller;
  late Widget _arrowIcon;
  late final Animation<double> _iconTurns;
  late final bool _initExpand;
  late final AnimationController? _animationController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = BeExpandableContainerController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _initExpand = widget.groupData.isExpand;
    _iconTurns = _animationController!.drive(_halfTween.chain(_easeInTween));
    if (_initExpand) {
      _arrowIcon = const Icon(Icons.keyboard_arrow_up);
    } else {
      _arrowIcon = const Icon(Icons.keyboard_arrow_down);
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      elevation: 0.2,
      child: BeRoundClipRect(
        borderRadius: bestyles.borderRadius,
        child: BeExpandableContainerWidget(
          key: widget.key,
          expandableController: _controller,
          initiallyExpanded: _initExpand,
          onExpansionChanged: (isExpand) {
            if (isExpand) {
              _arrowIcon = const Icon(Icons.keyboard_arrow_up);
            } else {
              _arrowIcon = const Icon(Icons.keyboard_arrow_down);
            }
            widget.groupData.isExpand = isExpand;
          },
          headerBuilder: (_) => GestureDetector(
            onTap: () {
              _controller.toggle();
            },
            child: Container(
              color: widget.groupData.isExpand
                  ? becolors.divider
                  : Colors.transparent,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.groupData.groupName,
                    ),
                  ),
                  RotationTransition(
                    turns: _iconTurns,
                    child: _arrowIcon,
                  ),
                ],
              ),
            ),
          ),
          child: _getContentWidget(),
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    if (widget.groupData.children == null) {
      return emptyWidget;
    }
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.groupData.children?.length,
      itemBuilder: (BuildContext context, int index) => Container(
        color: becolors.lightInverse,
        child: ListTile(
          onTap: () =>
              widget.groupData.children![index].navigatorPage!(context),
          title: BeText.labelMedium(
            widget.groupData.children![index].groupName,
          ),
        ),
      ),
    );
  }
}
