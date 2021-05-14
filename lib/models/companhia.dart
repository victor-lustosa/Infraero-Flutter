class Companhia {
  late String _nome;
  late int _codigo;
  Companhia();
  Companhia.with_parameters(this._nome, this._codigo);

  get getNome => _nome;
  setNome(String nome) => this._nome = nome;
  get getCodigo => _codigo;
  setCodigo(int codigo) => this._codigo = codigo;
  //sobreescrevendo o toString

  toString() {
    return "\nnome: $_nome, codigo: $_codigo";
  }
}
