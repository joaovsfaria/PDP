class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "A classe filha deve implementar 'tocar_partitura'"
  end
end

class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(peca)
    puts "#{@nome} toca lindamente a peça '#{peca}' no piano."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(peca)
    puts "#{@nome} executa com paixão a peça '#{peca}' no violino."
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "Maestro: Iniciando ensaio da peça '#{peca}'! 1, 2, 3..."
    @musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
  end

  def mudar_foco(estado)
    mensagens = @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
    return mensagens
  end
end

musicos_da_orquestra = [
  Pianista.new("Kousei"),
  Violinista.new("Kaori")
]

maestro = Maestro.new(musicos_da_orquestra)

puts "Digite o nome da peça para o ensaio:"
nome_da_peca = gets.chomp

maestro.iniciar_ensaio(nome_da_peca)

puts "\n--- Mudando o foco ---"
mensagens_de_foco = maestro.mudar_foco("Concentrado")
puts mensagens_de_foco