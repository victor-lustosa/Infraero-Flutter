import 'voo.dart';

class Aeroporto {
  late String _nome;
  late String _codigo;
  late String _cidade;
  late String _estado;
  late String _pais;
  Aeroporto();
  List<Voo> _vetVoos = [];
  List<Voo> _historicoVoo = [];
  Aeroporto.with_parameters(
      this._nome, this._codigo, this._cidade, this._estado, this._pais);

//GETTERS
  List<Voo> get getHistoricoVoo => _historicoVoo;
  List<Voo> get getVoos => _vetVoos;
  get getNome => _nome;
  get getCodigo => _codigo;
  get getCidade => _cidade;
  get getEstado => _estado;
  get getPais => _pais;

//SETTERS
  setNome(String nome) => _nome = nome;
  setCodigo(String codigo) => _codigo = codigo;
  setCidade(String cidade) => _cidade = cidade;
  setEstado(String estado) => _estado = estado;
  setPais(String pais) => _pais = pais;

  toString() {
    return "\nnome: $_nome, codigo: $_codigo, cidade: $_cidade, estado: $_estado, pais: $_pais";
  }
}
