import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

import 'debouncer.dart';

class InputAutoSearch extends StatefulWidget {
  final Function? search;
  final String? hintText;

  const InputAutoSearch({
    super.key,
    @required this.search,
    this.hintText,
  });

  @override
  InputAutoSearchState createState() => InputAutoSearchState();
}

class InputAutoSearchState extends State<InputAutoSearch> {
  final _conditionEC = TextEditingController();

  Debouncer onSearchDebouncer = Debouncer();

  @override
  void dispose() {
    _conditionEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        _conditionEC.text = value;
        onSearchDebouncer.debounce(() {
          widget.search!(value);
        });
      },
      autofocus: false,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Theme.of(context).canvasColor,
          ),
      decoration: InputDecoration(
        fillColor: ColorsApp.instance.primary,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).canvasColor,
            size: 21,
          ),
          onPressed: () {
            search();
          },
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).canvasColor,
            ),
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        search();
      },
    );
  }

  void search() async {
    onSearchDebouncer.cancel();
    await widget.search!(_conditionEC.text);
  }
}
