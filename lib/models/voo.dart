import 'companhia.dart';

class Voo {
  Voo();
  late int _id;
  late String _data;
  late String _horario;
  late int _numero;
  late String _origem;
  late String _destino;
  late String _portaoEmbarque;
  late String companhia;
  Voo.with_parameters(this._data, this._horario, this._numero, this._destino,
      this._portaoEmbarque, this._origem);
  Voo.with_JSON(json)
      : this._id = json['id'],
        this._data = json['data'],
        this._horario = json['horario'],
        this._numero = json['numero'],
        this._origem = json['origem'],
        this._destino = json['destino'],
        this._portaoEmbarque = json ['portaoEmbarque'],
        this.companhia = json ['companhia'];
        // this.companhia = json['Companhia'];
  //GETTERS
  get getOrigem => _origem;
  get getData => _data;
  get getDestino => _destino;
  get getPortaoEmbarque => _portaoEmbarque;
  get getNumeroVoo => _numero;
  get getHorario => _horario;
  get getCompanhia => companhia;

  //SETTERS
  setOrigem(String origem) => this._origem = origem;
  setNumeroVoo(int numero) => {if (numero > 0) this._numero = numero};
  setDestino(String destino) => this._destino = destino;
  setData(String data) => this._data = data;
  setPortaoEmbarque(String portaoEmbarque) =>
      this._portaoEmbarque = portaoEmbarque;
  setCompanhia(String companhia) => this.companhia = companhia;
  setHorario(String horario) => this._horario = horario;
  // setNumeroVoo(int numero) {
  //   if (numero > 0) {
  //     this._numero = _numero;
  //   }
  // }
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String toString() {
    return "\n data: $_data ,horario: $_horario ,destino: $_destino ,porto de embarque: $_portaoEmbarque, numero: $_numero " +
        " companhia: " +
        getCompanhia.toString();
  }
}
