# Features Module Command List
This module is responsible for for the preparation of a features matrix (normally a covariance) required as a part of an inverse model for source reconstruction.
This also allows us to inspect the eigenspectrum of the matrix and regularise to allow for more stable solutions.

#### Top-level commands
- [BF](#BF)
- [whatconditions](#whatconditions)
- [woi](#woi)
- [modality](#modality)
- [fuse](#fuse)
- [cross_terms](#cross_terms)
- bootstrap
- visualise

#### Plugins for matrix generation
#### Plugins for reguularisation

## Commands
#### BF
Path to BF.mat file

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.features.BF = {'/path/to/BF/'};

% DAiSS-Wizard
% Default: REQUIRED
% Input Type: str or cellstr
S.BF = 'path/to/BF';
```
#### whatconditions
Specify which trials you'd like to be included when generating the features matrix. Can be either all trials or a subset of conditions
##### Case: All Trials
```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: logical
matlabbatch{1}.spm.tools.beamforming.features.whatconditions.all = 1;

% DAiSS-Wizard
% Default: 'all'
% Input Type: str or cellstr
S.conditions = 'all';
```
##### Case: Specific conditions
```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.features.whatconditions.conditions = {'condtion_01','condition_02');

% DAiSS-Wizard
% Default: 'all'
% Input Type: cellstr
S.conditions = {'condtion_01','condition_02');
```

#### woi
Which window(s) of interest in each trial do you want to use? Can be an n x 2 matrix to specify multiple windows. Specify in milliseconds.
```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: numeric
matlabbatch{1}.spm.tools.beamforming.features.woi = [0 1000]; % for the first second of each trial

% DAiSS-Wizard
% Default: [-Inf Inf]
% Input Type: numeric
S.woi = [0 1000]; % for the first second of each trial
```

#### modality
Which modality/modalities do you want to build a features matrix with? Combinw the options below in a cell array to specify multiple modalities.

Options:
- MEG
- MEGPLANAR
- EEG

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: cellstr
matlabbatch{1}.spm.tools.beamforming.features.modality = {'MEG','EEG'}; % for concurrent MEG/EEG


% DAiSS-Wizard
% Default: {'MEG'}
% Input Type: str or cellstr
S.modality = {'EEG'}; % for just EEG sensors
```

#### fuse
Fuse sensors from different modalities together (assume scaling/pre-whitening has already been performed prior to DAiSS).

Options:
- **no**.       Do not combine. *default for DAiSS-Wizard*
- **meg**.      Use this for Elekta/MEGIN systems where planar gradiometers and magnetometers are both being used.
- **all**.      Comvine all in the selected modalities together!

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: str
matlabbatch{1}.spm.tools.beamforming.features.fuse = 'no'; % for concurrent MEG/EEG


% DAiSS-Wizard
% Default: 'no'
% Input Type: str
S.fuse = 'no'; % for just EEG sensors
```

#### cross_terms
If fusing modalities, set the cross terms between modalities in the matrix to zero.



Options:
- **meegeeg**.      Set terms between MEG and EEG to zero. (Default in DAiSS-Wizard)
- **all**.          Set only different kinds of MEG sensors to zero (might be useful for MEGIN/Elekta)
- **no**.           Don't set cross-terms to zero

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: str
matlabbatch{1}.spm.tools.beamforming.features.cross_terms = 'meegeeg'; 


% DAiSS-Wizard
% Default: 'megeeg'
% Input Type: str
S.cross_terms = 'megeeg'; % for just EEG sensors
```
