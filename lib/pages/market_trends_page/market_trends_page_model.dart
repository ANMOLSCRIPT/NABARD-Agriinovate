import '/flutter_flow/flutter_flow_util.dart';
import 'market_trends_page_widget.dart' show MarketTrendsPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MarketTrendsPageModel extends FlutterFlowModel<MarketTrendsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
