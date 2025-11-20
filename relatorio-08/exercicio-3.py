class ArmaCorpoACorpo:
    def __init__(self, nome, tipo):
        self.nome = nome
        self.tipo = tipo

class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"Membro: {self.nome}, Arma: {self.arma.nome}"

class Joker:
    def __init__(self, equipe):
        self._arma = ArmaCorpoACorpo("Faca", "Adaga")
        self._equipe = equipe

    def mostrar_equipe(self):
        print("Equipe dos Phantom Thieves:")
        for membro in self._equipe:
            print(membro)

# Demonstração
morgana_arma = ArmaCorpoACorpo("Sabre", "Espada Curta")
ryuji_arma = ArmaCorpoACorpo("Taco de Metal", "Clava")

membros_da_equipe = [
    PhantomThieves("Morgana", morgana_arma),
    PhantomThieves("Ryuji", ryuji_arma)
]

joker = Joker(membros_da_equipe)
joker.mostrar_equipe()