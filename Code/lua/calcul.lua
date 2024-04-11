local calcul = {}

function calcul.addition(a, b)
    return a + b
end
function calcul.factorielle(n)
    if n == 1 then
        return 1
    else
        return n * factorielle(n-1)
    end
end
function calcul.soustraction(a, b)
    return a - b
end

return calcul