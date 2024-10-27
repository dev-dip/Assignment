import 'package:assignmentostad/widgets/screen.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobile,
    required this.desktop,
    this.tablet,
    super.key,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceType deviceType = ScreenUtils.getDeviceType(width: size.width);

    if(deviceType == DeviceType.mobile){
      return mobile;
    } else if( deviceType == DeviceType.tablet){
      return tablet ?? mobile;
    }
    return desktop;
  }
}
