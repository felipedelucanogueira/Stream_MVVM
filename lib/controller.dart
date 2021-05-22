import 'home_model.dart';

class ControllerHome{

  HomeModel _model = HomeModel();

  Future<List<int>> get lista => _model.lista;

      void loadLista(){
        _model.loadLista();

      }
    }