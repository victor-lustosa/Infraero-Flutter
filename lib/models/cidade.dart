import 'estado.dart';

class Cidade {
  Cidade();
  late String _nome;
  late String _nomeEstado;
  Cidade.with_parameters(this._nome, this._nomeEstado);
  String get nomeEstado => _nomeEstado;
  String get nome => _nome;
  setEstado(String nomeEstado) => this._nomeEstado = nomeEstado;
  setNome(String nome) => this._nome = nome;
}
