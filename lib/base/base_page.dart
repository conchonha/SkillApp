import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_viewmodel.dart';

class BasePage<T extends BaseViewModel> extends StatelessWidget {
  final T model;
  final Widget child;
  final void Function(BuildContext, T) onInit;

  BasePage({@required this.model, @required this.child, this.onInit});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) {
          model.onLoading = () {};

          model.onHideLoading = () {};

          onInit?.call(context, model);

          model.onInit();

          return model;
        },

        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: child,
        ));
  }
}
