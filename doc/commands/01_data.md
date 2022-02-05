# Data Module Command List

The data module is imports the necessary data from an SPM MEEG object to set up a DAiSS BF structure. This allows a single SPM dataset to have simulatanously SPM inversions and DAiSS source imaging without the two interfering with each other.

## Commands

#### dir
Path to directory where BF.mat will be saved.

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.data.dir = {'/path/to/BF/'};

% DAiSS-Wizard
% Default: if not provided, will default to the path where 'S.D' exists (see below).
% Input Type: str or cellstr
S.dir = 'path/to/BF';
```

#### D
Path to SPM MEEG object (.mat file).

#### matlabbatch
```matlab
% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.data.D = {'/path/to/spmmeeg.mat'};

% DAiSS-Wizard
% Default: REQUIRED.
% Input Type: str or cellstr or meeg (yes, really!);
S.D = 'path/to/spmmeeg.mat;
```
