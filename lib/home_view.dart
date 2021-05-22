import 'package:flutter/material.dart';

import 'view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: StreamBuilder<List<int>>(
                  stream: viewModel.streamLista.stream,
                  builder: (context ,snapshot){
                    if(snapshot.connectionState != ConnectionState.active){
                     return CircularProgressIndicator();
                    }
                    if(snapshot.hasData){
                      var array = snapshot.data ?? [];
                      return ListView.builder(
                          itemCount: array.length,
                          itemBuilder: (context,index){
                        return Center(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text('$index'),

                            ),
                            decoration: BoxDecoration(
                              border:  Border.all(color: Colors.black)
                            ),
                          ),
                        );

                      });
                    }
                  return Container();
                    },
                ),
              ),

            ),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  viewModel.loadLista();
                },
              child: Text('Load'),),
            )
          ],
        ),
      ),
    );


  }
}
