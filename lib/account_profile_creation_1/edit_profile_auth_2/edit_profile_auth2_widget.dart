import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'edit_profile_auth2_model.dart';
export 'edit_profile_auth2_model.dart';

class EditProfileAuth2Widget extends StatefulWidget {
  const EditProfileAuth2Widget({
    super.key,
    String? title,
    String? confirmButtonText,
    required this.navigateAction,
  })  : title = title ?? 'Edit Profile',
        confirmButtonText = confirmButtonText ?? 'Save Changes';

  final String title;
  final String confirmButtonText;
  final Future Function()? navigateAction;

  @override
  State<EditProfileAuth2Widget> createState() => _EditProfileAuth2WidgetState();
}

class _EditProfileAuth2WidgetState extends State<EditProfileAuth2Widget> {
  late EditProfileAuth2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileAuth2Model());

    _model.yourNameTextController ??= TextEditingController();
    _model.yourNameFocusNode ??= FocusNode();

    _model.myBioTextController ??= TextEditingController();
    _model.myBioFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: Text(
              widget.title,
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'yhv2kzq5' /* Adjust the content below to up... */,
              ),
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent2,
                  borderRadius: BorderRadius.circular(12.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondary,
                    width: 2.0,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1624806992928-9c7a04a8383d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxmYXJtZXJ8ZW58MHx8fHwxNzIzNTU0ODYyfDA&ixlib=rb-4.0.3&q=80&w=1080',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 32.0),
              child: FFButtonWidget(
                onPressed: () async {
                  final selectedMedia = await selectMedia(
                    mediaSource: MediaSource.photoGallery,
                    multiImage: false,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = (await Future.wait(
                        selectedMedia.map(
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }
                },
                text: FFLocalizations.of(context).getText(
                  'uiss036r' /* Change Photo */,
                ),
                options: FFButtonOptions(
                  width: 130.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  elevation: 1.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: TextFormField(
              controller: _model.yourNameTextController,
              focusNode: _model.yourNameFocusNode,
              autofillHints: const [AutofillHints.name],
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  '8gfgeoe2' /* Full Name  */,
                ),
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  '2bbwp1lp' /* Your full name... */,
                ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).error,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator:
                  _model.yourNameTextControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: FlutterFlowLanguageSelector(
              height: 50.0,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              borderColor: Colors.transparent,
              dropdownIconColor: FlutterFlowTheme.of(context).primaryText,
              borderRadius: 8.0,
              textStyle: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 13.0,
              ),
              hideFlags: true,
              flagSize: 24.0,
              flagTextGap: 8.0,
              currentLanguage: FFLocalizations.of(context).languageCode,
              languages: FFLocalizations.languages(),
              onChanged: (lang) => setAppLanguage(context, lang),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: FlutterFlowDropDown<String>(
              controller: _model.dropDownValueController1 ??=
                  FormFieldController<String>(null),
              options: [
                FFLocalizations.of(context).getText(
                  'mu7ixnom' /* Jammu and Kashmir */,
                ),
                FFLocalizations.of(context).getText(
                  'nukd4uex' /* Ladakh */,
                ),
                FFLocalizations.of(context).getText(
                  'v0rq4px0' /* Punjab */,
                ),
                FFLocalizations.of(context).getText(
                  '5jdrttxr' /* Himachal Pradesh */,
                ),
                FFLocalizations.of(context).getText(
                  'jg66hbzn' /* Haryana */,
                ),
                FFLocalizations.of(context).getText(
                  'jupp4elw' /* Delhi */,
                ),
                FFLocalizations.of(context).getText(
                  'xtlwm20q' /* Uttarakhand */,
                ),
                FFLocalizations.of(context).getText(
                  'ohfa41dc' /* Rajasthan */,
                ),
                FFLocalizations.of(context).getText(
                  '0z47br0l' /* Gujarat */,
                ),
                FFLocalizations.of(context).getText(
                  '85l2rdvb' /* Maharashtra */,
                ),
                FFLocalizations.of(context).getText(
                  'ver5z5lp' /* Karnataka */,
                ),
                FFLocalizations.of(context).getText(
                  'i6iwm7tl' /* Kerala */,
                ),
                FFLocalizations.of(context).getText(
                  '8vh6u44y' /* Tamil Nadu */,
                ),
                FFLocalizations.of(context).getText(
                  'vrb8r1mv' /* Andhra Pradesh */,
                ),
                FFLocalizations.of(context).getText(
                  'gyc6q97r' /* Odisha */,
                ),
                FFLocalizations.of(context).getText(
                  'u4a27o3g' /* Chattisgarh */,
                ),
                FFLocalizations.of(context).getText(
                  '2m0zet0i' /* Bihar */,
                ),
                FFLocalizations.of(context).getText(
                  'blozbkab' /* Jharkhand */,
                ),
                FFLocalizations.of(context).getText(
                  'mmhuk67d' /* West Bengal */,
                ),
                FFLocalizations.of(context).getText(
                  'i7diczqb' /* Sikkim */,
                ),
                FFLocalizations.of(context).getText(
                  'gej0zi5s' /* Assam */,
                ),
                FFLocalizations.of(context).getText(
                  'ooemgdm7' /* Mizoram */,
                ),
                FFLocalizations.of(context).getText(
                  '38j05a82' /* Manipur */,
                ),
                FFLocalizations.of(context).getText(
                  'dqi314k3' /* Nagaland */,
                ),
                FFLocalizations.of(context).getText(
                  '7h6y2cw6' /* Madhya Pradesh */,
                ),
                FFLocalizations.of(context).getText(
                  'c0z0ynwg' /* Uttar Pradesh */,
                ),
                FFLocalizations.of(context).getText(
                  'zq8vnn6z' /* Telengana */,
                ),
                FFLocalizations.of(context).getText(
                  '714px80a' /* Tripura */,
                ),
                FFLocalizations.of(context).getText(
                  'pfbcqjx4' /* Meghalaya */,
                )
              ],
              onChanged: (val) => setState(() => _model.dropDownValue1 = val),
              height: 50.0,
              searchHintTextStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
              searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              hintText: FFLocalizations.of(context).getText(
                'z2yykb3s' /* Select State */,
              ),
              searchHintText: FFLocalizations.of(context).getText(
                '3gf0ribv' /* Search for your state */,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
              hidesUnderline: true,
              isOverButton: true,
              isSearchable: true,
              isMultiSelect: false,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: FlutterFlowDropDown<String>(
              controller: _model.dropDownValueController2 ??=
                  FormFieldController<String>(null),
              options: [
                FFLocalizations.of(context).getText(
                  'wxqjj0wu' /* New Delhi */,
                ),
                FFLocalizations.of(context).getText(
                  '2jry8a0e' /* West Delhi */,
                ),
                FFLocalizations.of(context).getText(
                  'b5vamlrd' /* East Delhi */,
                ),
                FFLocalizations.of(context).getText(
                  '425kzxx7' /* North Delhi */,
                ),
                FFLocalizations.of(context).getText(
                  'urrt1oao' /* South Delhi */,
                ),
                FFLocalizations.of(context).getText(
                  '9n9u6w9y' /* Central Delhi */,
                )
              ],
              onChanged: (val) => setState(() => _model.dropDownValue2 = val),
              height: 50.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              hintText: FFLocalizations.of(context).getText(
                'zlpe3rxb' /* Select Region */,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
              hidesUnderline: true,
              isOverButton: true,
              isSearchable: false,
              isMultiSelect: false,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: FlutterFlowDropDown<String>(
              controller: _model.dropDownValueController3 ??=
                  FormFieldController<String>(null),
              options: [
                FFLocalizations.of(context).getText(
                  '7vv01fio' /* Wheat */,
                ),
                FFLocalizations.of(context).getText(
                  'ilx20u86' /* Rice */,
                ),
                FFLocalizations.of(context).getText(
                  'pzesecc1' /* Sugarcane */,
                ),
                FFLocalizations.of(context).getText(
                  '7qctxw9y' /* Maise/Corn */,
                ),
                FFLocalizations.of(context).getText(
                  '5erfyion' /* Pulses */,
                ),
                FFLocalizations.of(context).getText(
                  'oy7epdo8' /* Tea */,
                ),
                FFLocalizations.of(context).getText(
                  'oqzcogan' /* Coffee */,
                ),
                FFLocalizations.of(context).getText(
                  '5504hb0z' /* Oil Seeds */,
                ),
                FFLocalizations.of(context).getText(
                  'zq065uxe' /* Cotton */,
                ),
                FFLocalizations.of(context).getText(
                  '0jz0mzvq' /* Jute */,
                ),
                FFLocalizations.of(context).getText(
                  'ucl2hy3i' /* Jowar */,
                ),
                FFLocalizations.of(context).getText(
                  'ixaoliwr' /* Bajra */,
                ),
                FFLocalizations.of(context).getText(
                  '0iljyqff' /* Tur */,
                ),
                FFLocalizations.of(context).getText(
                  'v6k0ytbq' /* Millet */,
                ),
                FFLocalizations.of(context).getText(
                  'vnysgy91' /* Soyabean */,
                ),
                FFLocalizations.of(context).getText(
                  'vsiqzwsv' /* Rubber */,
                ),
                FFLocalizations.of(context).getText(
                  '0mx8scwh' /* Coconut */,
                ),
                FFLocalizations.of(context).getText(
                  '401f7j5z' /* GroundNut */,
                ),
                FFLocalizations.of(context).getText(
                  'rtirh8u8' /* Saffrron */,
                )
              ],
              onChanged: (val) => setState(() => _model.dropDownValue3 = val),
              height: 50.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              hintText: FFLocalizations.of(context).getText(
                'ti1ag169' /* Select Crop */,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
              hidesUnderline: true,
              isOverButton: true,
              isSearchable: false,
              isMultiSelect: false,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: TextFormField(
              controller: _model.myBioTextController,
              focusNode: _model.myBioFocusNode,
              textCapitalization: TextCapitalization.sentences,
              obscureText: false,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  'mk2mb501' /* Short Description */,
                ),
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'krkcysyz' /* A little about you... */,
                ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).error,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.start,
              maxLines: 3,
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator:
                  _model.myBioTextControllerValidator.asValidator(context),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.formKey.currentState == null ||
                      !_model.formKey.currentState!.validate()) {
                    return;
                  }
                  // updateUserInfo

                  await currentUserReference!.update(createUsersRecordData(
                    displayName: _model.yourNameTextController.text,
                    photoUrl: _model.uploadedFileUrl != ''
                        ? _model.uploadedFileUrl
                        : currentUserPhoto,
                    shortDescription: _model.myBioTextController.text,
                    lastActiveTime: getCurrentTimestamp,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Profile has been updated!',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                            ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                  await widget.navigateAction?.call();

                  context.pushNamed('HomePage');
                },
                text: widget.confirmButtonText,
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 44.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
