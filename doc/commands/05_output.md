# Output Module Command List
This module is responsible for generating source-level summary images, or exporting source reconstucted timeseries for futher analysis.

#### Top-level commands
- [BF](#BF)

#### Semi-universal inputs (DAiSS-wizard only!)
- conditions
- contrast
- foi
- woi

#### Supported methods
- image_dics
- image_mv
- image_power

## Commands
#### BF
Path to BF.mat file

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.output.BF = {'/path/to/BF/'};

% DAiSS-Wizard
% Default: REQUIRED
% Input Type: str or cellstr
S.BF = 'path/to/BF';
```

## Semi-universal inputs (DAiSS-Wizard only)
These inputs are not required by every output method, but it sometimes help that many of the common ones can be called simply.

#### conditions
Specify which trials you'd like to be included when generating the output. Can be either all trials or a subset of conditions
##### Case: All Trials
```matlab
% DAiSS-Wizard
% Default: 'all'
% Input Type: str or cellstr
S.conditions = 'all';
```
##### Case: Specific conditions
```matlab
% DAiSS-Wizard
% Default: 'all'
% Input Type: cellstr
S.conditions = {'condtion_01','condition_02');
```

#### contrast
Specify the contrast between conditions
```matlab
% DAiSS-Wizard
% Default: 1
% Input Type: numeric
S.conditions = [1 -1]; % subtract second condition from first
```

#### foi
Which requency band(s) of interest do you want to filter in? <img src="https://render.githubusercontent.com/render/math?math=n_{bands} \times 2"> to specify multiple windows. 
```matlab
% DAiSS-Wizard
% Default: [0 Inf]
% Input Type: numeric
S.foi = [13 30];
```

#### woi
Which window(s) of interest in each trial do you want to use? Can be an n x 2 matrix to specify multiple windows. Specify in milliseconds.
```matlab
% DAiSS-Wizard
% Default: [-Inf Inf]
% Input Type: numeric
S.woi = [0 1000]; % for the first second of each trial
```
