print("Digite o início do intervalo (M):")
M = tonumber(io.read())

print("Digite o final do intervalo (N):")
N = tonumber(io.read())

print("Digite o número X:")
X = tonumber(io.read())

print("Múltiplos de " .. X .. " no intervalo [" .. M .. ", " .. N .. "]:")

for i = M, N do
    if i % X == 0 then
        print(i)
    end
end