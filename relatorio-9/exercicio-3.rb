class MicroondasUnidade
  def aquecer_por(segundos)
    puts "BIP! Aquecendo por #{segundos} segundos... D-Mail sendo enviado!"
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail [Hora: #{@hora_envio}]: #{@conteudo}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @dmails_enviados = []
  end

  def enviar_dmail
    puts "Digite o conteúdo do D-Mail:"
    conteudo = gets.chomp

    puts "Digite a hora de envio (HH:MM):"
    hora = gets.chomp

    @unidade.aquecer_por(10) 

    novo_dmail = DMail.new(conteudo, hora)
    @dmails_enviados.push(novo_dmail)
    puts "D-Mail enviado com sucesso para o passado!"
  end

  def listar_dmails
    puts "Digite um horário de corte (HH:MM) para filtrar D-Mails:"
    horario_corte = gets.chomp

    dmails_filtrados = @dmails_enviados.select do |dmail|
      dmail.hora_envio > horario_corte
    end

    puts "\n--- D-Mails recebidos após as #{horario_corte} ---"
    if dmails_filtrados.empty?
      puts "Nenhum D-Mail encontrado."
    else
      puts dmails_filtrados
    end
  end
end

# --- Main ---
tel_microondas = TelefoneDeMicroondas.new

tel_microondas.enviar_dmail
puts
tel_microondas.enviar_dmail
puts

tel_microondas.listar_dmails