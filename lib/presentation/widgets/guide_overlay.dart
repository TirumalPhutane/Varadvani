import 'package:feature_discovery/feature_discovery.dart';
import 'package:material_ui/material_ui.dart';
import 'package:varadvani/theme/color_code.dart';

class GuideOverlay extends StatelessWidget {
  const GuideOverlay({
    super.key,
    required this.featureId,
    required this.title,
    required this.description,
    required this.tapTarget,
    required this.child,
    this.contentLocation = ContentLocation.trivial,
  });

  final String featureId;
  final String title;
  final String description;
  final Widget tapTarget;
  final Widget child;
  final ContentLocation contentLocation;

  @override
  Widget build(BuildContext context) {
    return DescribedFeatureOverlay(
      featureId: featureId,
      tapTarget: tapTarget,
      contentLocation: contentLocation,
      backgroundColor: Color(ColorCode.orange),
      targetColor: Color(ColorCode.white),
      textColor: Color(ColorCode.white),
      overflowMode: OverflowMode.extendBackground,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Gotu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        description,
        style: const TextStyle(fontFamily: 'Mukta_medium', fontSize: 16),
      ),
      child: child,
    );
  }
}
