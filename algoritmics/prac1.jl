function gcd_(a::T, b::T) where T
    #a0, b0 = b, a % b
    while b != 0
        a, b = b, a % b
    end
    return a
end

function gcdx_(a::T, b::T) where T 
    # a0, b0 = a, b
    u1, v1 = one(T), zero(T) 
    u2, v2 = v1, u1
    #ИНВАРИАНТ: НОД(a,b) = HОД(a0,b0) && a = u*a0 + v*b0 && b = u_*a0 + v_ * b0
    while b != 0
        q = a // b
        a, b = b, a % b

        u1, u2 = u2, u1 - q*u2
        v1, v2 = v2, v1 - q*v2
    end
    if a < 0
        a, u1, v1 = -a, -u1, -v1
    end
    return a, u1, v1 
end

function gcdxxx(a::T, b::T) where T
    u1 = 1
    u2 = 0
    v1 = 0
    v2 = 1

    while b > 0
        
        q, r = rem(a, b), a % b
        a, b = b, r

        u1, u2 = u2, u1 - q*u2
        v1, v2 = v2, v1 - q*v2
        # println(a, b, u1,v1,u2,v2)
    end
    return a, u1, v1




end

function invmod_(a::T, M::T) where T
    d, u, v = gcdxxx(a, M)
    println(d, u, div(a*u, M))
    if d == 1 && (a*u % M) == 1
        return u
    end
    return "Nothing"
end

println(invmod_(4, 5))