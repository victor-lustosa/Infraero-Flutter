import 'aeroporto.dart';

class Infraero {
  Infraero();
  List<Aeroporto> vetAeroportos = [];
  List<Aeroporto> historicoAeroporto = [];

  List<Aeroporto> get getAeroportos => vetAeroportos;
  List<Aeroporto> get getHistoricoAeroporto => historicoAeroporto;
}
