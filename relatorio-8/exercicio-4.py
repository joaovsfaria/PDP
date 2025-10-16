from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao

class NetRunner(Cibernetico):
    def __init__(self, nome):
        self.nome = nome
        self._implante = Implante(5000, "Interface Neural")

    def realizar_hack(self):
        print(f"{self.nome} está hackeando o sistema com sua {self._implante.funcao}.")

class Faccao:
    def __init__(self, nome, membros):
        self.nome = nome
        self._membros = membros

    def iniciar_invasao(self):
        print(f"A facção {self.nome} está iniciando a invasão!")
        for membro in self._membros:
            membro.realizar_hack()

# Demonstração
netrunner1 = NetRunner("V")
netrunner2 = NetRunner("Jackie")

membros_faccao = [netrunner1, netrunner2]
minha_faccao = Faccao("Mox", membros_faccao)

minha_faccao.iniciar_invasao()