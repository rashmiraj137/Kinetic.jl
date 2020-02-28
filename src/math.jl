# ============================================================
# Mathematical Methods
# ============================================================


export heaviside,
       fortsign


# ------------------------------------------------------------
# Heaviside step function
# ------------------------------------------------------------
heaviside(x::Union{Int, AbstractFloat}) = ifelse(x >= 0, 1., 0.)


# ------------------------------------------------------------
# Fortran sign()
# ------------------------------------------------------------
fortsign(x, y) = abs(x) * sign(y)