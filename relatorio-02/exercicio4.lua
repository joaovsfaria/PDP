local function calculadora(num1, num2, operador)
    if operador == '+' then
        return num1 + num2
    elseif operador == '-' then
        return num1 - num2
    elseif operador == '*' then
        return num1 * num2
    elseif operador == '/' then
        if num2 == 0 then
            return "Erro: divisão por zero"
        else
            return num1 / num2
        end
    else
        return "Erro: operador inválido"
    end
end

print(calculadora(10, 5, '+'))
print(calculadora(10, 5, '-'))
print(calculadora(10, 5, '*'))
print(calculadora(10, 5, '/'))
print(calculadora(10, 0, '/'))
print(calculadora(10, 5, '%'))