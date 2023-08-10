import 'package:flutter/material.dart';
import '../../models/session_model.dart';
import '../../services/session_service.dart';
import 'admin_root_screen.dart';

class joinSessionPage extends StatelessWidget {
  final SessionService sessionService = SessionService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listes des etudiants'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: StreamBuilder<List<SessionModel>>(
              //Affichage etudiants
              stream: sessionService.getSession(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<SessionModel> session = snapshot.data!;
                  return ListView.builder(
                    itemCount: session.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          // leading: Image.asset("assets/images/logo.png"),
                          title: Text(session[index].type),
                          subtitle: Text(session[index].annee.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AdminRootScreen(),
                                      ),
                                    );
                                  }),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  /**
                                      _showEditDialog(context, session[index]);**/
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
