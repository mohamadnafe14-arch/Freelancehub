import 'package:material_ui/material_ui.dart';

import '../responsive/responsive_layout.dart';

typedef ResponsiveWidgetBuilder = Widget Function(
  BuildContext context,
  double availableWidth,
);

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  final ResponsiveWidgetBuilder mobile;
  final ResponsiveWidgetBuilder tablet;
  final ResponsiveWidgetBuilder desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final screenClass = ScreenClass.fromWidth(availableWidth);
        final layoutBuilder = switch (screenClass) {
          ScreenClass.mobile => mobile,
          ScreenClass.compactTablet || ScreenClass.tablet => tablet,
          ScreenClass.desktop || ScreenClass.largeDesktop => desktop,
        };

        return layoutBuilder(context, availableWidth);
      },
    );
  }
}
