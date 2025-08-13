import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double _kTabHeight = 46.0;
const double _kTextAndIconTabHeight = 72.0;
const double _kStartOffset = 52.0;
const double _kRadius = 25.0;

class _TabStyle extends AnimatedWidget {
  const _TabStyle({
    required Animation<double> animation,
    required this.isSelected,
    required this.isPrimary,
    required this.labelColor,
    required this.unselectedLabelColor,
    required this.labelStyle,
    required this.unselectedLabelStyle,
    required this.defaults,
    required this.child,
    required this.tabForegroundColor, // Added to ensure text visibility
  }) : super(listenable: animation);

  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool isSelected;
  final bool isPrimary;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TabBarThemeData defaults;
  final Widget child;
  final Color tabForegroundColor; // Added to contrast with indicator background

  WidgetStateColor _resolveWithLabelColor(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TabBarThemeData tabBarTheme = TabBarTheme.of(context);
    final Animation<double> animation = listenable as Animation<double>;

    Color selectedColor =
        labelColor ??
        tabBarTheme.labelColor ??
        labelStyle?.color ??
        tabBarTheme.labelStyle?.color ??
        defaults.labelColor!;

    final Color unselectedColor;

    if (selectedColor is WidgetStateColor) {
      unselectedColor = selectedColor.resolve(const <WidgetState>{});
      selectedColor = selectedColor.resolve(const <WidgetState>{
        WidgetState.selected,
      });
    } else {
      unselectedColor =
          unselectedLabelColor ??
          tabBarTheme.unselectedLabelColor ??
          unselectedLabelStyle?.color ??
          tabBarTheme.unselectedLabelStyle?.color ??
          (themeData.useMaterial3
              ? defaults.unselectedLabelColor!
              : selectedColor.withAlpha(0xB2)); // 70% alpha
    }

    // Ensure selected text is visible against tabForegroundColor
    if (selectedColor == tabForegroundColor ||
        selectedColor == tabForegroundColor.withOpacity(0.8)) {
      selectedColor = Colors.black; // Fallback to black for contrast
    }

    return WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Color.lerp(selectedColor, unselectedColor, animation.value)!;
      }
      return Color.lerp(unselectedColor, selectedColor, animation.value)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TabBarThemeData tabBarTheme = TabBarTheme.of(context);
    final Animation<double> animation = listenable as Animation<double>;

    final Set<WidgetState> states =
        isSelected
            ? const <WidgetState>{WidgetState.selected}
            : const <WidgetState>{};

    // To enable TextStyle.lerp(style1, style2, value), both styles must have
    // the same value of inherit. Force that to be inherit=true here.
    final TextStyle selectedStyle = (labelStyle ??
            tabBarTheme.labelStyle ??
            defaults.labelStyle!)
        .copyWith(inherit: true);
    final TextStyle unselectedStyle = (unselectedLabelStyle ??
            tabBarTheme.unselectedLabelStyle ??
            labelStyle ??
            defaults.unselectedLabelStyle!)
        .copyWith(inherit: true);
    final TextStyle textStyle =
        isSelected
            ? TextStyle.lerp(selectedStyle, unselectedStyle, animation.value)!
            : TextStyle.lerp(unselectedStyle, selectedStyle, animation.value)!;
    final Color color = _resolveWithLabelColor(context).resolve(states);

    return DefaultTextStyle(
      style: textStyle.copyWith(color: color),
      child: IconTheme.merge(
        data: IconThemeData(size: 24.0, color: color),
        child: child,
      ),
    );
  }
}

typedef _LayoutCallback =
    void Function(
      List<double> xOffsets,
      TextDirection textDirection,
      double width,
    );

class _TabLabelBarRenderer extends RenderFlex {
  _TabLabelBarRenderer({
    required super.direction,
    required super.mainAxisSize,
    required super.mainAxisAlignment,
    required super.crossAxisAlignment,
    required TextDirection super.textDirection,
    required super.verticalDirection,
    required this.onPerformLayout,
  });

  _LayoutCallback onPerformLayout;

  @override
  void performLayout() {
    super.performLayout();
    // xOffsets will contain childCount+1 values, giving the offsets of the
    // leading edge of the first tab as the first value, of the leading edge of
    // the each subsequent tab as each subsequent value, and of the trailing
    // edge of the last tab as the last value.
    RenderBox? child = firstChild;
    final List<double> xOffsets = <double>[];
    while (child != null) {
      final FlexParentData childParentData =
          child.parentData! as FlexParentData;
      xOffsets.add(childParentData.offset.dx);
      assert(child.parentData == childParentData);
      child = childParentData.nextSibling;
    }
    assert(textDirection != null);
    switch (textDirection!) {
      case TextDirection.rtl:
        xOffsets.insert(0, size.width);
      case TextDirection.ltr:
        xOffsets.add(size.width);
    }
    onPerformLayout(xOffsets, textDirection!, size.width);
  }
}

// This class and its renderer class only exist to report the widths of the tabs
// upon layout. The tab widths are only used at paint time (see _IndicatorPainter)
// or in response to input.
class _TabLabelBar extends Flex {
  const _TabLabelBar({
    super.children,
    required this.onPerformLayout,
    required super.mainAxisSize,
  }) : super(
         direction: Axis.horizontal,
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         verticalDirection: VerticalDirection.down,
       );

  final _LayoutCallback onPerformLayout;

  @override
  RenderFlex createRenderObject(BuildContext context) {
    return _TabLabelBarRenderer(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: getEffectiveTextDirection(context)!,
      verticalDirection: verticalDirection,
      onPerformLayout: onPerformLayout,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _TabLabelBarRenderer renderObject,
  ) {
    super.updateRenderObject(context, renderObject);
    renderObject.onPerformLayout = onPerformLayout;
  }
}

double _indexChangeProgress(TabController controller) {
  final double controllerValue = controller.animation!.value;
  final double previousIndex = controller.previousIndex.toDouble();
  final double currentIndex = controller.index.toDouble();

  // The controller's offset is changing because the user is dragging the
  // TabBarView's PageView to the left or right.
  if (!controller.indexIsChanging) {
    return clampDouble((currentIndex - controllerValue).abs(), 0.0, 1.0);
  }

  // The TabController animation's value is changing from previousIndex to currentIndex.
  return (controllerValue - currentIndex).abs() /
      (currentIndex - previousIndex).abs();
}

class _DividerPainter extends CustomPainter {
  _DividerPainter({required this.dividerColor, required this.dividerHeight});

  final Color dividerColor;
  final double dividerHeight;

  @override
  void paint(Canvas canvas, Size size) {
    if (dividerHeight <= 0.0) {
      return;
    }

    final Paint paint =
        Paint()
          ..color = dividerColor
          ..strokeWidth = dividerHeight;

    canvas.drawLine(
      Offset(0, size.height - (paint.strokeWidth / 2)),
      Offset(size.width, size.height - (paint.strokeWidth / 2)),
      paint,
    );
  }

  @override
  bool shouldRepaint(_DividerPainter oldDelegate) {
    return oldDelegate.dividerColor != dividerColor ||
        oldDelegate.dividerHeight != dividerHeight;
  }
}

class _IndicatorPainter extends CustomPainter {
  _IndicatorPainter({
    required this.controller,
    required this.indicator,
    required this.indicatorSize,
    required this.tabKeys,
    required _IndicatorPainter? old,
    required this.indicatorPadding,
    required this.labelPaddings,
    this.dividerColor,
    this.dividerHeight,
    required this.showDivider,
    this.devicePixelRatio,
    required this.indicatorAnimation,
    required this.textDirection,
    required this.tabBorderColor,
    required this.tabForegroundColor,
    required this.tabs, // Added to access tab text
  }) : super(repaint: controller.animation) {
    if (kFlutterMemoryAllocationsEnabled) {
      FlutterMemoryAllocations.instance.dispatchObjectCreated(
        library: 'package:flutter/material.dart',
        className: '$_IndicatorPainter',
        object: this,
      );
    }
    if (old != null) {
      saveTabOffsets(old._currentTabOffsets, old._currentTextDirection);
    }
  }

  final TabController controller;
  final Decoration indicator;
  final TabBarIndicatorSize indicatorSize;
  final EdgeInsetsGeometry indicatorPadding;
  final List<GlobalKey> tabKeys;
  final List<EdgeInsetsGeometry> labelPaddings;
  final Color? dividerColor;
  final Color tabBorderColor;
  final Color tabForegroundColor;
  final double? dividerHeight;
  final bool showDivider;
  final double? devicePixelRatio;
  final TabIndicatorAnimation indicatorAnimation;
  final TextDirection textDirection;
  final List<Widget> tabs; // Added to access tab text

  List<double>? _currentTabOffsets;
  TextDirection? _currentTextDirection;
  Rect? _currentRect;
  BoxPainter? _painter;
  bool _needsPaint = false;

  void markNeedsPaint() {
    _needsPaint = true;
  }

  void dispose() {
    if (kFlutterMemoryAllocationsEnabled) {
      FlutterMemoryAllocations.instance.dispatchObjectDisposed(object: this);
    }
    _painter?.dispose();
  }

  void saveTabOffsets(List<double>? tabOffsets, TextDirection? textDirection) {
    _currentTabOffsets = tabOffsets;
    _currentTextDirection = textDirection;
  }

  int get maxTabIndex => _currentTabOffsets!.length - 2;

  double centerOf(int tabIndex) {
    assert(_currentTabOffsets != null);
    assert(_currentTabOffsets!.isNotEmpty);
    assert(tabIndex >= 0);
    assert(tabIndex <= maxTabIndex);
    return (_currentTabOffsets![tabIndex] + _currentTabOffsets![tabIndex + 1]) /
        2.0;
  }

  Rect indicatorRect(Size tabBarSize, int tabIndex) {
    assert(_currentTabOffsets != null);
    assert(_currentTextDirection != null);
    assert(_currentTabOffsets!.isNotEmpty);
    assert(tabIndex >= 0);
    assert(tabIndex <= maxTabIndex);
    double tabLeft, tabRight;
    (tabLeft, tabRight) = switch (_currentTextDirection!) {
      TextDirection.rtl => (
        _currentTabOffsets![tabIndex + 1],
        _currentTabOffsets![tabIndex],
      ),
      TextDirection.ltr => (
        _currentTabOffsets![tabIndex],
        _currentTabOffsets![tabIndex + 1],
      ),
    };

    if (indicatorSize == TabBarIndicatorSize.label) {
      final RenderBox? renderBox =
          tabKeys[tabIndex].currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) {
        print('Warning: tabKeys[$tabIndex] has no RenderBox');
        return Rect.zero;
      }
      final double tabWidth = renderBox.size.width;
      final EdgeInsetsGeometry labelPadding = labelPaddings[tabIndex];
      final EdgeInsets insets = labelPadding.resolve(_currentTextDirection);
      final double delta =
          ((tabRight - tabLeft) - (tabWidth + insets.horizontal)) / 2.0;
      tabLeft += delta + insets.left;
      tabRight = tabLeft + tabWidth;
    }

    final EdgeInsets insets = indicatorPadding.resolve(_currentTextDirection);
    final Rect rect = Rect.fromLTWH(
      tabLeft,
      0.0,
      tabRight - tabLeft,
      tabBarSize.height * 0.7,
    ); // Use size.height for consistency
    if (!(rect.size >= insets.collapsedSize)) {
      print(
        'Error: indicatorPadding insets too large. Rect Size: ${rect.size}, Insets: $insets',
      );
      throw FlutterError(
        'indicatorPadding insets should be less than Tab Size\nRect Size: ${rect.size}, Insets: $insets',
      );
    }
    return insets.deflateRect(rect);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _needsPaint = false;

    const double _kRadius = 16.0;

    final double value = controller.animation!.value;
    final int to =
        controller.indexIsChanging
            ? controller.index
            : (textDirection == TextDirection.ltr
                    ? value.ceil()
                    : value.floor())
                .clamp(0, maxTabIndex);
    final int from =
        controller.indexIsChanging
            ? controller.previousIndex
            : (textDirection == TextDirection.ltr ? (to - 1) : (to + 1)).clamp(
              0,
              maxTabIndex,
            );

    final Rect toRect = indicatorRect(size, to);
    final Rect fromRect = indicatorRect(size, from);

    _currentRect = Rect.lerp(fromRect, toRect, (value - from).abs());
    _currentRect = switch (indicatorAnimation) {
      TabIndicatorAnimation.linear => _currentRect,
      TabIndicatorAnimation.elastic => _applyElasticEffect(
        fromRect,
        toRect,
        _currentRect!,
      ),
    };

    if (_currentRect == null) return;

    final Paint paint = Paint()..color = tabForegroundColor;
    final Paint borderPaint =
        Paint()
          ..color = tabBorderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    const double radius = _kRadius;
    const double gap = 3.0;

    // Calculate dynamic width from the selected tab
    final double sizeWidth =
        _currentTabOffsets![to + 1] - _currentTabOffsets![to];

    // Center the indicator horizontally on the tab position
    final double centerX = _currentRect!.center.dx;
    double leftX = centerX - sizeWidth / 2;
    double rightX = centerX + sizeWidth / 2;

    // Clamp so the bezier does not go out of bounds
    if (leftX < 0) {
      leftX = 0;
      rightX = sizeWidth * 2;
    } else if (rightX > size.width) {
      rightX = size.width;
      leftX = size.width - (sizeWidth * 2);
    }

    final path = Path();

    // ---- LEFT stretch ----
    if (to == 0) {
      // Remove left border for first index by starting at the top left edge
      path.moveTo(leftX, radius); // Start at the top left without left stretch
    } else {
      path.moveTo(0, size.height - gap);
      if (leftX > 0) {
        path.lineTo(leftX - radius, size.height - gap);
        path.quadraticBezierTo(leftX, size.height - gap, leftX, radius);
      } else {
        path.lineTo(leftX, radius);
      }
    }

    // ---- TOP bezier ----
    path.quadraticBezierTo(leftX, 0, leftX + radius, 0);
    path.lineTo(rightX - radius, 0);
    path.quadraticBezierTo(rightX, 0, rightX, radius);

    // ---- RIGHT stretch ----
    if (rightX < size.width) {
      path.quadraticBezierTo(
        rightX,
        size.height - gap,
        rightX + radius,
        size.height - gap,
      );
      path.lineTo(size.width, size.height - gap);
    } else {
      path.quadraticBezierTo(
        rightX,
        size.height - gap,
        size.width,
        size.height - gap,
      );
    }

    final path2 = Path.from(path);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(
      path2,
      Paint()
        ..color = tabBorderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, borderPaint);

    // Draw the selected tab's text on the indicator
    final int selectedIndex = controller.index;
    if (selectedIndex >= 0 && selectedIndex < tabs.length) {
      final Widget tab = tabs[selectedIndex];
      if (tab is Tab) {
        String? textToRender = tab.text;
        if (tab.child != null && tab.child is Text) {
          textToRender =
              (tab.child as Text).data; // Use child text if available
        }
        if (textToRender != null) {
          final TextPainter textPainter = TextPainter(
            text: TextSpan(
              text: textToRender,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            textDirection: textDirection,
            textAlign: TextAlign.center,
          );
          textPainter.layout(maxWidth: _currentRect!.width);
          final double textX =
              _currentRect!.left +
              (_currentRect!.width - textPainter.width) / 2;
          final double textY =
              _currentRect!.top +
              (_currentRect!.height - textPainter.height) / 2;
          textPainter.paint(canvas, Offset(textX, textY));
        } else {
          print(
            'Warning: Tab at index $selectedIndex has no text or child text',
          );
        }
      } else {
        print('Warning: Tab at index $selectedIndex is not a Tab widget');
      }
    } else {
      print(
        'Warning: Tabs is null or selected index $selectedIndex out of bounds for tabs length ${tabs.length}',
      );
    }

    print(
      'Painting indicator: left=$leftX, right=$rightX, height=${size.height}, rect=$_currentRect',
    );
  }

  Rect _applyElasticEffect(Rect fromRect, Rect toRect, Rect currentRect) {
    if (controller.animation!.isCompleted) {
      return currentRect;
    }

    final double index = controller.index.toDouble();
    final double value = controller.animation!.value;
    final double tabChangeProgress;

    if (controller.indexIsChanging) {
      double progressLeft = (index - value).abs();
      final int tabsDelta = (controller.index - controller.previousIndex).abs();
      if (tabsDelta != 0) {
        progressLeft /= tabsDelta;
      }
      tabChangeProgress = 1 - clampDouble(progressLeft, 0.0, 1.0);
    } else {
      tabChangeProgress = (index - value).abs();
    }

    if (tabChangeProgress == 1.0) {
      return currentRect;
    }

    final double leftFraction;
    final double rightFraction;
    final bool isMovingRight = switch (textDirection) {
      TextDirection.ltr =>
        controller.indexIsChanging ? index > value : value > index,
      TextDirection.rtl =>
        controller.indexIsChanging ? value > index : index > value,
    };
    if (isMovingRight) {
      leftFraction = accelerateInterpolation(tabChangeProgress);
      rightFraction = decelerateInterpolation(tabChangeProgress);
    } else {
      leftFraction = decelerateInterpolation(tabChangeProgress);
      rightFraction = accelerateInterpolation(tabChangeProgress);
    }

    final double lerpRectLeft =
        lerpDouble(fromRect.left, toRect.left, leftFraction)!;
    final double lerpRectRight =
        lerpDouble(fromRect.right, toRect.right, rightFraction)!;

    return Rect.fromLTRB(
      lerpRectLeft,
      currentRect.top,
      lerpRectRight,
      currentRect.bottom,
    );
  }

  double decelerateInterpolation(double fraction) {
    return math.sin((fraction * math.pi) / 2.0);
  }

  double accelerateInterpolation(double fraction) {
    return 1.0 - math.cos((fraction * math.pi) / 2.0);
  }

  @override
  bool shouldRepaint(_IndicatorPainter old) {
    return _needsPaint ||
        controller != old.controller ||
        indicator != old.indicator ||
        tabKeys.length != old.tabKeys.length ||
        (!listEquals(_currentTabOffsets, old._currentTabOffsets)) ||
        _currentTextDirection != old._currentTextDirection ||
        tabForegroundColor != old.tabForegroundColor ||
        tabBorderColor != old.tabBorderColor ||
        tabs != old.tabs; // Added to trigger repaint on tab change
  }
}

class CustomBackgroundPainter extends CustomPainter {
  final Color tabBackgroundColor;

  const CustomBackgroundPainter({required this.tabBackgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = _kRadius;
    final path =
        Path()
          ..moveTo(0, radius)
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height)
          ..lineTo(size.width, radius)
          ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
          ..lineTo(radius, 0)
          ..quadraticBezierTo(0, 0, 0, radius);

    canvas.drawPath(
      path,
      Paint()
        ..color = tabBackgroundColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ChangeAnimation extends Animation<double>
    with AnimationWithParentMixin<double> {
  _ChangeAnimation(this.controller);

  final TabController controller;

  @override
  Animation<double> get parent => controller.animation!;

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    if (controller.animation != null) {
      super.removeStatusListener(listener);
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    if (controller.animation != null) {
      super.removeListener(listener);
    }
  }

  @override
  double get value => _indexChangeProgress(controller);
}

class _DragAnimation extends Animation<double>
    with AnimationWithParentMixin<double> {
  _DragAnimation(this.controller, this.index);

  final TabController controller;
  final int index;

  @override
  Animation<double> get parent => controller.animation!;

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    if (controller.animation != null) {
      super.removeStatusListener(listener);
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    if (controller.animation != null) {
      super.removeListener(listener);
    }
  }

  @override
  double get value {
    assert(!controller.indexIsChanging);
    final double controllerMaxValue = (controller.length - 1).toDouble();
    final double controllerValue = clampDouble(
      controller.animation!.value,
      0.0,
      controllerMaxValue,
    );
    return clampDouble((controllerValue - index.toDouble()).abs(), 0.0, 1.0);
  }
}

// This class, and TabBarScrollController, only exist to handle the case
// where a scrollable TabBar has a non-zero initialIndex. In that case we can
// only compute the scroll position's initial scroll offset (the "correct"
// pixels value) after the TabBar viewport width and scroll limits are known.
class _TabBarScrollPosition extends ScrollPositionWithSingleContext {
  _TabBarScrollPosition({
    required super.physics,
    required super.context,
    required super.oldPosition,
    required this.tabBar,
  }) : super(initialPixels: null);

  final _MyCustomTabBarState tabBar;

  bool _viewportDimensionWasNonZero = false;

  // The scroll position should be adjusted at least once.
  bool _needsPixelsCorrection = true;

  @override
  bool applyContentDimensions(double minScrollExtent, double maxScrollExtent) {
    bool result = true;
    if (!_viewportDimensionWasNonZero) {
      _viewportDimensionWasNonZero = viewportDimension != 0.0;
    }
    // If the viewport never had a non-zero dimension, we just want to jump
    // to the initial scroll position to avoid strange scrolling effects in
    // release mode: the viewport temporarily may have a dimension of zero
    // before the actual dimension is calculated. In that scenario, setting
    // the actual dimension would cause a strange scroll effect without this
    // guard because the super call below would start a ballistic scroll activity.
    if (!_viewportDimensionWasNonZero || _needsPixelsCorrection) {
      _needsPixelsCorrection = false;
      correctPixels(
        tabBar._initialScrollOffset(
          viewportDimension,
          minScrollExtent,
          maxScrollExtent,
        ),
      );
      result = false;
    }
    return super.applyContentDimensions(minScrollExtent, maxScrollExtent) &&
        result;
  }

  void markNeedsPixelsCorrection() {
    _needsPixelsCorrection = true;
  }
}

// This class, and TabBarScrollPosition, only exist to handle the case
// where a scrollable TabBar has a non-zero initialIndex.
class _TabBarScrollController extends ScrollController {
  _TabBarScrollController(this.tabBar);

  final _MyCustomTabBarState tabBar;

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    return _TabBarScrollPosition(
      physics: physics,
      context: context,
      oldPosition: oldPosition,
      tabBar: tabBar,
    );
  }
}

/// A Material Design primary tab bar.
///
/// Primary tabs are placed at the top of the content pane under a top app bar.
/// They display the main content destinations.
///
/// Typically created as the [AppBar.bottom] part of an [AppBar] and in
/// conjunction with a [TabBarView].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=POtoEH-5l40}
///
/// If a [TabController] is not provided, then a [DefaultTabController] ancestor
/// must be provided instead. The tab controller's [TabController.length] must
/// equal the length of the [tabs] list and the length of the
/// [TabBarView.children] list.
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// Uses values from [TabBarThemeData] if it is set in the current context.
///
/// {@tool dartpad}
/// This sample shows the implementation of [MyCustomTabBar] and [TabBarView] using a [DefaultTabController].
/// Each [Tab] corresponds to a child of the [TabBarView] in the order they are written.
///
/// ** See code in examples/api/lib/material/tabs/tab_bar.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// [MyCustomTabBar] can also be implemented by using a [TabController] which provides more options
/// to control the behavior of the [MyCustomTabBar] and [TabBarView]. This can be used instead of
/// a [DefaultTabController], demonstrated below.
///
/// ** See code in examples/api/lib/material/tabs/tab_bar.1.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This sample showcases nested Material 3 [MyCustomTabBar]s. It consists of a primary
/// [MyCustomTabBar] with nested a secondary [MyCustomTabBar]. The primary [MyCustomTabBar] uses a
/// [DefaultTabController] while the secondary [MyCustomTabBar] uses a [TabController].
///
/// ** See code in examples/api/lib/material/tabs/tab_bar.2.dart **
/// {@end-tool}
///
/// See also:
///
///  * [TabBar.secondary], for a secondary tab bar.
///  * [TabBarView], which displays page views that correspond to each tab.
///  * [TabController], which coordinates tab selection between a [MyCustomTabBar] and a [TabBarView].
///  * https://m3.material.io/components/tabs/overview, the Material 3
///     tab bar specification.
class MyCustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  /// Creates a Material Design primary tab bar.
  ///
  /// The length of the [tabs] argument must match the [controller]'s
  /// [TabController.length].
  ///
  /// If a [TabController] is not provided, then there must be a
  /// [DefaultTabController] ancestor.
  ///
  /// The [indicatorWeight] parameter defaults to 2.
  ///
  /// The [indicatorPadding] parameter defaults to [EdgeInsets.zero].
  ///
  /// If [indicator] is not null or provided from [TabBarTheme],
  /// then [indicatorWeight] and [indicatorColor] are ignored.
  const MyCustomTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicatorColor,
    this.tabBackgroundColor = Colors.blue,
    this.tabBorderColor = Colors.green,
    this.tabForegroundColor = Colors.white,
    this.automaticIndicatorColorAdjustment = true,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize,
    this.dividerColor,
    this.dividerHeight = 0,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.overlayColor,
    this.mouseCursor,
    this.enableFeedback,
    this.onTap,
    this.physics,
    this.splashFactory,
    this.splashBorderRadius,
    this.tabAlignment,
    this.textScaler,
    this.indicatorAnimation,
  }) : _isPrimary = true,
       assert(indicator != null || (indicatorWeight > 0.0));

  /// Creates a Material Design secondary tab bar.
  ///
  /// Secondary tabs are used within a content area to further separate related
  /// content and establish hierarchy.
  ///
  /// {@tool dartpad}
  /// This sample showcases nested Material 3 [MyCustomTabBar]s. It consists of a primary
  /// [MyCustomTabBar] with nested a secondary [MyCustomTabBar]. The primary [MyCustomTabBar] uses a
  /// [DefaultTabController] while the secondary [MyCustomTabBar] uses a [TabController].
  ///
  /// ** See code in examples/api/lib/material/tabs/tab_bar.2.dart **
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [MyCustomTabBar], for a primary tab bar.
  ///  * [TabBarView], which displays page views that correspond to each tab.
  ///  * [TabController], which coordinates tab selection between a [MyCustomTabBar] and a [TabBarView].
  ///  * https://m3.material.io/components/tabs/overview, the Material 3
  ///     tab bar specification.
  const MyCustomTabBar.secondary({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicatorColor,
    this.tabBackgroundColor = Colors.blue,
    this.tabBorderColor = Colors.green,
    this.tabForegroundColor = Colors.white,
    this.automaticIndicatorColorAdjustment = true,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize,
    this.dividerColor,
    this.dividerHeight = 0,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.overlayColor,
    this.mouseCursor,
    this.enableFeedback,
    this.onTap,
    this.physics,
    this.splashFactory,
    this.splashBorderRadius,
    this.tabAlignment,
    this.textScaler,
    this.indicatorAnimation,
  }) : _isPrimary = false,
       assert(indicator != null || (indicatorWeight > 0.0));

  /// Typically a list of two or more [Tab] widgets.
  ///
  /// The length of this list must match the [controller]'s [TabController.length]
  /// and the length of the [TabBarView.children] list.
  final List<Widget> tabs;

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// Whether this tab bar can be scrolled horizontally.
  ///
  /// If [isScrollable] is true, then each tab is as wide as needed for its label
  /// and the entire [MyCustomTabBar] is scrollable. Otherwise each tab gets an equal
  /// share of the available space.
  final bool isScrollable;

  /// The amount of space by which to inset the tab bar.
  ///
  /// When [isScrollable] is false, this will yield the same result as if [MyCustomTabBar] was wrapped
  /// in a [Padding] widget. When [isScrollable] is true, the scrollable itself is inset,
  /// allowing the padding to scroll with the tab bar, rather than enclosing it.
  final EdgeInsetsGeometry? padding;

  /// The color of the line that appears below the selected tab.
  ///
  /// If this parameter is null, then the value of the Theme's indicatorColor
  /// property is used.
  ///
  /// If [indicator] is specified or provided from [TabBarThemeData],
  /// this property is ignored.
  final Color? indicatorColor;
  final Color tabBackgroundColor;
  final Color tabForegroundColor;
  final Color tabBorderColor;

  /// The thickness of the line that appears below the selected tab.
  ///
  /// The value of this parameter must be greater than zero.
  ///
  /// If [ThemeData.useMaterial3] is true and [MyCustomTabBar] is used to create a
  /// primary tab bar, the default value is 3.0. If the provided value is less
  /// than 3.0, the default value is used.
  ///
  /// If [ThemeData.useMaterial3] is true and [TabBar.secondary] is used to
  /// create a secondary tab bar, the default value is 2.0.
  ///
  /// If [ThemeData.useMaterial3] is false, the default value is 2.0.
  ///
  /// If [indicator] is specified or provided from [TabBarThemeData],
  /// this property is ignored.
  final double indicatorWeight;

  /// The padding for the indicator.
  ///
  /// The default value of this property is [EdgeInsets.zero].
  ///
  /// For [isScrollable] tab bars, specifying [kTabLabelPadding] will align
  /// the indicator with the tab's text for [Tab] widgets and all but the
  /// shortest [Tab.text] values.
  final EdgeInsetsGeometry indicatorPadding;

  /// Defines the appearance of the selected tab indicator.
  ///
  /// If [indicator] is specified or provided from [TabBarThemeData],
  /// the [indicatorColor] and [indicatorWeight] properties are ignored.
  ///
  /// The default, underline-style, selected tab indicator can be defined with
  /// [UnderlineTabIndicator].
  ///
  /// The indicator's size is based on the tab's bounds. If [indicatorSize]
  /// is [TabBarIndicatorSize.tab] the tab's bounds are as wide as the space
  /// occupied by the tab in the tab bar. If [indicatorSize] is
  /// [TabBarIndicatorSize.label], then the tab's bounds are only as wide as
  /// the tab widget itself.
  ///
  /// See also:
  ///
  ///  * [splashBorderRadius], which defines the clipping radius of the splash
  ///    and is generally used with [BoxDecoration.borderRadius].
  final Decoration? indicator;

  /// Whether this tab bar should automatically adjust the [indicatorColor].
  ///
  /// The default value of this property is true.
  ///
  /// If [automaticIndicatorColorAdjustment] is true,
  /// then the [indicatorColor] will be automatically adjusted to [Colors.white]
  /// when the [indicatorColor] is same as [Material.color] of the [Material]
  /// parent widget.
  final bool automaticIndicatorColorAdjustment;

  /// Defines how the selected tab indicator's size is computed.
  ///
  /// The size of the selected tab indicator is defined relative to the
  /// tab's overall bounds if [indicatorSize] is [TabBarIndicatorSize.tab]
  /// (the default) or relative to the bounds of the tab's widget if
  /// [indicatorSize] is [TabBarIndicatorSize.label].
  ///
  /// The selected tab's location appearance can be refined further with
  /// the [indicatorColor], [indicatorWeight], [indicatorPadding], and
  /// [indicator] properties.
  final TabBarIndicatorSize? indicatorSize;

  /// The color of the divider.
  ///
  /// If the [dividerColor] is [Colors.transparent], then the divider will not be drawn.
  ///
  /// If null and [ThemeData.useMaterial3] is false, [TabBarThemeData.dividerColor]
  /// color is used. If that is null and [ThemeData.useMaterial3] is true,
  /// [ColorScheme.outlineVariant] will be used, otherwise divider will not be drawn.
  final Color? dividerColor;

  /// The height of the divider.
  ///
  /// If the [dividerHeight] is zero or negative, then the divider will not be drawn.
  ///
  /// If null and [ThemeData.useMaterial3] is true, [TabBarThemeData.dividerHeight] is used.
  /// If that is also null and [ThemeData.useMaterial3] is true, 1.0 will be used.
  /// Otherwise divider will not be drawn.
  final double? dividerHeight;

  /// The color of selected tab labels.
  ///
  /// If null, then [TabBarThemeData.labelColor] is used. If that is also null and
  /// [ThemeData.useMaterial3] is true, [ColorScheme.primary] will be used,
  /// otherwise the color of the [ThemeData.primaryTextTheme]'s
  /// [TextTheme.bodyLarge] text color is used.
  ///
  /// If [labelColor] (or, if null, [TabBarThemeData.labelColor]) is a
  /// [WidgetStateColor], then the effective tab color will depend on the
  /// [WidgetState.selected] state, i.e. if the [Tab] is selected or not,
  /// ignoring [unselectedLabelColor] even if it's non-null.
  ///
  /// When this color or the [TabBarThemeData.labelColor] is specified, it overrides
  /// the [TextStyle.color] specified for the [labelStyle] or the
  /// [TabBarThemeData.labelStyle].
  ///
  /// See also:
  ///
  ///   * [unselectedLabelColor], for color of unselected tab labels.
  final Color? labelColor;

  /// The color of unselected tab labels.
  ///
  /// If [labelColor] (or, if null, [TabBarThemeData.labelColor]) is a
  /// [WidgetStateColor], then the unselected tabs are rendered with
  /// that [WidgetStateColor]'s resolved color for unselected state, even if
  /// [unselectedLabelColor] is non-null.
  ///
  /// If null, then [TabBarThemeData.unselectedLabelColor] is used. If that is also
  /// null and [ThemeData.useMaterial3] is true, [ColorScheme.onSurfaceVariant]
  /// will be used, otherwise unselected tab labels are rendered with
  /// [labelColor] at 70% opacity.
  ///
  /// When this color or the [TabBarThemeData.unselectedLabelColor] is specified, it
  /// overrides the [TextStyle.color] specified for the [unselectedLabelStyle]
  /// or the [TabBarThemeData.unselectedLabelStyle].
  ///
  /// See also:
  ///
  ///  * [labelColor], for color of selected tab labels.
  final Color? unselectedLabelColor;

  /// The text style of the selected tab labels.
  ///
  /// The color specified in [labelStyle] and [TabBarThemeData.labelStyle] is used
  /// to style the label when [labelColor] or [TabBarThemeData.labelColor] are not
  /// specified.
  ///
  /// If [unselectedLabelStyle] is null, then this text style will be used for
  /// both selected and unselected label styles.
  ///
  /// If this property is null, then [TabBarThemeData.labelStyle] will be used.
  ///
  /// If that is also null and [ThemeData.useMaterial3] is true, [TextTheme.titleSmall]
  /// will be used, otherwise the text style of the [ThemeData.primaryTextTheme]'s
  /// [TextTheme.bodyLarge] definition is used.
  final TextStyle? labelStyle;

  /// The text style of the unselected tab labels.
  ///
  /// The color specified in [unselectedLabelStyle] and [TabBarThemeData.unselectedLabelStyle]
  /// is used to style the label when [unselectedLabelColor] or [TabBarThemeData.unselectedLabelColor]
  /// are not specified.
  ///
  /// If this property is null, then [TabBarThemeData.unselectedLabelStyle] will be used.
  ///
  /// If that is also null and [ThemeData.useMaterial3] is true, [TextTheme.titleSmall]
  /// will be used, otherwise then the [labelStyle] value is used. If [labelStyle] is null,
  /// the text style of the [ThemeData.primaryTextTheme]'s [TextTheme.bodyLarge]
  /// definition is used.
  final TextStyle? unselectedLabelStyle;

  /// The padding added to each of the tab labels.
  ///
  /// If there are few tabs with both icon and text and few
  /// tabs with only icon or text, this padding is vertically
  /// adjusted to provide uniform padding to all tabs.
  ///
  /// If this property is null, then [kTabLabelPadding] is used.
  final EdgeInsetsGeometry? labelPadding;

  /// Defines the ink response focus, hover, and splash colors.
  ///
  /// If non-null, it is resolved against one of [WidgetState.focused],
  /// [WidgetState.hovered], and [WidgetState.pressed].
  ///
  /// [WidgetState.pressed] triggers a ripple (an ink splash), per
  /// the current Material Design spec.
  ///
  /// If the overlay color is null or resolves to null, then if [ThemeData.useMaterial3] is
  /// false, the default values for [InkResponse.focusColor], [InkResponse.hoverColor], [InkResponse.splashColor],
  /// and [InkResponse.highlightColor] will be used instead. If [ThemeData.useMaterial3]
  /// if true, the default values are:
  /// * selected:
  ///   * pressed - ThemeData.colorScheme.primary(0.1)
  ///   * hovered - ThemeData.colorScheme.primary(0.08)
  ///   * focused - ThemeData.colorScheme.primary(0.1)
  /// * pressed - ThemeData.colorScheme.primary(0.1)
  /// * hovered - ThemeData.colorScheme.onSurface(0.08)
  /// * focused - ThemeData.colorScheme.onSurface(0.1)
  final WidgetStateProperty<Color?>? overlayColor;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@template flutter.material.tabs.mouseCursor}
  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// individual tab widgets.
  ///
  /// If [mouseCursor] is a [WidgetStateProperty<MouseCursor>],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.selected].
  /// {@endtemplate}
  ///
  /// If null, then the value of [TabBarThemeData.mouseCursor] is used. If
  /// that is also null, then [WidgetStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  ///  * [WidgetStateMouseCursor], which can be used to create a [MouseCursor]
  ///    that is also a [WidgetStateProperty<MouseCursor>].
  final MouseCursor? mouseCursor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a long-press
  /// will produce a short vibration, when feedback is enabled.
  ///
  /// Defaults to true.
  final bool? enableFeedback;

  /// An optional callback that's called when the [MyCustomTabBar] is tapped.
  ///
  /// The callback is applied to the index of the tab where the tap occurred.
  ///
  /// This callback has no effect on the default handling of taps. It's for
  /// applications that want to do a little extra work when a tab is tapped,
  /// even if the tap doesn't change the TabController's index. TabBar [onTap]
  /// callbacks should not make changes to the TabController since that would
  /// interfere with the default tap handler.
  final ValueChanged<int>? onTap;

  /// How the [MyCustomTabBar]'s scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to animate after the
  /// user stops dragging the scroll view.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// Creates the tab bar's [InkWell] splash factory, which defines
  /// the appearance of "ink" splashes that occur in response to taps.
  ///
  /// Use [NoSplash.splashFactory] to defeat ink splash rendering. For example
  /// to defeat both the splash and the hover/pressed overlay, but not the
  /// keyboard focused overlay:
  ///
  /// ```dart
  /// TabBar(
  ///   splashFactory: NoSplash.splashFactory,
  ///   overlayColor: WidgetStateProperty.resolveWith<Color?>(
  ///     (Set<WidgetState> states) {
  ///       return states.contains(WidgetState.focused) ? null : Colors.transparent;
  ///     },
  ///   ),
  ///   tabs: const <Widget>[
  ///     // ...
  ///   ],
  /// )
  /// ```
  final InteractiveInkFeatureFactory? splashFactory;

  /// Defines the clipping radius of splashes that extend outside the bounds of the tab.
  ///
  /// This can be useful to match the [BoxDecoration.borderRadius] provided as [indicator].
  ///
  /// ```dart
  /// TabBar(
  ///   indicator: BoxDecoration(
  ///     borderRadius: BorderRadius.circular(40),
  ///   ),
  ///   splashBorderRadius: BorderRadius.circular(40),
  ///   tabs: const <Widget>[
  ///     // ...
  ///   ],
  /// )
  /// ```
  ///
  /// If this property is null, it is interpreted as [BorderRadius.zero].
  final BorderRadius? splashBorderRadius;

  /// Specifies the horizontal alignment of the tabs within a [MyCustomTabBar].
  ///
  /// If [MyCustomTabBar.isScrollable] is false, only [TabAlignment.fill] and
  /// [TabAlignment.center] are supported. Otherwise an exception is thrown.
  ///
  /// If [MyCustomTabBar.isScrollable] is true, only [TabAlignment.start], [TabAlignment.startOffset],
  /// and [TabAlignment.center] are supported. Otherwise an exception is thrown.
  ///
  /// If this is null, then the value of [TabBarThemeData.tabAlignment] is used.
  ///
  /// If [TabBarThemeData.tabAlignment] is null and [ThemeData.useMaterial3] is true,
  /// then [TabAlignment.startOffset] is used if [isScrollable] is true,
  /// otherwise [TabAlignment.fill] is used.
  ///
  /// If [TabBarThemeData.tabAlignment] is null and [ThemeData.useMaterial3] is false,
  /// then [TabAlignment.center] is used if [isScrollable] is true,
  /// otherwise [TabAlignment.fill] is used.
  final TabAlignment? tabAlignment;

  /// Specifies the text scaling behavior for the [Tab] label.
  ///
  /// If this is null, then the value of [TabBarThemeData.textScaler] is used. If that is
  /// also null, then the text scaling behavior is determined by the [MediaQueryData.textScaler]
  /// from the ambient [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  ///
  /// See also:
  ///   * [TextScaler], which is used to scale text based on the device's text scale factor.
  final TextScaler? textScaler;

  /// Specifies the animation behavior of the tab indicator.
  ///
  /// If this is null, then the value of [TabBarThemeData.indicatorAnimation] is used.
  /// If that is also null, then the tab indicator will animate linearly if the
  /// [indicatorSize] is [TabBarIndicatorSize.tab], otherwise it will animate
  /// with an elastic effect if the [indicatorSize] is [TabBarIndicatorSize.label].
  ///
  /// {@tool dartpad}
  /// This sample shows how to customize the animation behavior of the tab indicator
  /// by using the [indicatorAnimation] property.
  ///
  /// ** See code in examples/api/lib/material/tabs/tab_bar.indicator_animation.0.dart **
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [TabIndicatorAnimation], which specifies the animation behavior of the tab indicator.
  final TabIndicatorAnimation? indicatorAnimation;

  /// A size whose height depends on if the tabs have both icons and text.
  ///
  /// [AppBar] uses this size to compute its own preferred size.
  @override
  Size get preferredSize {
    double maxHeight = _kTabHeight;
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight + indicatorWeight);
  }

  /// Returns whether the [MyCustomTabBar] contains a tab with both text and icon.
  ///
  /// [MyCustomTabBar] uses this to give uniform padding to all tabs in cases where
  /// there are some tabs with both text and icon and some which contain only
  /// text or icon.
  bool get tabHasTextAndIcon {
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        if (item.preferredSize.height == _kTextAndIconTabHeight) {
          return true;
        }
      }
    }
    return false;
  }

  /// Whether this tab bar is a primary tab bar.
  ///
  /// Otherwise, it is a secondary tab bar.
  final bool _isPrimary;

  @override
  State<MyCustomTabBar> createState() => _MyCustomTabBarState();
}

class _MyCustomTabBarState extends State<MyCustomTabBar> {
  ScrollController? _scrollController;
  TabController? _controller;
  _IndicatorPainter? _indicatorPainter;
  int? _currentIndex;
  late double _tabStripWidth;
  late List<GlobalKey> _tabKeys;
  late List<EdgeInsetsGeometry> _labelPaddings;
  bool _debugHasScheduledValidTabsCountCheck = false;

  @override
  void initState() {
    super.initState();
    // If indicatorSize is TabIndicatorSize.label, _tabKeys[i] is used to find
    // the width of tab widget i. See _IndicatorPainter.indicatorRect().
    _tabKeys = widget.tabs.map((Widget tab) => GlobalKey()).toList();
    _labelPaddings = List<EdgeInsetsGeometry>.filled(
      widget.tabs.length,
      EdgeInsets.zero,
      growable: true,
    );
  }

  TabBarThemeData get _defaults {
    if (Theme.of(context).useMaterial3) {
      return widget._isPrimary
          ? _TabsPrimaryDefaultsM3(context, widget.isScrollable)
          : _TabsSecondaryDefaultsM3(context, widget.isScrollable);
    } else {
      return _TabsDefaultsM2(context, widget.isScrollable);
    }
  }

  Decoration _getIndicator(TabBarIndicatorSize indicatorSize) {
    final ThemeData theme = Theme.of(context);
    final TabBarThemeData tabBarTheme = TabBarTheme.of(context);

    if (widget.indicator != null) {
      return widget.indicator!;
    }
    if (tabBarTheme.indicator != null) {
      return tabBarTheme.indicator!;
    }

    Color color =
        widget.indicatorColor ??
        tabBarTheme.indicatorColor ??
        _defaults.indicatorColor!;
    // ThemeData tries to avoid this by having indicatorColor avoid being the
    // primaryColor. However, it's possible that the tab bar is on a
    // Material that isn't the primaryColor. In that case, if the indicator
    // color ends up matching the material's color, then this overrides it.
    // When that happens, automatic transitions of the theme will likely look
    // ugly as the indicator color suddenly snaps to white at one end, but it's
    // not clear how to avoid that any further.
    //
    // The material's color might be null (if it's a transparency). In that case
    // there's no good way for us to find out what the color is so we don't.
    //
    // https://github.com/flutter/flutter/pull/68171#pullrequestreview-517753917
    if (widget.automaticIndicatorColorAdjustment &&
        color.colorSpace == Material.maybeOf(context)?.color?.colorSpace) {
      color = Colors.white;
    }

    final double effectiveIndicatorWeight =
        theme.useMaterial3
            ? math.max(widget.indicatorWeight, switch (widget._isPrimary) {
              true => _TabsPrimaryDefaultsM3.indicatorWeight(indicatorSize),
              false => _TabsSecondaryDefaultsM3.indicatorWeight,
            })
            : widget.indicatorWeight;
    // Only Material 3 primary TabBar with label indicatorSize should be rounded.
    final bool primaryWithLabelIndicator = switch (indicatorSize) {
      TabBarIndicatorSize.label => widget._isPrimary,
      TabBarIndicatorSize.tab => false,
    };
    final BorderRadius? effectiveBorderRadius =
        theme.useMaterial3 && primaryWithLabelIndicator
            ? BorderRadius.only(
              topLeft: Radius.circular(effectiveIndicatorWeight),
              topRight: Radius.circular(effectiveIndicatorWeight),
            )
            : null;
    return UnderlineTabIndicator(
      borderRadius: effectiveBorderRadius,
      borderSide: BorderSide(width: effectiveIndicatorWeight, color: color),
    );
  }

  // If the TabBar is rebuilt with a new tab controller, the caller should
  // dispose the old one. In that case the old controller's animation will be
  // null and should not be accessed.
  bool get _controllerIsValid => _controller?.animation != null;

  void _updateTabController() {
    final TabController? newController =
        widget.controller ?? DefaultTabController.maybeOf(context);
    assert(() {
      if (newController == null) {
        throw FlutterError(
          'No TabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must either provide an explicit '
          'TabController using the "controller" property, or you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());

    if (newController == _controller) {
      return;
    }

    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
      _controller!.removeListener(_handleTabControllerTick);
    }
    _controller = newController;
    if (_controller != null) {
      _controller!.animation!.addListener(_handleTabControllerAnimationTick);
      _controller!.addListener(_handleTabControllerTick);
      _currentIndex = _controller!.index;
    }
  }

  void _initIndicatorPainter() {
    final ThemeData theme = Theme.of(context);
    final TabBarThemeData tabBarTheme = TabBarTheme.of(context);
    final TabBarIndicatorSize indicatorSize =
        widget.indicatorSize ??
        tabBarTheme.indicatorSize ??
        _defaults.indicatorSize!;

    final _IndicatorPainter? oldPainter = _indicatorPainter;

    final TabIndicatorAnimation defaultTabIndicatorAnimation =
        switch (indicatorSize) {
          TabBarIndicatorSize.label => TabIndicatorAnimation.elastic,
          TabBarIndicatorSize.tab => TabIndicatorAnimation.linear,
        };

    _indicatorPainter =
        !_controllerIsValid
            ? null
            : _IndicatorPainter(
              tabs: widget.tabs,
              controller: _controller!,
              tabBorderColor: widget.tabBorderColor,
              tabForegroundColor: widget.tabForegroundColor,
              indicator: _getIndicator(indicatorSize),
              indicatorSize: indicatorSize,
              indicatorPadding: widget.indicatorPadding,
              tabKeys: _tabKeys,
              // Passing old painter so that the constructor can copy some values from it.
              old: oldPainter,
              labelPaddings: _labelPaddings,
              dividerColor:
                  widget.dividerColor ??
                  tabBarTheme.dividerColor ??
                  _defaults.dividerColor,
              dividerHeight:
                  widget.dividerHeight ??
                  tabBarTheme.dividerHeight ??
                  _defaults.dividerHeight,
              showDivider: theme.useMaterial3 && !widget.isScrollable,
              devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
              indicatorAnimation:
                  widget.indicatorAnimation ??
                  tabBarTheme.indicatorAnimation ??
                  defaultTabIndicatorAnimation,
              textDirection: Directionality.of(context),
            );

    oldPainter?.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert(debugCheckHasMaterial(context));
    _updateTabController();
    _initIndicatorPainter();
  }

  @override
  void didUpdateWidget(MyCustomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
      _initIndicatorPainter();
      // Adjust scroll position.
      if (_scrollController != null && _scrollController!.hasClients) {
        final ScrollPosition position = _scrollController!.position;
        if (position is _TabBarScrollPosition) {
          position.markNeedsPixelsCorrection();
        }
      }
    } else if (widget.indicatorColor != oldWidget.indicatorColor ||
        widget.indicatorWeight != oldWidget.indicatorWeight ||
        widget.indicatorSize != oldWidget.indicatorSize ||
        widget.indicatorPadding != oldWidget.indicatorPadding ||
        widget.indicator != oldWidget.indicator ||
        widget.dividerColor != oldWidget.dividerColor ||
        widget.dividerHeight != oldWidget.dividerHeight ||
        widget.indicatorAnimation != oldWidget.indicatorAnimation) {
      _initIndicatorPainter();
    }

    if (widget.tabs.length > _tabKeys.length) {
      final int delta = widget.tabs.length - _tabKeys.length;
      _tabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
      _labelPaddings.addAll(
        List<EdgeInsetsGeometry>.filled(delta, EdgeInsets.zero),
      );
    } else if (widget.tabs.length < _tabKeys.length) {
      _tabKeys.removeRange(widget.tabs.length, _tabKeys.length);
      _labelPaddings.removeRange(widget.tabs.length, _tabKeys.length);
    }
  }

  @override
  void dispose() {
    _indicatorPainter!.dispose();
    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
      _controller!.removeListener(_handleTabControllerTick);
    }
    _controller = null;
    _scrollController?.dispose();
    // We don't own the _controller Animation, so it's not disposed here.
    super.dispose();
  }

  int get maxTabIndex => _indicatorPainter!.maxTabIndex;

  double _tabScrollOffset(
    int index,
    double viewportWidth,
    double minExtent,
    double maxExtent,
  ) {
    if (!widget.isScrollable) {
      return 0.0;
    }
    double tabCenter = _indicatorPainter!.centerOf(index);
    double paddingStart;
    switch (Directionality.of(context)) {
      case TextDirection.rtl:
        paddingStart = widget.padding?.resolve(TextDirection.rtl).right ?? 0;
        tabCenter = _tabStripWidth - tabCenter;
      case TextDirection.ltr:
        paddingStart = widget.padding?.resolve(TextDirection.ltr).left ?? 0;
    }

    return clampDouble(
      tabCenter + paddingStart - viewportWidth / 2.0,
      minExtent,
      maxExtent,
    );
  }

  double _tabCenteredScrollOffset(int index) {
    final ScrollPosition position = _scrollController!.position;
    return _tabScrollOffset(
      index,
      position.viewportDimension,
      position.minScrollExtent,
      position.maxScrollExtent,
    );
  }

  double _initialScrollOffset(
    double viewportWidth,
    double minExtent,
    double maxExtent,
  ) {
    return _tabScrollOffset(
      _currentIndex!,
      viewportWidth,
      minExtent,
      maxExtent,
    );
  }

  void _scrollToCurrentIndex() {
    final double offset = _tabCenteredScrollOffset(_currentIndex!);
    _scrollController!.animateTo(
      offset,
      duration: kTabScrollDuration,
      curve: Curves.ease,
    );
  }

  void _scrollToControllerValue() {
    final double? leadingPosition =
        _currentIndex! > 0
            ? _tabCenteredScrollOffset(_currentIndex! - 1)
            : null;
    final double middlePosition = _tabCenteredScrollOffset(_currentIndex!);
    final double? trailingPosition =
        _currentIndex! < maxTabIndex
            ? _tabCenteredScrollOffset(_currentIndex! + 1)
            : null;

    final double index = _controller!.index.toDouble();
    final double value = _controller!.animation!.value;
    final double offset = switch (value - index) {
      -1.0 => leadingPosition ?? middlePosition,
      1.0 => trailingPosition ?? middlePosition,
      0 => middlePosition,
      < 0 =>
        leadingPosition == null
            ? middlePosition
            : lerpDouble(middlePosition, leadingPosition, index - value)!,
      _ =>
        trailingPosition == null
            ? middlePosition
            : lerpDouble(middlePosition, trailingPosition, value - index)!,
    };

    _scrollController!.jumpTo(offset);
  }

  void _handleTabControllerAnimationTick() {
    assert(mounted);
    if (!_controller!.indexIsChanging && widget.isScrollable) {
      // Sync the TabBar's scroll position with the TabBarView's PageView.
      _currentIndex = _controller!.index;
      _scrollToControllerValue();
    }
  }

  void _handleTabControllerTick() {
    if (_controller!.index != _currentIndex) {
      _currentIndex = _controller!.index;
      if (widget.isScrollable) {
        _scrollToCurrentIndex();
      }
    }
    setState(() {
      // Rebuild the tabs after a (potentially animated) index change
      // has completed.
    });
  }

  // Called each time layout completes.
  void _saveTabOffsets(
    List<double> tabOffsets,
    TextDirection textDirection,
    double width,
  ) {
    _tabStripWidth = width;
    _indicatorPainter?.saveTabOffsets(tabOffsets, textDirection);
  }

  void _handleTap(int index) {
    assert(index >= 0 && index < widget.tabs.length);
    _controller!.animateTo(index);
    widget.onTap?.call(index);
  }

  Widget _buildStyledTab(
    Widget child,
    bool isSelected,
    Animation<double> animation,
    TabBarThemeData defaults,
  ) {
    return _TabStyle(
      animation: animation,
      isSelected: isSelected,
      isPrimary: widget._isPrimary,
      labelColor: widget.labelColor,
      unselectedLabelColor: widget.unselectedLabelColor,
      labelStyle: widget.labelStyle,
      unselectedLabelStyle: widget.unselectedLabelStyle,
      defaults: defaults,
      tabForegroundColor: widget.tabBackgroundColor,
      child: child,
    );
  }

  bool _debugScheduleCheckHasValidTabsCount() {
    if (_debugHasScheduledValidTabsCountCheck) {
      return true;
    }
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      _debugHasScheduledValidTabsCountCheck = false;
      if (!mounted) {
        return;
      }
      assert(() {
        if (_controller!.length != widget.tabs.length) {
          throw FlutterError(
            "Controller's length property (${_controller!.length}) does not match the "
            "number of tabs (${widget.tabs.length}) present in TabBar's tabs property.",
          );
        }
        return true;
      }());
    }, debugLabel: 'TabBar.tabsCountCheck');
    _debugHasScheduledValidTabsCountCheck = true;
    return true;
  }

  bool _debugTabAlignmentIsValid(TabAlignment tabAlignment) {
    assert(() {
      if (widget.isScrollable && tabAlignment == TabAlignment.fill) {
        throw FlutterError(
          '$tabAlignment is only valid for non-scrollable tab bars.',
        );
      }
      if (!widget.isScrollable &&
          (tabAlignment == TabAlignment.start ||
              tabAlignment == TabAlignment.startOffset)) {
        throw FlutterError(
          '$tabAlignment is only valid for scrollable tab bars.',
        );
      }
      return true;
    }());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    assert(_debugScheduleCheckHasValidTabsCount());
    final ThemeData theme = Theme.of(context);
    final TabBarThemeData tabBarTheme = TabBarTheme.of(context);
    final TabAlignment effectiveTabAlignment =
        widget.tabAlignment ??
        tabBarTheme.tabAlignment ??
        _defaults.tabAlignment!;
    assert(_debugTabAlignmentIsValid(effectiveTabAlignment));

    final MaterialLocalizations localizations = MaterialLocalizations.of(
      context,
    );
    if (_controller!.length == 0) {
      return LimitedBox(
        maxWidth: 0.0,
        child: SizedBox(
          width: double.infinity,
          height: _kTabHeight + widget.indicatorWeight,
        ),
      );
    }

    final List<Widget> wrappedTabs = List<Widget>.generate(widget.tabs.length, (
      int index,
    ) {
      EdgeInsetsGeometry padding =
          widget.labelPadding ?? tabBarTheme.labelPadding ?? kTabLabelPadding;
      const double verticalAdjustment =
          (_kTextAndIconTabHeight - _kTabHeight) / 2.0;

      final Widget tab = widget.tabs[index];
      if (tab is PreferredSizeWidget &&
          tab.preferredSize.height == _kTabHeight &&
          widget.tabHasTextAndIcon) {
        padding = padding.add(
          const EdgeInsets.symmetric(vertical: verticalAdjustment),
        );
      }
      _labelPaddings[index] = padding;

      return CustomPaint(
        painter: CustomBackgroundPainter(
          tabBackgroundColor: widget.tabBackgroundColor,
        ),
        child: Center(
          heightFactor: 1.0,
          child: Padding(
            padding: _labelPaddings[index],
            child: KeyedSubtree(
              key: _tabKeys[index],
              child: widget.tabs[index],
            ),
          ),
        ),
      );
    });

    // If the controller was provided by DefaultTabController and we're part
    // of a Hero (typically the AppBar), then we will not be able to find the
    // controller during a Hero transition. See https://github.com/flutter/flutter/issues/213.
    if (_controller != null) {
      final int previousIndex = _controller!.previousIndex;

      if (_controller!.indexIsChanging) {
        // The user tapped on a tab, the tab controller's animation is running.
        assert(_currentIndex != previousIndex);
        final Animation<double> animation = _ChangeAnimation(_controller!);
        wrappedTabs[_currentIndex!] = _buildStyledTab(
          wrappedTabs[_currentIndex!],
          true,
          animation,
          _defaults,
        );
        wrappedTabs[previousIndex] = _buildStyledTab(
          wrappedTabs[previousIndex],
          false,
          animation,
          _defaults,
        );
      } else {
        // The user is dragging the TabBarView's PageView left or right.
        if (_currentIndex! < widget.tabs.length) {
          final int tabIndex = _currentIndex!;
          final Animation<double> centerAnimation = _DragAnimation(
            _controller!,
            tabIndex,
          );
          wrappedTabs[tabIndex] = _buildStyledTab(
            wrappedTabs[tabIndex],
            true,
            centerAnimation,
            _defaults,
          );
        }
        if (_currentIndex! > 0) {
          final int tabIndex = _currentIndex! - 1;
          final Animation<double> previousAnimation = ReverseAnimation(
            _DragAnimation(_controller!, tabIndex),
          );
          wrappedTabs[tabIndex] = _buildStyledTab(
            wrappedTabs[tabIndex],
            false,
            previousAnimation,
            _defaults,
          );
        }
        if (_currentIndex! < widget.tabs.length - 1) {
          final int tabIndex = _currentIndex! + 1;
          final Animation<double> nextAnimation = ReverseAnimation(
            _DragAnimation(_controller!, tabIndex),
          );
          wrappedTabs[tabIndex] = _buildStyledTab(
            wrappedTabs[tabIndex],
            false,
            nextAnimation,
            _defaults,
          );
        }
      }
    }

    // Add the tap handler to each tab. If the tab bar is not scrollable,
    // then give all of the tabs equal flexibility so that they each occupy
    // the same share of the tab bar's overall width.
    final int tabCount = widget.tabs.length;
    for (int index = 0; index < tabCount; index += 1) {
      final Set<WidgetState> selectedState = <WidgetState>{
        if (index == _currentIndex) WidgetState.selected,
      };

      final MouseCursor effectiveMouseCursor =
          WidgetStateProperty.resolveAs<MouseCursor?>(
            widget.mouseCursor,
            selectedState,
          ) ??
          tabBarTheme.mouseCursor?.resolve(selectedState) ??
          WidgetStateMouseCursor.clickable.resolve(selectedState);

      final WidgetStateProperty<Color?> defaultOverlay =
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
            final Set<WidgetState> effectiveStates =
                selectedState..addAll(states);
            return _defaults.overlayColor?.resolve(effectiveStates);
          });
      wrappedTabs[index] = InkWell(
        mouseCursor: effectiveMouseCursor,
        onTap: () {
          _handleTap(index);
        },
        enableFeedback: widget.enableFeedback ?? true,
        overlayColor:
            widget.overlayColor ?? tabBarTheme.overlayColor ?? defaultOverlay,
        splashFactory:
            widget.splashFactory ??
            tabBarTheme.splashFactory ??
            _defaults.splashFactory,
        borderRadius: widget.splashBorderRadius,
        child: Padding(
          padding: EdgeInsets.only(bottom: widget.indicatorWeight),
          child: Stack(
            children: <Widget>[
              wrappedTabs[index],
              Semantics(
                selected: index == _currentIndex,
                label: localizations.tabLabel(
                  tabIndex: index + 1,
                  tabCount: tabCount,
                ),
              ),
            ],
          ),
        ),
      );
      if (!widget.isScrollable && effectiveTabAlignment == TabAlignment.fill) {
        wrappedTabs[index] = Expanded(child: wrappedTabs[index]);
      }
    }

    Widget tabBar = _TabStyle(
      tabForegroundColor: widget.tabBackgroundColor,
      animation: kAlwaysDismissedAnimation,
      isSelected: false,
      isPrimary: widget._isPrimary,
      labelColor: widget.labelColor,
      unselectedLabelColor: widget.unselectedLabelColor,
      labelStyle: widget.labelStyle,
      unselectedLabelStyle: widget.unselectedLabelStyle,
      defaults: _defaults,
      child: CustomPaint(
        foregroundPainter: _indicatorPainter,
        child: _TabLabelBar(
          onPerformLayout: _saveTabOffsets,
          mainAxisSize:
              effectiveTabAlignment == TabAlignment.fill
                  ? MainAxisSize.max
                  : MainAxisSize.min,
          children: wrappedTabs,
        ),
      ),
    );

    if (widget.isScrollable) {
      final EdgeInsetsGeometry? effectivePadding =
          effectiveTabAlignment == TabAlignment.startOffset
              ? const EdgeInsetsDirectional.only(
                start: _kStartOffset,
              ).add(widget.padding ?? EdgeInsets.zero)
              : widget.padding;
      _scrollController ??= _TabBarScrollController(this);
      tabBar = ScrollConfiguration(
        // The scrolling tabs should not show an overscroll indicator.
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: SingleChildScrollView(
          dragStartBehavior: widget.dragStartBehavior,
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          padding: effectivePadding,
          physics: widget.physics,
          child: tabBar,
        ),
      );
      if (theme.useMaterial3) {
        final AlignmentGeometry effectiveAlignment =
            switch (effectiveTabAlignment) {
              TabAlignment.center => Alignment.center,
              TabAlignment.start ||
              TabAlignment.startOffset ||
              TabAlignment.fill => AlignmentDirectional.centerStart,
            };

        final Color dividerColor =
            widget.dividerColor ??
            tabBarTheme.dividerColor ??
            _defaults.dividerColor!;
        final double dividerHeight =
            widget.dividerHeight ??
            tabBarTheme.dividerHeight ??
            _defaults.dividerHeight!;

        tabBar = Align(
          heightFactor: 1.0,
          widthFactor: dividerHeight > 0 ? null : 1.0,
          alignment: effectiveAlignment,
          child: tabBar,
        );

        if (dividerColor != Colors.transparent && dividerHeight > 0) {
          tabBar = CustomPaint(
            painter: _DividerPainter(
              dividerColor: dividerColor,
              dividerHeight: dividerHeight,
            ),
            child: tabBar,
          );
        }
      }
    } else if (widget.padding != null) {
      tabBar = Padding(padding: widget.padding!, child: tabBar);
    }

    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: widget.textScaler ?? tabBarTheme.textScaler),
      child: tabBar,
    );
  }
}

// Hand coded defaults based on Material Design 2.
class _TabsDefaultsM2 extends TabBarThemeData {
  const _TabsDefaultsM2(this.context, this.isScrollable)
    : super(indicatorSize: TabBarIndicatorSize.tab);

  final BuildContext context;
  final bool isScrollable;

  @override
  Color? get indicatorColor => Theme.of(context).indicatorColor;

  @override
  Color? get labelColor => Theme.of(context).primaryTextTheme.bodyLarge!.color!;

  @override
  TextStyle? get labelStyle => Theme.of(context).primaryTextTheme.bodyLarge;

  @override
  TextStyle? get unselectedLabelStyle =>
      Theme.of(context).primaryTextTheme.bodyLarge;

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;

  @override
  TabAlignment? get tabAlignment =>
      isScrollable ? TabAlignment.start : TabAlignment.fill;
}

// BEGIN GENERATED TOKEN PROPERTIES - Tabs

// Do not edit by hand. The code between the "BEGIN GENERATED" and
// "END GENERATED" comments are generated from data in the Material
// Design token database by the script:
//   dev/tools/gen_defaults/bin/gen_defaults.dart.

class _TabsPrimaryDefaultsM3 extends TabBarThemeData {
  _TabsPrimaryDefaultsM3(this.context, this.isScrollable)
    : super(indicatorSize: TabBarIndicatorSize.label);

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;
  final bool isScrollable;

  // This value comes from Divider widget defaults. Token db deprecated 'primary-navigation-tab.divider.color' token.
  @override
  Color? get dividerColor => _colors.outlineVariant;

  // This value comes from Divider widget defaults. Token db deprecated 'primary-navigation-tab.divider.height' token.
  @override
  double? get dividerHeight => 1.0;

  @override
  Color? get indicatorColor => _colors.primary;

  @override
  Color? get labelColor => _colors.primary;

  @override
  TextStyle? get labelStyle => _textTheme.titleSmall;

  @override
  Color? get unselectedLabelColor => _colors.onSurfaceVariant;

  @override
  TextStyle? get unselectedLabelStyle => _textTheme.titleSmall;

  @override
  WidgetStateProperty<Color?> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.primary.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.primary.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primary.withValues(alpha: 0.1);
        }
        return null;
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.primary.withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.onSurface.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.onSurface.withValues(alpha: 0.1);
      }
      return null;
    });
  }

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;

  @override
  TabAlignment? get tabAlignment =>
      isScrollable ? TabAlignment.startOffset : TabAlignment.fill;

  static double indicatorWeight(TabBarIndicatorSize indicatorSize) {
    return switch (indicatorSize) {
      TabBarIndicatorSize.label => 3.0,
      TabBarIndicatorSize.tab => 2.0,
    };
  }
}

class _TabsSecondaryDefaultsM3 extends TabBarThemeData {
  _TabsSecondaryDefaultsM3(this.context, this.isScrollable)
    : super(indicatorSize: TabBarIndicatorSize.tab);

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;
  final bool isScrollable;

  // This value comes from Divider widget defaults. Token db deprecated 'secondary-navigation-tab.divider.color' token.
  @override
  Color? get dividerColor => _colors.outlineVariant;

  // This value comes from Divider widget defaults. Token db deprecated 'secondary-navigation-tab.divider.height' token.
  @override
  double? get dividerHeight => 1.0;

  @override
  Color? get indicatorColor => _colors.primary;

  @override
  Color? get labelColor => _colors.onSurface;

  @override
  TextStyle? get labelStyle => _textTheme.titleSmall;

  @override
  Color? get unselectedLabelColor => _colors.onSurfaceVariant;

  @override
  TextStyle? get unselectedLabelStyle => _textTheme.titleSmall;

  @override
  WidgetStateProperty<Color?> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.onSurface.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.onSurface.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.onSurface.withValues(alpha: 0.1);
        }
        return null;
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.onSurface.withValues(alpha: 0.1);
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.onSurface.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.onSurface.withValues(alpha: 0.1);
      }
      return null;
    });
  }

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;

  @override
  TabAlignment? get tabAlignment =>
      isScrollable ? TabAlignment.startOffset : TabAlignment.fill;

  static double indicatorWeight = 2.0;
}

// END GENERATED TOKEN PROPERTIES - Tabs
