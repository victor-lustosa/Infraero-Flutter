import '../models/aeroporto.dart';
import '../models/infraero.dart';
class InfraeroController {
  List<Aeroporto> vetAeroportos = [];
  List<Aeroporto> historicoAeroporto = [];
  Infraero infra = Infraero();
  insereAeroporto(Aeroporto aeroporto) {
    infra.getAeroportos.add(aeroporto);
    return print("\nAeroporto criado com sucesso");
  }

//METODO BUSCA O VETOR DE VOOS DE UMA DETERMINADA COMPANHIA
  salvarAntesDeletarAeroporto(String nome) {
    String variavel = "";
    for (int i = 0; i < infra.getAeroportos.length; i++) {
      if (infra.getAeroportos[i].getNome == nome) {
        infra.getHistoricoAeroporto.add(infra.getAeroportos[i]);
        infra.getAeroportos.remove(infra.getAeroportos[i]);
        variavel = "\nAeroporto removido com sucesso";
      } else {
        variavel = "\nNenhum aeroporto com esse nome foi encontrado";
      }
    }
    return variavel;
  }

//METODO BUSCA O VETOR DE VOOS DE UMA DETERMINADA COMPANHIA
  deletarAeroporto(String nomeAeroporto) {
    String variavel = "";
    for (int i = 0; i < infra.getAeroportos.length; i++) {
      if (infra.getAeroportos[i].getNome == nomeAeroporto) {
        infra.getAeroportos.remove(infra.getAeroportos[i]);
        variavel = "\nAeroporto removido com sucesso";
        return variavel;
      } else {
        variavel = "\nNenhum aeroporto com esse nome foi encontrado";
        return variavel;
      }
    }
  }

  isEmpty() {
    if (infra.getAeroportos.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  //METODO BUSCA O VETOR DE COMPANHIAS
  Aeroporto? getAeroportoPorNome(String nome) {
    Aeroporto? aero;
    for (int i = 0; i < infra.getAeroportos.length; i++) {
      if (infra.getAeroportos[i].getNome == nome) {
        aero = infra.getAeroportos[i];
      }
    }
    return aero;
  }

  //METODO BUSCA O VETOR DE COMPANHIAS
  toStringAeroportoPorNome(String nome) {
    String variavel = "";
    if (infra.getAeroportos.length == 0) {
      variavel = "\nNenhum aeroporto com esse nome foi encontrado ";
    } else {
      for (int i = 0; i < infra.getAeroportos.length; i++) {
        if (infra.getAeroportos[i].getNome == nome) {
          variavel += infra.getAeroportos[i].toString();
        }
      }
    }
    return variavel;
  }

  toStringAeroportos() {
    String variavel = "";

    if (infra.getAeroportos.length == 0) {
      variavel = "\nnao há aeroportos ";
    } else {
      for (int posicao = 0; posicao < infra.getAeroportos.length; posicao++) {
        variavel += infra.getAeroportos[posicao].toString();
      }
    }
    return variavel;
  }

  toStringNomeAeroportos() {
    String variavel = "";

    if (infra.getAeroportos.length == 0) {
      variavel = "\nnao há aeroportos ";
    } else {
      for (int posicao = 0; posicao < infra.getAeroportos.length; posicao++) {
        variavel += "\n" + infra.getAeroportos[posicao].getNome;
      }
    }
    return variavel;
  }

  toStringHistoricoAeroporto() {
    String variavel = "";

    if (infra.getHistoricoAeroporto.length == 0) {
      variavel = "\nnao há aeroportos ";
    } else {
      for (int posicao = 0; posicao < infra.getHistoricoAeroporto.length; posicao++) {
        variavel += infra.getHistoricoAeroporto[posicao].toString();
      }
    }
    return variavel;
  }

}
