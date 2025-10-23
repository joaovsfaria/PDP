class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end

  def preco_base
    return @_preco_base
  end

  def preco_base=(valor)
    if valor > 0
      @_preco_base = valor
    else
      puts "Erro: O preço base deve ser positivo."
      @_preco_base = 0
    end
  end

  def preco_final
    return @_preco_base
  end

  def to_s
    return "Drink: #{@nome}, Preço Base: $#{@_preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    bonus_por_ano = 5
    preco_calculado = @_preco_base + (@anos_desde_criacao * bonus_por_ano)
    return preco_calculado
  end

  def to_s
    return "Lenda: #{@nome}, Anos: #{@anos_desde_criacao}, Preço Base: $#{@_preco_base}"
  end
end

puts "Digite o nome do drink lenda:"
nome_drink = gets.chomp

puts "Digite o preço base:"
preco_drink = gets.chomp.to_f

puts "Digite os anos desde a criação:"
idade_drink = gets.chomp.to_i

drink_especial = DrinkLenda.new(nome_drink, preco_drink, idade_drink)

puts "\n--- Detalhes do Drink ---"
puts drink_especial

puts "Preço Final Calculado: $#{drink_especial.preco_final}"