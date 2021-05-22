import 'package:flutter/material.dart';

import 'controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = ControllerHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FutureBuilder<List<int>>(
                  future: controller.lista,
                  builder: (context ,snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
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
                  setState(() {
                    controller.loadLista();
                  });
                },
              child: Text('Load'),),
            )
          ],
        ),
      ),
    );


  }
}
