enum ScreenClass {
  mobile,
  compactTablet,
  tablet,
  desktop,
  largeDesktop;

  bool get isMobile => this == mobile;

  bool get isTablet => this == compactTablet || this == tablet;

  bool get isDesktop => this == desktop || this == largeDesktop;

  static ScreenClass fromWidth(double width) {
    if (!width.isFinite || width < 0) {
      throw ArgumentError.value(
        width,
        'width',
        'Must be finite and non-negative.',
      );
    }

    if (width < ResponsiveBreakpoints.compactTabletMinWidth) {
      return mobile;
    }
    if (width < ResponsiveBreakpoints.tabletMinWidth) {
      return compactTablet;
    }
    if (width < ResponsiveBreakpoints.desktopMinWidth) {
      return tablet;
    }
    if (width < ResponsiveBreakpoints.largeDesktopMinWidth) {
      return desktop;
    }
    return largeDesktop;
  }
}

abstract final class ResponsiveBreakpoints {
  static const double compactTabletMinWidth = 600;
  static const double tabletMinWidth = 768;
  static const double desktopMinWidth = 1024;
  static const double largeDesktopMinWidth = 1440;
}

abstract final class ResponsiveLayout {
  static const double maxContentWidth = 1440;

  static double horizontalPagePadding(ScreenClass screenClass) {
    return switch (screenClass) {
      ScreenClass.mobile => 16,
      ScreenClass.compactTablet => 24,
      ScreenClass.tablet => 24,
      ScreenClass.desktop => 32,
      ScreenClass.largeDesktop => 32,
    };
  }
}
