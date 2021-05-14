import '../models/voo.dart';
import '../models/aeroporto.dart';
class AeroportoController {
  Aeroporto aero = Aeroporto();
  void insereVoo(Voo voo) {
    aero.getVoos.add(voo);
    return print("\nVoo criado com sucesso");
  }

  Voo? getVoosPorDestino(String destino) {
    Voo? voo;
    for (int i = 0; i < aero.getVoos.length; i++) {
      if (aero.getVoos[i].getDestino == destino) {
        voo = aero.getVoos[i];
      }
    }
    return voo;
  }

  Voo? getVoosPorNumero(int numero) {
    Voo? voo;
    for (int i = 0; i < aero.getVoos.length; i++) {
      if (aero.getVoos[i].getNumeroVoo == numero) {
        voo = aero.getVoos[i];
      }
    }
    return voo;
  }

  isEmpty() {
    if (aero.getVoos.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  toStringVooPorNumero(String numero) {
    String variavel = "";
    if (aero.getVoos.length == 0) {
      variavel = "\nNenhum voo com esse numero foi encontrado";
    } else {
      for (int i = 0; i < aero.getVoos.length; i++) {
        if (aero.getVoos[i].getNumeroVoo == numero) {
          variavel += aero.getVoos[i].toString();
        }
      }
      return variavel;
    }
  }

  toStringVooPorDestino(String destino) {
    String variavel = "";
    if (aero.getVoos.length == 0) {
      variavel = "\nNenhum voo com esse destino foi encontrado";
    } else {
      for (int i = 0; i < aero.getVoos.length; i++) {
        if (aero.getVoos[i].getDestino == destino) {
          variavel += aero.getVoos[i].toString();
        }
      }
      return variavel;
    }
  }

  String toStringVoos() {
    String variavel = "";
    if (aero.getVoos.length == 0) {
      variavel = "\nnão há voos";
    } else {
      for (int posicao = 0; posicao < aero.getVoos.length; posicao++) {
        variavel += aero.getVoos[posicao].toString();
      }
    }
    return variavel;
  }

  String toStringHistoricoVoo() {
    String variavel = "";
    if (aero.getHistoricoVoo.length == 0) {
      variavel = "\nnão há voos";
    } else {
      for (int posicao = 0; posicao < aero.getHistoricoVoo.length; posicao++) {
        variavel += aero.getHistoricoVoo[posicao].toString();
      }
    }
    return variavel;
  }

//METODO PARA DELETAR
  deletarVoo(int numero) {
    String variavel = "";
    for (int i = 0; i < aero.getVoos.length; i++) {
      if (aero.getVoos[i].getNumeroVoo == numero) {
        aero.getVoos.remove(aero.getVoos[i]);
        variavel = "\nVoo removido com sucesso";
        return variavel;
      } else {
        variavel = "\nNenhum voo com esse nome foi encontrado";
        return variavel;
      }
    }
  }

  salvarAntesDeletarVoo(int numero) {
    String variavel = "";
    for (int i = 0; i < aero.getVoos.length; i++) {
      if (aero.getVoos[i].getNumeroVoo == numero) {
        aero.getHistoricoVoo.add(aero.getVoos[i]);
        aero.getVoos.remove(aero.getVoos[i]);
        variavel = "\n*** Voo removido com sucesso ***";
      } else {
        variavel = "\nNenhum voo com esse nome foi encontrado";
      }
    }
    return variavel;
  }
}
