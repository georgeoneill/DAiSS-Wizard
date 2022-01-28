# DAiSS Wizard
[DAiSS](http://github.com/spm/DAiSS/), the SPM toolbox for volumetric source analysis of M/EEG data is powerful, but the learning curve to scripting with it is steep. This set of helper scripts and tutorials aim to resolve that.

Make your code go from this:

```matlab
matlabbatch = [];
matlabbatch{1}.spm.tools.beamforming.features.BF = {'/path/to/BF.mat'};
matlabbatch{1}.spm.tools.beamforming.features.whatconditions.all = 1;
matlabbatch{1}.spm.tools.beamforming.features.woi = [-Inf Inf];
matlabbatch{1}.spm.tools.beamforming.features.modality = {'MEG'};
matlabbatch{1}.spm.tools.beamforming.features.fuse = 'no';
matlabbatch{1}.spm.tools.beamforming.features.cross_terms = 'megeeg';
matlabbatch{1}.spm.tools.beamforming.features.plugin.cov.foi = [1 48];
matlabbatch{1}.spm.tools.beamforming.features.plugin.cov.taper = 'hanning';
matlabbatch{1}.spm.tools.beamforming.features.regularisation.minkatrunc.reduce = 1;
matlabbatch{1}.spm.tools.beamforming.features.bootstrap = false;
matlabbatch{1}.spm.tools.beamforming.features.visualise = true;
spm_jobman('run',matlabbatch);
```
to this

```matlab
S               = [];
S.BF            = files.BF;
S.method        = 'cov';
S.cov.foi       = [1 48];
S.reg           = 'minkatrunc';
 
matlabbatch     = bf_wizard_features(S);
spm_jobman('run',matlabbatch);
```
