import '../models/gestorCompanhias.dart';
import '../models/companhia.dart';
class GestorCompanhiasController {
  GestorCompanhiasController();
  GestorCompanhias gesComp = GestorCompanhias();
//METEDO QUE VERIFICA SE PODE CRIAR UMA COMPANHIA
  isEmpty() {
    if (gesComp.getCompanhias.length == 0) {
      return false;
    } else {
      return true;
    }
  }

//METODO QUE CRIA COMPANHIA
  void insereCompanhia(Companhia novaCompanhia) {

    gesComp.getCompanhias.add(novaCompanhia);
    return print("\nCompanhia criada com sucesso");
  }

//METODO BUSCA O POR NOME
  Companhia? getCompanhiaPorNome(String nome) {
    Companhia? comp;
    for (int i = 0; i < gesComp.getCompanhias.length; i++) {
      if (gesComp.getCompanhias[i].getNome == nome) {
        comp = gesComp.getCompanhias[i];
      }
    }
    return comp;
  }

//METODO BUSCA O VETOR DE VOOS DE UMA DETERMINADA COMPANHIA
  salvarAntesDeletarCompanhia(String nome) {
    String variavel = "";
    for (int i = 0; i <gesComp.getCompanhias.length; i++) {
      if (gesComp.getCompanhias[i].getNome == nome) {
        gesComp.getHistoricoCompanhia.add(gesComp.getCompanhias[i]);
        gesComp.getCompanhias.remove(gesComp.getCompanhias[i]);
        variavel = "\nCompanhia removida com sucesso";
      } else {
        variavel = "\nNenhuma Companhia com esse nome foi encontrada";
      }
    }
    return variavel;
  }

//METODO PARA DELETAR
  deletarCompanhia(String nome) {
    String variavel = "";
    for (int i = 0; i < gesComp.getCompanhias.length; i++) {
      if (gesComp.getCompanhias[i].getNome == nome) {
        gesComp.getCompanhias.remove(gesComp.getCompanhias[i]);
        variavel = "\nCompanhia removida com sucesso";
        return variavel;
      } else {
        variavel = "\nNenhuma companhia com esse nome foi encontrada";
        return variavel;
      }
    }
  }

  toStringCompanhiaPorNome(String nome) {
    String variavel = "";
    if (gesComp.getCompanhias.length == 0) {
      variavel = "\nNenhuma companhia com esse nome foi encontrada";
    } else {
      for (int i = 0; i < gesComp.getCompanhias.length; i++) {
        if (gesComp.getCompanhias[i].getNome == nome) {
          variavel += gesComp.getCompanhias[i].toString();
        }
      }
    }
    return variavel;
  }

  String toStringHistoricoCompanhia() {
    String variavel = "";
    if (gesComp.getHistoricoCompanhia.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < gesComp.getHistoricoCompanhia.length; posicao++) {
        variavel += gesComp.getHistoricoCompanhia[posicao].toString();
      }
    }
    return variavel;
  }

  String toStringNomeCompanhias() {
    String variavel = "";
    if (gesComp.getCompanhias.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < gesComp.getCompanhias.length; posicao++) {
        variavel += "\n" + gesComp.getCompanhias[posicao].getNome;
      }
    }
    return variavel;
  }

  String toStringCompanhias() {
    String variavel = "";
    if (gesComp.getCompanhias.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < gesComp.getCompanhias.length; posicao++) {
        variavel += gesComp.getCompanhias[posicao].toString();
      }
    }
    return variavel;
  }
}
