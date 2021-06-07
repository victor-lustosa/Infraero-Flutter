import 'aeroporto.dart';

class Infraero {
  List<Aeroporto> vetAeroportosCidadeEstado = [];
  List<Aeroporto> vetAeroportosEstado = [];
  List<Aeroporto> vetAeroportos = [];
  List<Aeroporto> historicoAeroporto = [];

  insereAeroporto(Aeroporto aeroporto) {
    getAeroportos.add(aeroporto);
    return print("\nAeroporto criado com sucesso");
  }

  salvarAntesDeletarAeroporto(String nome) {
    String variavel = "";
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getNome == nome) {
        getHistoricoAeroporto.add(getAeroportos[i]);
        getAeroportos.remove(getAeroportos[i]);
        variavel = "\nAeroporto removido com sucesso";
      } else {
        variavel = "\nNenhum aeroporto com esse nome foi encontrado";
      }
    }
    return variavel;
  }

  deletarAeroporto(String nomeAeroporto) {
    String variavel = "";
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getNome == nomeAeroporto) {
        getAeroportos.remove(getAeroportos[i]);
        variavel = "\nAeroporto removido com sucesso";
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

  Aeroporto? getAeroportoPorNome(String nome) {
    Aeroporto? aero;
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getNome == nome) {
        aero = getAeroportos[i];
      }
    }
    return aero;
  }

  List<Aeroporto>? getAeroportoPorEstado(String estado) {
    Aeroporto? aero;
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getEstado == estado) {
        aero = getAeroportos[i];
        vetAeroportosEstado.add(aero);
      }
    }
    return vetAeroportosEstado;
  }

  List<Aeroporto>? getAeroportoPorCidadeEEstado(String cidade) {
    Aeroporto? aero;
    for (int i = 0; i < getAeroportosPorEstado.length; i++) {
      if (getAeroportosPorEstado[i].getCidade == cidade) {
        aero = getAeroportosPorEstado[i];
        vetAeroportosCidadeEstado.add(aero);
      }
    }
    return vetAeroportosCidadeEstado;
  }

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
  List<Aeroporto> get getAeroportosPorCidadeEstado => vetAeroportosCidadeEstado;
  List<Aeroporto> get getAeroportosPorEstado => vetAeroportosEstado;
  List<Aeroporto> get getAeroportos => vetAeroportos;
  List<Aeroporto> get getHistoricoAeroporto => historicoAeroporto;
}
