import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../list_attendance/list_attendance_widget.dart';
import '../new_attendence/new_attendence_widget.dart';
import '../profile/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashWidget extends StatefulWidget {
  const DashWidget({Key key}) : super(key: key);

  @override
  _DashWidgetState createState() => _DashWidgetState();
}

class _DashWidgetState extends State<DashWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEF39E2),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFCB2376), Color(0xFFC518A8)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Olá, ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          child: Text(
                            valueOrDefault<String>(
                              currentUserDisplayName,
                              'Usuário',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'E-mail: ',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        currentUserEmail,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Telefone: ',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      AuthUserStreamWidget(
                        child: Text(
                          currentPhoneNumber,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0xFF9E9E9E),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryColor,
                          FlutterFlowTheme.of(context).primaryColor
                        ],
                        stops: [1, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewAttendenceWidget(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 50,
                          ),
                          Text(
                            'Novo Atendimento',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0xFF9E9E9E),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryColor,
                          Color(0xFFE5BBDF)
                        ],
                        stops: [1, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListAttendanceWidget(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard_sharp,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 50,
                          ),
                          Text(
                            'Atendimentos',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
