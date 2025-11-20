from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

class Tanque(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} usa sua ultimate para criar uma barreira protetora!")

class Dano(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} usa sua ultimate para causar dano massivo em área!")

# Demonstração
herois = [
    Tanque("Reinhardt"),
    Dano("Genji")
]

for heroi in herois:
    heroi.usar_ultimate()