module Rastreavel
  def obter_localizacao(hora)
    raise NotImplementedError, "Implementar 'obter_localizacao' na classe"
  end
end

module Perigoso
  def calcular_risco
    raise NotImplementedError, "Implementar 'calcular_risco' na classe"
  end
end

class Participante
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class Detetive < Participante
  include Rastreavel

  def initialize(nome, localizacao_atual)
    super(nome)
    @localizacao_atual = localizacao_atual
  end

  def obter_localizacao(hora)
    "Na hora #{hora}, #{@nome} estava em #{@localizacao_atual}."
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def initialize(nome, covil)
    super(nome)
    @covil = covil
  end

  def obter_localizacao(hora)
    "Na hora #{hora}, #{@nome} estava em... (sinal perdido perto de #{@covil})."
  end

  def calcular_risco
    "Alto Risco: #{@nome}. Ameaça global iminente."
  end
end

class Cenario
  def initialize(participantes)
    @participantes = participantes
  end

  def identificar_ameacas
    ameacas = @participantes.select do |p|
      p.respond_to?(:calcular_risco)
    end
    return ameacas
  end
end

# --- Main ---
puts "Digite a localização atual de Sherlock:"
loc_sherlock = gets.chomp

puts "Digite a localização do covil de Moriarty:"
loc_moriarty = gets.chomp

sherlock = Detetive.new("Sherlock", loc_sherlock)
moriarty = MestreDoCrime.new("Moriarty", loc_moriarty)
outro_detetive = Detetive.new("L", "Tóquio")

lista_de_participantes = [sherlock, moriarty, outro_detetive]

cenario_londres = Cenario.new(lista_de_participantes)

puts "\n--- Identificando Ameaças ---"
alvos_perigosos = cenario_londres.identificar_ameacas

if alvos_perigosos.empty?
  puts "Nenhuma ameaça encontrada."
else
  puts "Alvos perigosos encontrados:"
  alvos_perigosos.each do |alvo|
    puts "- #{alvo.nome} (Risco: #{alvo.calcular_risco})"
  end
end