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
- [bootstrap](#cross_terms)
- [visualise](#visualise)

#### Plugins for matrix generation
- [contcov](#contcov)
- [cov](#cov)
- cov_bysamples
- csd
- identity
- regmulticov
- tdcov
- vbfa

#### Plugins for regularisation

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

#### bootstrap
Generate the matrix using a bootstap selection of trials. e.g. instead of trials `[1 2 3 4 5 6 7 8 9]` you would make a matrix out of trials `[1 1 1 4 5 6 7 7 9]` instead. 

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: logical
matlabbatch{1}.spm.tools.beamforming.features.bootstrap = false; 

% DAiSS-Wizard
% Default: false
% Input Type: logical
S.bootstrap = false;
```

#### visualise
Visualise the eignespectrum of the generated covariance matrix, can be useful for identifying the number of components to cut/keep when regularising.

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: logical
matlabbatch{1}.spm.tools.beamforming.features.visualise = true; 

% DAiSS-Wizard
% Default: true
% Input Type: logical
S.visualise = true;
```

## Matrix generation plugins
### contcov
A.K.A robust covariance. Performs the operation <img src="https://render.githubusercontent.com/render/math?math=C=\frac{1}{n}YY^T">. This function assumes the data has been filtered prior to this step. No extra flags to call as such but need to explicitly call the method. Can work for epoched or continuous data.

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: N/A
matlabbatch{1}.spm.tools.beamforming.features.plugins.contcov = {}; 

% DAiSS-Wizard
% Default: N/A
% Input Type: N/A
S.method = 'contcov';
```

### cov
Band-pass filtered covariance matrix. Data is filtered using a discrete cosine transform (DCT) prior to covarianc calculation. **Warning:** this method will only work on epoched data due to the <img src="https://render.githubusercontent.com/render/math?math=n_{samples} \times n_{samples}"> matrix required to do the filtering using a DCT.

#### foi
Which requency band(s) of interest do you want to filter in? <img src="https://render.githubusercontent.com/render/math?math=n_{bands} \times 2"> to specify multiple windows. 
```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: numeric
matlabbatch{1}.spm.tools.features.features.plugin.cov.foi = [13 30]; % for the first second of each trial

% DAiSS-Wizard
% Default: [0 Inf]
% Input Type: numeric
S.method = 'cov'; % for the first second of each trial
S.cov.foi = [13 30];
```

#### taper
Apply a hanning window to minimise the effects of edge-of-epoch effects.
Options:
- **hanning**: Apply the hanning window
- **none**: do nothing
```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: str
matlabbatch{1}.spm.tools.features.features.plugin.cov.taper = 'hanning'; % for the first second of each trial

% DAiSS-Wizard
% Default: 'hanning'
% Input Type: numeric
S.method = 'cov'; % for the first second of each trial
S.cov.taper = 'hanning';
```