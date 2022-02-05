# Data Command List

The data module is imports the necessary data from an SPM MEEG object to set up a DAiSS BF structure. This allows a single SPM dataset to have simulatanously SPM inversions and DAiSS source imaging without the two interferening.

## Commands

### dir
Path to directory where BF.mat will be saved.

*matlabbatch*
```matlab
matlabbatch{1}.spm.tools.beamforming.features.dir = {'/path/to/BF/'};
```

*DAiSS-Wizard*
```matlab
S.dir = '/path/to/BF/';
```