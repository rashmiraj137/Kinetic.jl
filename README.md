<div align="center">
  <h1>Kinetic.jl</h1>
  <img
    src="https://i.postimg.cc/ncXfgjXd/dancing-circles.gif"
    alt="Kinetic Logo" width="300">
  </img>

  [![version](https://juliahub.com/docs/Kinetic/version.svg)](https://juliahub.com/ui/Packages/Kinetic/wrVmu)
  [![](https://img.shields.io/badge/docs-latest-blue)](https://xiaotianbai.com/Kinetic.jl/dev/)
  [![](https://img.shields.io/badge/docs-stable-blue)](https://xiaotianbai.com/Kinetic.jl/stable/)
  [![status](https://joss.theoj.org/papers/65d56efef938caf92c2cc942d2c25ea4/status.svg?style=flat-square)](https://joss.theoj.org/papers/65d56efef938caf92c2cc942d2c25ea4)
  [![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)
</div>

<!--
![](https://img.shields.io/github/v/tag/vavrines/Kinetic.jl?include_prereleases&label=latest%20version&logo=github&sort=semver)
![](https://img.shields.io/badge/License-MIT-yellow.svg)
![](https://zenodo.org/badge/243490351.svg?style=flat-square)
[![GitHub commits since tagged version](https://img.shields.io/github/commits-since/vavrines/Kinetic.jl/v0.7.0.svg?style=social&logo=github)](https://github.com/vavrines/Kinetic.jl)
-->

<!--<div align="center"> <img
  src="https://i.postimg.cc/ncXfgjXd/dancing-circles.gif"
  alt="Kinetic Logo" width="300"></img>
</div>-->
<!--
# Kinetic.jl
<img src="https://i.postimg.cc/ncXfgjXd/dancing-circles.gif" width="300"/>
-->

**Kinetic** is a lightweight [Julia](https://julialang.org) toolbox for the study of computational fluid dynamics.
The main module is split into portable components:

- [KitBase.jl](https://github.com/vavrines/KitBase.jl) for basic physics
- [KitML.jl](https://github.com/vavrines/KitML.jl) for neural dynamics

Besides, a high-performance Fortran library is embedded in [KitFort.jl](https://github.com/vavrines/KitFort.jl).
As an optional module, it can be manually imported into the current ecosystem seamlessly when the ultimate executing efficiency is pursued.
A Python wrapper [kineticpy](https://github.com/vavrines/kineticpy) has been built as well to call the structs and methods here through [pyjulia](https://github.com/JuliaPy/pyjulia).

| [Kinetic](https://github.com/vavrines/Kinetic.jl) | [KitBase](https://github.com/vavrines/KitBase.jl) | [KitML](https://github.com/vavrines/KitML.jl) | [KitFort](https://github.com/vavrines/KitFort.jl) |
| ----------   | --------- | ---------------- | ------ |
| ![CI](https://img.shields.io/github/workflow/status/vavrines/Kinetic.jl/CI?style=flat-square) | ![CI](https://img.shields.io/github/workflow/status/vavrines/KitBase.jl/CI?style=flat-square) | ![CI](https://img.shields.io/github/workflow/status/vavrines/KitML.jl/CI?style=flat-square) | ![CI](https://img.shields.io/github/workflow/status/vavrines/KitFort.jl/CI?style=flat-square) |
| [![codecov](https://img.shields.io/codecov/c/github/vavrines/Kinetic.jl?style=flat-square)](https://codecov.io/gh/vavrines/Kinetic.jl) | [![codecov](https://img.shields.io/codecov/c/github/vavrines/KitBase.jl?style=flat-square)](https://codecov.io/gh/vavrines/KitBase.jl) | [![codecov](https://img.shields.io/codecov/c/github/vavrines/KitML.jl?style=flat-square)](https://codecov.io/gh/vavrines/KitML.jl) | [![codecov](https://img.shields.io/codecov/c/github/vavrines/KitFort.jl?style=flat-square)](https://codecov.io/gh/vavrines/KitFort.jl) |

## Installation

Kinetic.jl is a registered package in the official [Julia package registry](https://github.com/JuliaRegistries/General).
We recommend installing it with the built-in Julia package manager. 
It automatically installs a currently stable and tagged release. 
From the Julia REPL, you can get in the package manager (by pressing `]`) and add the package.

```julia
julia> ]
(v1.6) pkg> add Kinetic
```
This will automatically install Kinetic and all its dependencies
Similarly, it can be updated to the latest tagged release from the package manager by typing

```julia
(v1.6) pkg> update Kinetic
```

## Physics

Kinetic.jl focuses on theoretical and numerical studies of many-particle systems of gases, photons, plasmas, neutrons, etc.
It employs the finite volume method (FVM) to conduct 1-3 dimensional numerical simulations on CPUs and GPUs.
Any advection-diffusion-type equation can be solved within the framework.
Special attentions have been paid on Hilbert's sixth problem, i.e. to build the numerical passage between kinetic theory of gases, e.g. the Boltzmann equation

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{\partial&space;f}{\partial&space;t}&plus;\mathbf{v}&space;\cdot&space;\nabla_{\mathbf{x}}&space;f&space;=&space;\int_{\mathbb&space;R^3}&space;\int_{\mathcal&space;S^2}&space;\mathcal&space;B(\cos&space;\beta,&space;|\mathbf{v}-\mathbf{v_*}|)&space;\left[&space;f(\mathbf&space;v')f(\mathbf&space;v_*')-f(\mathbf&space;v)f(\mathbf&space;v_*)\right]&space;d\mathbf&space;\Omega&space;d\mathbf&space;v_*" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\frac{\partial&space;f}{\partial&space;t}&plus;\mathbf{v}&space;\cdot&space;\nabla_{\mathbf{x}}&space;f&space;=&space;\int_{\mathbb&space;R^3}&space;\int_{\mathcal&space;S^2}&space;\mathcal&space;B(\cos&space;\beta,&space;|\mathbf{v}-\mathbf{v_*}|)&space;\left[&space;f(\mathbf&space;v')f(\mathbf&space;v_*')-f(\mathbf&space;v)f(\mathbf&space;v_*)\right]&space;d\mathbf&space;\Omega&space;d\mathbf&space;v_*" title="\frac{\partial f}{\partial t}+\mathbf{v} \cdot \nabla_{\mathbf{x}} f = \int_{\mathbb R^3} \int_{\mathcal S^2} \mathcal B(\cos \beta, |\mathbf{v}-\mathbf{v_*}|) \left[ f(\mathbf v')f(\mathbf v_*')-f(\mathbf v)f(\mathbf v_*)\right] d\mathbf \Omega d\mathbf v_*" /></a>

and continuum mechanics, e.g. the Euler and Navier-Stokes equations

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{\partial&space;\mathbf&space;W}{\partial&space;t}&space;&plus;&space;\nabla_\mathbf&space;x&space;\cdot&space;\mathbf&space;F&space;=&space;\mathbf&space;S" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\frac{\partial&space;\mathbf&space;W}{\partial&space;t}&space;&plus;&space;\nabla_\mathbf&space;x&space;\cdot&space;\mathbf&space;F&space;=&space;\mathbf&space;S" title="\frac{\partial \mathbf W}{\partial t} + \nabla_\mathbf x \cdot \mathbf F = \mathbf S" /></a>

A partial list of current supported models and equations include
- linear Boltzmann equation
- nonlinear Boltzmann equation
- multi-component Boltzmann equations
- Fokker-Planck-Landau equation
- direct simulation Monte Carlo
- advection-diffusion equation
- Burgers equation
- Euler equations
- Navier-Stokes equations
- Extended hydrodynamical equations from gas kinetic expansion
- Magnetohydrodynamical equations
- Maxwell's equations

## Documentation

For the detailed information on the implementation and usage of the package,
[check the documentation](https://xiaotianbai.com/Kinetic.jl/dev/).

## Citing

If you benefit from Kinetic.jl in your research, teaching, or other activities, we would be happy if you could mention or cite it:

```
@article{Xiao2021,
  doi = {10.21105/joss.03060},
  url = {https://doi.org/10.21105/joss.03060},
  year = {2021},
  publisher = {The Open Journal},
  volume = {6},
  number = {62},
  pages = {3060},
  author = {Tianbai Xiao},
  title = {Kinetic.jl: A portable finite volume toolbox for scientific and neural computing},
  journal = {Journal of Open Source Software}
}
```

## Contributing

If you have further questions regarding Kinetic.jl or have got an idea on improving it, please feel free to get in touch. Open an issue or pull request if you'd like to work on a new feature or even if you're new to open-source and want to find a cool little project or issue to work on that fits your interests. We're more than happy to help along the way.
