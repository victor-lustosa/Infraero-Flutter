import './companhia.dart';

class GestorCompanhias {
  GestorCompanhias();
  List<Companhia> _vetCompanhia = [];
  List<Companhia> _vetHistoricoCompanhia = [];
  List<Companhia> get getCompanhias => _vetCompanhia;
  List<Companhia> get getHistoricoCompanhia => _vetHistoricoCompanhia;
//METEDO QUE VERIFICA SE PODE CRIAR UMA COMPANHIA
  isEmpty() {
    if (getCompanhias.length == 0) {
      return false;
    } else {
      return true;
    }
  }

//METODO QUE CRIA COMPANHIA
  void insereCompanhia(Companhia novaCompanhia) {
    getCompanhias.add(novaCompanhia);
    return print("\n*** Companhia criada com sucesso ***");
  }

//METODO BUSCA O POR NOME
  Companhia? getCompanhiaPorNome(String nome) {
    Companhia? comp;
    for (int i = 0; i < getCompanhias.length; i++) {
      if (getCompanhias[i].getNome == nome) {
        comp = getCompanhias[i];
      }
    }
    return comp;
  }

//METODO BUSCA O VETOR DE VOOS DE UMA DETERMINADA COMPANHIA
  salvarAntesDeletarCompanhia(String nome) {
    String variavel = "";
    for (int i = 0; i < getCompanhias.length; i++) {
      if (getCompanhias[i].getNome == nome) {
        getHistoricoCompanhia.add(getCompanhias[i]);
        getCompanhias.remove(getCompanhias[i]);
        variavel = "\n*** Companhia removida com sucesso ***";
      } else {
        variavel = "\nNenhuma Companhia com esse nome foi encontrada";
      }
    }
    return variavel;
  }

//METODO PARA DELETAR
  deletarCompanhia(String nome) {
    String variavel = "";
    for (int i = 0; i < getCompanhias.length; i++) {
      if (getCompanhias[i].getNome == nome) {
        getCompanhias.remove(getCompanhias[i]);
        variavel = "\n*** Companhia removida com sucesso ***";
        return variavel;
      } else {
        variavel = "\nNenhuma companhia com esse nome foi encontrada";
        return variavel;
      }
    }
  }

  toStringCompanhiaPorNome(String nome) {
    String variavel = "";
    if (getCompanhias.length == 0) {
      variavel = "\nNenhuma companhia com esse nome foi encontrada";
    } else {
      for (int i = 0; i < getCompanhias.length; i++) {
        if (getCompanhias[i].getNome == nome) {
          variavel += getCompanhias[i].toString();
        }
      }
    }
    return variavel;
  }

  String toStringHistoricoCompanhia() {
    String variavel = "";
    if (getHistoricoCompanhia.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < getHistoricoCompanhia.length; posicao++) {
        variavel += getHistoricoCompanhia[posicao].toString();
      }
    }
    return variavel;
  }

  String toStringNomeCompanhias() {
    String variavel = "";
    if (getCompanhias.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < getCompanhias.length; posicao++) {
        variavel += "\n" + getCompanhias[posicao].getNome;
      }
    }
    return variavel;
  }

  String toStringCompanhias() {
    String variavel = "";
    if (getCompanhias.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < getCompanhias.length; posicao++) {
        variavel += getCompanhias[posicao].toString();
      }
    }
    return variavel;
  }
}
