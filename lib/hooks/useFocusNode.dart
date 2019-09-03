import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

FocusNode useFocusNode() {
  return Hook.use(_FocusNodeHook());
}

class _FocusNodeHook extends Hook<FocusNode> {
  const _FocusNodeHook();

  @override
  _FocusNodeHookState createState() => _FocusNodeHookState();
}

class _FocusNodeHookState extends HookState<FocusNode, _FocusNodeHook> {
  FocusNode focusNode;

  @override
  void initHook() {
    super.initHook();
    focusNode = FocusNode();
  }

  @override
  FocusNode build(BuildContext context) {
    return focusNode;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
