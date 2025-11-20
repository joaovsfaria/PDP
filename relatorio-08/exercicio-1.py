class Personagem:
    def __init__(self, vida, resistencia):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, novo_valor):
        if novo_valor < 0:
            self._vida = 0
        else:
            self._vida = novo_valor

    def __str__(self):
        return f"Personagem com {self.vida} de vida"

class Cavaleiro(Personagem):
    def __init__(self, vida, resistencia, armadura_pesada):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        return f"Cavaleiro com {self.vida} de vida e armadura pesada"

# Demonstração
personagem_base = Personagem(100, 50)
print(personagem_base)

cavaleiro = Cavaleiro(150, 80, True)
print(cavaleiro)
cavaleiro.vida -= 50
print(f"Vida do cavaleiro após dano: {cavaleiro.vida}")