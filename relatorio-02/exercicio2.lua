local numeros = {5, 12, 3, 8, 15, 7, 20, 1}

local function encontrarMaior(tabela)
    local maior = tabela[1]
    
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    
    return maior
end

local maior = encontrarMaior(numeros)
print("O maior número da tabela é:", maior)