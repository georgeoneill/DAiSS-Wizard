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

#### val
Which element of the MEEG object's inv structure to pull information from (this normally is can be left as 1, unless there is a good reason to use something higher than that).

```matlab
% matlabbatch
% Default: REQUIRED
% Input Type: int
matlabbatch{1}.spm.tools.beamforming.data.val = 1;

% DAiSS-Wizard
% Default: 1
% Input Type: int
S.val = 1;
```

#### gradsource
Specifies where from a MEEG object to pull the sensor information from.

Options: 
 - 'inv' (RECOMMENDED) uses the `D.inv{val}.forward` information
 - 'sens' uses the `D.sensors` information

```matlab
% matlabbatch
% Default: REQUIRED
% Input Type: str
matlabbatch{1}.spm.tools.beamforming.data.gradsource = 'inv';

% DAiSS-Wizard
% Default: 'inv'
% Input Type: str
S.val = 'inv';
```
