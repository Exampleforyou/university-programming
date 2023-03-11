#1
function gcd_(a::T, b::T) where T
    #a0, b0 = b, a % b
    while b != 0
        a, b = b, a % b
    end
    return a
end
#2


function gcdx_(a::T, b::T) where T
    u1 = 1
    u2 = 0
    v1 = 0
    v2 = 1

    while b > 0
        
        q, r = rem(a, b), mod(a, b)
        a, b = b, r

        u1, u2 = u2, u1 - q*u2
        v1, v2 = v2, v1 - q*v2
        # println(a, b, u1,v1,u2,v2)
    end
    return a, u1, v1

end


function invmod_(a::T, M::T) where T
    d, u, v = gcdx_(a, M)
    # println(d, u, mod(a*u, M))
    if d == 1 && mod(a*u, M) == 1
        if u < 0
            u += M
        end
        return u
    end
    return "Nothing"
end
# println(invmod_(4, 5))

function diaphant_solve(a::T, b::T, c::T) where T
    d, u, v = gcdx_(a, b)

    if c % d != 0
        return "Nothing"
    end
    
    #     d    = a*u + b*v 
    # c = d*c' = a*x + b*y
    _c = c / d
    x = u*_c
    y = v*_c
    return x, y
end


struct Residue{T, M}
    a::T
    Residue{T, M}(a::T) where{T, M} = new(mod(a, M))
end



R = Residue{Int, 6}(5)
println(R.a)

