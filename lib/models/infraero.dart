import 'aeroporto.dart';

class Infraero {
  List<Aeroporto> vetAeroportos = [];
  List<Aeroporto> historicoAeroporto = [];

  insereAeroporto(Aeroporto aeroporto) {
    getAeroportos.add(aeroporto);
    return print("\n*** Aeroporto criado com sucesso ***");
  }

//METODO BUSCA O VETOR DE VOOS DE UMA DETERMINADA COMPANHIA
  salvarAntesDeletarAeroporto(String nome) {
    String variavel = "";
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getNome == nome) {
        getHistoricoAeroporto.add(getAeroportos[i]);
        getAeroportos.remove(getAeroportos[i]);
        variavel = "\n*** Aeroporto removido com sucesso ***";
      } else {
        variavel = "\nNenhum aeroporto com esse nome foi encontrado";
      }
    }
    return variavel;
  }

//METODO BUSCA O VETOR DE VOOS DE UMA DETERMINADA COMPANHIA
  deletarAeroporto(String nomeAeroporto) {
    String variavel = "";
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getNome == nomeAeroporto) {
        getAeroportos.remove(getAeroportos[i]);
        variavel = "\n*** Aeroporto removido com sucesso ***";
        return variavel;
      } else {
        variavel = "\nNenhum aeroporto com esse nome foi encontrado";
        return variavel;
      }
    }
  }

  isEmpty() {
    if (getAeroportos.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  //METODO BUSCA O VETOR DE COMPANHIAS
  Aeroporto? getAeroportoPorNome(String nome) {
    Aeroporto? aero;
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getNome == nome) {
        aero = getAeroportos[i];
      }
    }
    return aero;
  }

  //METODO BUSCA O VETOR DE COMPANHIAS
  toStringAeroportoPorNome(String nome) {
    String variavel = "";
    if (getAeroportos.length == 0) {
      variavel = "\nNenhum aeroporto com esse nome foi encontrado ";
    } else {
      for (int i = 0; i < getAeroportos.length; i++) {
        if (getAeroportos[i].getNome == nome) {
          variavel += getAeroportos[i].toString();
        }
      }
    }
    return variavel;
  }

  toStringAeroportos() {
    String variavel = "";

    if (getAeroportos.length == 0) {
      variavel = "\nnao há aeroportos ";
    } else {
      for (int posicao = 0; posicao < getAeroportos.length; posicao++) {
        variavel += getAeroportos[posicao].toString();
      }
    }
    return variavel;
  }

  toStringNomeAeroportos() {
    String variavel = "";

    if (getAeroportos.length == 0) {
      variavel = "\nnao há aeroportos ";
    } else {
      for (int posicao = 0; posicao < getAeroportos.length; posicao++) {
        variavel += "\n" + getAeroportos[posicao].getNome;
      }
    }
    return variavel;
  }

  toStringHistoricoAeroporto() {
    String variavel = "";

    if (getHistoricoAeroporto.length == 0) {
      variavel = "\nnao há aeroportos ";
    } else {
      for (int posicao = 0; posicao < getHistoricoAeroporto.length; posicao++) {
        variavel += getHistoricoAeroporto[posicao].toString();
      }
    }
    return variavel;
  }

  List<Aeroporto> get getAeroportos => vetAeroportos;
  List<Aeroporto> get getHistoricoAeroporto => historicoAeroporto;
}
