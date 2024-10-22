import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? child;
  final AppBar? appBar;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget>? persistentFooterButtons;

  const CustomScaffold({
    super.key,
    this.child,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.persistentFooterButtons,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveWrapper.of(context).isDesktop;

    return isDesktop ? customScaffoldDesktop() : customScaffoldMobile();
  }

  Widget customScaffoldMobile() {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: persistentFooterButtons,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: child,
        ),
      ),
    );
  }

  Widget customScaffoldDesktop() {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 1024,
                maxHeight: double.infinity,
                minHeight: double.infinity),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
              ]),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
