"""
Kinetic.jl: A Lightweight Framework for Computational Fluid Dynamics and Scientific Machine Learning

Copyright (c) 2021 Tianbai Xiao (tianbaixiao@gmail.com)
"""
module Kinetic

if VERSION < v"1.3"
    @warn "Kinetic.jl matches perfectly with Julia 1.3 and newer versions."
end

export 転

"""
Lightweight Framework for Computational Fluid Dynamics and Scientific Machine Learning

轻量化的计算流体力学建模和计算框架

"転" means "rolling" in Japannese
"""
const 転 = Kinetic

using CUDA
using Reexport
@reexport using KitBase
@reexport using KitML

function __init__()
    threads = Threads.nthreads()
    if threads == 1
        @info "Kinetic will run serially"
    elseif threads > 1
        @info "Kinetic will run with $threads threads"
    end

    if has_cuda()
        @info "Kinetic will enable CUDA devices"
        for (i, dev) in enumerate(CUDA.devices())
            @info "$i: $(CUDA.name(dev))"
        end

        @info "Scalar operation is disabled in CUDA"
        CUDA.allowscalar(false)
    end
end

end
