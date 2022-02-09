# Sources Module Command List

The source module generates the source space used for forward and inverse calculations later on.


## Commands

#### BF
Path to BF.mat file

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.sources.BF = {'/path/to/BF/'};

% DAiSS-Wizard
% Default: if not provided, will default to the path where 'S.D' exists (see below).
% Input Type: str or cellstr
S.BF = 'path/to/BF';
```
## Plugins
