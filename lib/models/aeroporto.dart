import 'voo.dart';

class Aeroporto {
  String _nome;
  String _codigo;
  String _cidade;
  String _estado;
  String _pais;

  List<Voo> _vetVoos = [];
  List<Voo> _historicoVoo = [];
  Aeroporto.with_parameters(
      this._nome, this._codigo, this._cidade, this._estado, this._pais);

  void insereVoo(Voo voo) {
    getVoos.add(voo);
    return print("\n*** Voo criado com sucesso ***");
  }

  Voo? getVoosPorDestino(String destino) {
    Voo? voo;
    for (int i = 0; i < getVoos.length; i++) {
      if (getVoos[i].getDestino == destino) {
        voo = getVoos[i];
      }
    }
    return voo;
  }

  Voo? getVoosPorNumero(int numero) {
    Voo? voo;
    for (int i = 0; i < getVoos.length; i++) {
      if (getVoos[i].getNumeroVoo == numero) {
        voo = getVoos[i];
      }
    }
    return voo;
  }

  isEmpty() {
    if (getVoos.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  toStringVooPorNumero(String numero) {
    String variavel = "";
    if (getVoos.length == 0) {
      variavel = "\nNenhum voo com esse numero foi encontrado";
    } else {
      for (int i = 0; i < getVoos.length; i++) {
        if (getVoos[i].getNumeroVoo == numero) {
          variavel += getVoos[i].toString();
        }
      }
      return variavel;
    }
  }

  toStringVooPorDestino(String destino) {
    String variavel = "";
    if (getVoos.length == 0) {
      variavel = "\nNenhum voo com esse destino foi encontrado";
    } else {
      for (int i = 0; i < getVoos.length; i++) {
        if (getVoos[i].getDestino == destino) {
          variavel += getVoos[i].toString();
        }
      }
      return variavel;
    }
  }

  String toStringVoos() {
    String variavel = "";
    if (getVoos.length == 0) {
      variavel = "\nnão há voos";
    } else {
      for (int posicao = 0; posicao < getVoos.length; posicao++) {
        variavel += getVoos[posicao].toString();
      }
    }
    return variavel;
  }

  String toStringHistoricoVoo() {
    String variavel = "";
    if (getHistoricoVoo.length == 0) {
      variavel = "\nnão há voos";
    } else {
      for (int posicao = 0; posicao < getHistoricoVoo.length; posicao++) {
        variavel += getHistoricoVoo[posicao].toString();
      }
    }
    return variavel;
  }

//METODO PARA DELETAR
  deletarVoo(int numero) {
    String variavel = "";
    for (int i = 0; i < getVoos.length; i++) {
      if (getVoos[i].getNumeroVoo == numero) {
        getVoos.remove(getVoos[i]);
        variavel = "\n*** voo removido com sucesso ***";
        return variavel;
      } else {
        variavel = "\nNenhum voo com esse nome foi encontrado";
        return variavel;
      }
    }
  }

  salvarAntesDeletarVoo(int numero) {
    String variavel = "";
    for (int i = 0; i < getVoos.length; i++) {
      if (getVoos[i].getNumeroVoo == numero) {
        getHistoricoVoo.add(getVoos[i]);
        getVoos.remove(getVoos[i]);
        variavel = "\n*** Voo removido com sucesso ***";
      } else {
        variavel = "\nNenhum voo com esse nome foi encontrado";
      }
    }
    return variavel;
  }

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
