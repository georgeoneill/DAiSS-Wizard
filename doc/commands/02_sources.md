# Sources Module Command List

The source module generates the source space used for forward/inverse calculations and calculated the forward solutions. 


#### List of available top-level commands
- [BF](#BF)
- reduce_rank
- keep3d
- normalise_lf
- visualise

#### List of available plugins (and their own commands)
- grid
  - resolution
  - space
  - constrain  
- mesh

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

#### reduce_rank
Specify how many degrees of freedom we want in our forward solutions (for a given source) for both MEG and EEG simultaneously. Typically for most use cases we specify 2 for MEG (due to the silent radial compenent) and 3 for EEG. However there are some cases where this might be different (e.g. magnetic dipole modelling with MEG).
A two element vector is required, the first element is the MEG degrees of freedom and the second the EEG. (Both elements requied even if you are only using one modality).

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: int or double array (size: 1 x 2)
matlabbatch{1}.spm.tools.beamforming.sources.reduce_rank = [2 3];

% DAiSS-Wizard
% Default: [2 3]
% Input Type: int or double array (size: 1 x 2)
S.reduce_rank = [2 3];
```

#### keep_3d 
If there has been a rank reduction specified by [reduce_rank](#reduce_rank) then setting this to true ensures that there are still 3 reported lead field patterns for each source (rather than collapsed to to the number of degrees of freedom previously specified).

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: logical
matlabbatch{1}.spm.tools.beamforming.sources.keep_3d = true;

% DAiSS-Wizard
% Default: true
% Input Type: logical
S.keep_3d = true;
```

#### normalise_lf
Normalised each lead field such that the 2-norm of each is 1. Can be useful for some rudimentary depth correction (e.g. making beamformers less biased to deep sources, and the MNE-type solutions for superficial sources). 

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: false
matlabbatch{1}.spm.tools.beamforming.sources.normalise_lf = false;

% DAiSS-Wizard
% Default: false
% Input Type: logical
S.normalise_lf = false;
```

#### visualise
Would you like to see what the source space and sensors aligned looks like? (**WARNING**: Using the UK spelling here, bf_wizard_sources might check for this for an Americanization in the future, but using raw matlabbatch coding will probably trip over if spelled visualize!)

```matlab

% matlabbatch
% Default: REQUIRED
% Input Type: true
matlabbatch{1}.spm.tools.beamforming.sources.visualise = true;

% DAiSS-Wizard
% Default: true
% Input Type: logical
S.visualise = true;
```

## Plugins (source space generation mathods)

### grid

This pugin facilitates seting up a regular volumetric grid within a spefied region of the brain. Good for spatial filter methods (such as beamformers) but can be used in other cases if you want.
