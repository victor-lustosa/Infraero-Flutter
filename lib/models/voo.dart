import 'companhia.dart';

class Voo {
  String _data;
  String _horario;
  int _numero;
  String _destino;
  String _portaoEmbarque;
  late Companhia companhia;
  Voo.with_parameters(this._data, this._horario, this._numero, this._destino,
      this._portaoEmbarque);

  //GETTERS
  get getData => _data;
  get getDestino => _destino;
  get getPortaoEmbarque => _portaoEmbarque;
  get getNumeroVoo => _numero;
  get getHorario => _horario;
  get getCompanhia => companhia;

  //SETTERS
  setNumeroVoo(int numero) => {if (numero > 0) this._numero = numero};
  setDestino(String destino) => this._destino = destino;
  setData(String data) => this._data = data;
  setPortaoEmbarque(String portaoEmbarque) =>
      this._portaoEmbarque = portaoEmbarque;
  setCompanhia(Companhia companhia) => this.companhia = companhia;
  setHorario(String horario) => this._horario = horario;
  // setNumeroVoo(int numero) {
  //   if (numero > 0) {
  //     this._numero = _numero;
  //   }
  // }

  String toString() {
    return "\n data: $_data ,horario: $_horario ,destino: $_destino ,porto de embarque: $_portaoEmbarque, numero: $_numero " +
        " companhia: " +
        getCompanhia.toString();
  }
}
