import 'cidade.dart';
class Estado {
  Estado();
  late String _nome;
  late List<Cidade> _cidades = [];
  late List<Cidade> _cidadePorEstado = [];
  List<Cidade> get getCidade => _cidades;
  // List<Cidade> get getCidadePorEstado => _cidadePorEstado;
  Estado.with_parameters(this._nome);

  String get nome => _nome;
  void insereCidade(Cidade cidade) {
    _cidades.add(cidade);
    return print("\n*** Voo criado com sucesso ***");
  }
  setNome(String nome) => this._nome = nome;
  List<Cidade> getCidadePorEstado(String destino) {
    Cidade? cidade;

    for (int i = 0; i < getCidade.length; i++) {
      if (getCidade[i].nomeEstado == destino) {
        cidade = getCidade[i];
        _cidadePorEstado.add(cidade);
      }
    }
    return _cidadePorEstado;
  }
}
