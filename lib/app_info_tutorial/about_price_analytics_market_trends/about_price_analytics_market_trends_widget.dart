import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'about_price_analytics_market_trends_model.dart';
export 'about_price_analytics_market_trends_model.dart';

class AboutPriceAnalyticsMarketTrendsWidget extends StatefulWidget {
  const AboutPriceAnalyticsMarketTrendsWidget({super.key});

  @override
  State<AboutPriceAnalyticsMarketTrendsWidget> createState() =>
      _AboutPriceAnalyticsMarketTrendsWidgetState();
}

class _AboutPriceAnalyticsMarketTrendsWidgetState
    extends State<AboutPriceAnalyticsMarketTrendsWidget> {
  late AboutPriceAnalyticsMarketTrendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutPriceAnalyticsMarketTrendsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 336.0,
                  height: 369.0,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'vhsrw7dy' /* फसलों की मूल्य खोज और बाज़ार स... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'e6dhcasa' /* बाजार में विभिन्न उत्पादों के ... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 6.0, 24.0, 6.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('AboutNegotiatingTools');
                    },
                    text: FFLocalizations.of(context).getText(
                      'x81gvv4h' /* अगला */,
                    ),
                    options: FFButtonOptions(
                      width: 1000.0,
                      height: 60.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF39EF62),
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 6.0, 24.0, 6.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('auth_2_Create');
                    },
                    text: FFLocalizations.of(context).getText(
                      'kdd0k865' /* Skip */,
                    ),
                    options: FFButtonOptions(
                      width: 330.0,
                      height: 60.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF8A999C),
                      textStyle:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                                fontStyle: FontStyle.italic,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
