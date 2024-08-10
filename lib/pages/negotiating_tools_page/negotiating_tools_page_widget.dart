import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'negotiating_tools_page_model.dart';
export 'negotiating_tools_page_model.dart';

class NegotiatingToolsPageWidget extends StatefulWidget {
  const NegotiatingToolsPageWidget({super.key});

  @override
  State<NegotiatingToolsPageWidget> createState() =>
      _NegotiatingToolsPageWidgetState();
}

class _NegotiatingToolsPageWidgetState
    extends State<NegotiatingToolsPageWidget> {
  late NegotiatingToolsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NegotiatingToolsPageModel());
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF31FF00),
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'wn0kdf5r' /* Negotiating Tools */,
            ),
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: const Color(0x004B39EF),
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: Colors.black,
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xFF636363),
                  size: 40.0,
                ),
                onPressed: () async {
                  context.pushNamed('Settings');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
