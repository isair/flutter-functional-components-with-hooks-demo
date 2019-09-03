import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useTextEditingController(String initialText) {
  return Hook.use(_TextEditingControllerHook(initialText));
}

class _TextEditingControllerHook extends Hook<TextEditingController> {
  String initialText;

  _TextEditingControllerHook(String initialText) {
    this.initialText = initialText;
  }

  @override
  _TextEditingControllerHookState createState() =>
      _TextEditingControllerHookState(initialText);
}

class _TextEditingControllerHookState
    extends HookState<TextEditingController, _TextEditingControllerHook> {
  String initialText;
  TextEditingController controller;

  _TextEditingControllerHookState(String initialText) {
    this.initialText = initialText;
  }

  @override
  void initHook() {
    controller = TextEditingController(text: initialText);
    super.initHook();
  }

  @override
  TextEditingController build(BuildContext context) {
    return controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
