import 'aeroporto.dart';

class Infraero {
  List<Aeroporto> vetAeroportosCidadeEstado = [];
  List<Aeroporto> vetAeroportos = [];
  List<Aeroporto> historicoAeroporto = [];
  String cidadeInfra = '';
  String estadoInfra = '';
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

  void getAeroportoPorCidadeEEstado(String cidade,String estado) {
    Aeroporto? aero;
    if(vetAeroportosCidadeEstado.isEmpty != true){
    getAeroportosPorCidadeEstado.clear();
    }
    if(cidade != ''){
      cidadeInfra = cidade;
    }
    if(estado != ''){
      estadoInfra = estado;
    }
    for (int i = 0; i < getAeroportos.length; i++) {
      if (getAeroportos[i].getCidade == cidadeInfra &&
          getAeroportos[i].getEstado == estadoInfra) {
        aero = getAeroportos[i];
        vetAeroportosCidadeEstado.add(aero);
      }
    }
    print(vetAeroportosCidadeEstado.toString());
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
  List<Aeroporto> get getAeroportos => vetAeroportos;
  List<Aeroporto> get getHistoricoAeroporto => historicoAeroporto;
}
