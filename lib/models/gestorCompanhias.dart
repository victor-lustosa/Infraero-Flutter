import './companhia.dart';

class GestorCompanhias {
  GestorCompanhias();
  List<Companhia> _vetCompanhia = [];
  List<Companhia> _vetHistoricoCompanhia = [];
  List<Companhia> get getCompanhias => _vetCompanhia;
  List<Companhia> get getHistoricoCompanhia => _vetHistoricoCompanhia;
}
