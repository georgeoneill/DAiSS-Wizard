# Inverse Module Command List
This module is responsible for generating the source reconstruction weights for all sources defined.

#### Top-level commands
- [BF](#BF)

#### Plugins for source reconstruction

- [champagne](#champagne)
- deflect
- dics
- ebb
- eloreta
- lcmv
- lcmv_multicov
- minimumnorm
- nutmeg

## Commands
#### BF
Path to BF.mat file

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.inverse.BF = {'/path/to/BF/'};

% DAiSS-Wizard
% Default: REQUIRED
% Input Type: str or cellstr
S.BF = 'path/to/BF';
```

## Inverse plugins
### champagne

A Bayesian source reconstuction method. Used in conjucntion with [VBFA features method](03_features.md#vbfa) See [Wipf et al. (2010)](https://doi.org/10.1016/j.neuroimage.2009.06.083) or [Owen et al. (2012)](https://doi.org/10.1016/j.neuroimage.2011.12.027) for more information. 

#### nem

Number of iterations of EM used.

#### vcs

#### nupd

