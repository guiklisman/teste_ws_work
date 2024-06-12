import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../loading_widget.dart';
import 'erro_widget.dart';

class StatesWidget<T> extends StatefulWidget {
  final AsyncSnapshot<void> snapshot;
  final Widget Function(BuildContext, T, Widget?) consumerBuilder;

  const StatesWidget({
    super.key,
    required this.snapshot,
    required this.consumerBuilder,
  });

  @override
  State<StatesWidget> createState() => _StatesWidgetState<T>();
}

class _StatesWidgetState<T> extends State<StatesWidget<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.snapshot.connectionState == ConnectionState.waiting) {
      return const LoadingWidget();
    }
    if (widget.snapshot.error != null) {
      return const ErroWidget();
    } else {
      return Consumer<T>(
        builder: widget.consumerBuilder,
      );
    }
  }
}
