<div align="center"> <img
  src="https://i.postimg.cc/ncXfgjXd/dancing-circles.gif"
  alt="Kinetic Logo" width="300"></img>
</div>
<!--
# Kinetic.jl
<img src="https://i.postimg.cc/ncXfgjXd/dancing-circles.gif" width="300"/>
-->

[![version](https://juliahub.com/docs/Kinetic/version.svg)](https://juliahub.com/ui/Packages/Kinetic/wrVmu)
[![pkgeval](https://juliahub.com/docs/Kinetic/pkgeval.svg)](https://juliahub.com/ui/Packages/Kinetic/wrVmu)
![](https://travis-ci.com/vavrines/Kinetic.jl.svg?branch=master)
[![deps](https://juliahub.com/docs/Kinetic/deps.svg)](https://juliahub.com/ui/Packages/Kinetic/wrVmu?t=2)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://xiaotianbai.com/Kinetic.jl/dev/)
![](https://zenodo.org/badge/243490351.svg)

**Kinetic.jl** is a lightweight [Julia](https://julialang.org) toolbox for the study of kinetic theory and scientific machine learning. The main module here consists of [KitBase.jl](https://github.com/vavrines/KitBase.jl) with basic physics and [KitML.jl](https://github.com/vavrines/KitML.jl) with neural dynamics. The high-performance Fortran library [KitFort.jl](https://github.com/vavrines/KitFort.jl) can be optionally imported when the executing efficiency becomes the first priority. A Python wrapper [kineticpy](https://github.com/vavrines/kineticpy) is built together to locate all the structs and methods here through [pyjulia](https://github.com/JuliaPy/pyjulia). The status of continuous integration and coverage for the ecosystem is listed.

| Kinetic | KitBase | KitML | KitFort |
| ----------   | --------- | ---------------- | ------ |
| ![CI](https://github.com/vavrines/Kinetic.jl/workflows/CI/badge.svg) | ![CI](https://github.com/vavrines/KitBase.jl/workflows/CI/badge.svg) | ![CI](https://github.com/vavrines/KitML.jl/workflows/CI/badge.svg) | ![CI](https://github.com/vavrines/KitFort.jl/workflows/CI/badge.svg) |
| [![codecov](https://img.shields.io/codecov/c/github/vavrines/Kinetic.jl.svg)](https://codecov.io/gh/vavrines/Kinetic.jl) | [![codecov](https://img.shields.io/codecov/c/github/vavrines/KitBase.jl.svg)](https://codecov.io/gh/vavrines/KitBase.jl) | [![codecov](https://img.shields.io/codecov/c/github/vavrines/KitML.jl.svg)](https://codecov.io/gh/vavrines/KitML.jl) | [![codecov](https://img.shields.io/codecov/c/github/vavrines/KitFort.jl.svg)](https://codecov.io/gh/vavrines/KitFort.jl) |

## Formulation

Kinetic.jl concerns theoretical and numerical studies of the kinetic theory of gases, photons, plasmas, neutrons, etc.
It employs the finite volume method (FVM) to conduct 1-3 dimensional numerical simulations on CPUs and GPUs that solve, for example, the Boltzmann equation 

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{\partial&space;f}{\partial&space;t}&plus;\mathbf{v}&space;\cdot&space;\nabla_{\mathbf{x}}&space;f&space;=&space;\int_{\mathbb&space;R^3}&space;\int_{\mathcal&space;S^2}&space;\mathcal&space;B(\cos&space;\beta,&space;|\mathbf{v}-\mathbf{v_*}|)&space;\left[&space;f(\mathbf&space;v')f(\mathbf&space;v_*')-f(\mathbf&space;v)f(\mathbf&space;v_*)\right]&space;d\mathbf&space;\Omega&space;d\mathbf&space;v_*" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\frac{\partial&space;f}{\partial&space;t}&plus;\mathbf{v}&space;\cdot&space;\nabla_{\mathbf{x}}&space;f&space;=&space;\int_{\mathbb&space;R^3}&space;\int_{\mathcal&space;S^2}&space;\mathcal&space;B(\cos&space;\beta,&space;|\mathbf{v}-\mathbf{v_*}|)&space;\left[&space;f(\mathbf&space;v')f(\mathbf&space;v_*')-f(\mathbf&space;v)f(\mathbf&space;v_*)\right]&space;d\mathbf&space;\Omega&space;d\mathbf&space;v_*" title="\frac{\partial f}{\partial t}+\mathbf{v} \cdot \nabla_{\mathbf{x}} f = \int_{\mathbb R^3} \int_{\mathcal S^2} \mathcal B(\cos \beta, |\mathbf{v}-\mathbf{v_*}|) \left[ f(\mathbf v')f(\mathbf v_*')-f(\mathbf v)f(\mathbf v_*)\right] d\mathbf \Omega d\mathbf v_*" /></a>

or the neural kinetic equations with the general formulation as

<a href="https://www.codecogs.com/eqnedit.php?latex=f_t=\mathcal&space;F(f,&space;t,&space;\mathrm{NN}_\theta(f,t))" target="_blank"><img src="https://latex.codecogs.com/svg.latex?f_t=\mathcal&space;F(f,&space;t,&space;\mathrm{NN}_\theta(f,t))" title="f_t=\mathcal F(f, t, \mathrm{NN}_\theta(f,t))" /></a>

Their upscaling moment systems are handled at the same time

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{\partial&space;\mathbf&space;W}{\partial&space;t}&space;&plus;&space;\nabla_\mathbf&space;x&space;\cdot&space;\mathbf&space;F&space;=&space;\mathbf&space;S" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\frac{\partial&space;\mathbf&space;W}{\partial&space;t}&space;&plus;&space;\nabla_\mathbf&space;x&space;\cdot&space;\mathbf&space;F&space;=&space;\mathbf&space;S" title="\frac{\partial \mathbf W}{\partial t} + \nabla_\mathbf x \cdot \mathbf F = \mathbf S" /></a>

## Documentation

For the detailed information on using the package, please
[check the documentation](https://xiaotianbai.com/Kinetic.jl/dev/).

## Contributing

If you have further questions regarding Kinetic.jl or have got an idea on improving it, please feel free to get in touch. Open an issue or pull request if you'd like to work on a new feature or even if you're new to open-source and want to find a cool little project or issue to work on that fits your interests. We're more than happy to help along the way.
