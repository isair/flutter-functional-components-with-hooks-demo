import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sterling/hooks/useFocusNode.dart';
import 'package:sterling/hooks/useTextEditingController.dart';

part 'home.g.dart';

@widget
Widget myTextField(BuildContext context, String initialText) {
  final controller = useTextEditingController(initialText);
  final focusNode = useFocusNode();

  return TextField(
    controller: controller,
    focusNode: focusNode,
  );
}

@widget
Widget homePage(BuildContext currentContext, String title) {
  final counter = useState(0);

  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Counter: ${counter.value}'),
          MyTextField('Edit me!'),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => counter.value++,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
  );
}
