function [matlabbatch, headmodel] = bf_wizard_headmodel(S)

% A handy command-line based batch filler with some defaults for SPM
% head model specification for MEEG data. Will generate the job which
% performs coregistration between the data and the MRI

if ~isfield(S,'batch'); matlabbatch = []; else; matlabbatch = S.batch;  end
if ~isfield(S,'D');       error('I need a SPM MEEG object specified!'); end
if ~isfield(S,'fiducial');   error('I need fiducials specified!');      end
if ~isfield(S,'val');           S.val = 1;                              end
if ~isfield(S,'commment');      S.comment = '';                         end
if ~isfield(S,'mri');           S.mri = [];                             end
if ~isfield(S,'iskull');        S.iskull = [];                          end
if ~isfield(S,'oskull');        S.oskull = [];                          end
if ~isfield(S,'scalp');         S.scalp = [];                           end
if ~isfield(S,'cortex');        S.cortex = [];                          end
if ~isfield(S,'fsfix');         S.fsfix = false;                        end
if ~isfield(S,'template');      S.template = false;                     end
if ~isfield(S,'meshres');       S.meshres = 2;                         	end
if ~isfield(S,'useheadshape');  S.useheadshape = false;                 end
if ~isfield(S,'forward');       S.forward = struct;                     end
if ~isfield(S.forward,'eeg');   S.forward.eeg = 'EEG BEM';              end
if ~isfield(S.forward,'meg');   S.forward.meg = 'Single Shell';         end

headmodel = struct();
switch class(S.D)
    case 'meeg'
        tmp = fullfile(D.path,D.fname);
        S.D = {tmp};
    case 'char'
        S.D = {S.D};
end
headmodel.val = S.val;
headmodel.comment = S.comment;

% Check if using template MRI, subject MRI and/or custom meshes
% S.template being true overrides all other commands
if S.template
    headmodel.meshing.meshes.template = 1;
else
    % check if all the custom mesh fields are empty
    if isempty(S.cortex) && isempty(S.iskull) ...
            && isempty(S.oskull) && isempty(S.scalp)
        headmodel.meshing.meshes.mri = S.mri;
    else
        headmodel.meshing.meshes.custom.mri = S.mri;
        targets = {'cortex','iskull','oskull','scalp'};
        for ii = 1:numel(targets)
            if isempty(S.(targets{ii}))
                S.(targets{ii}) = {''};
            else
                if S.fsfix 
                end
                
               S.(targets{ii}) = {S.(targets{ii})}; 
            end
        end
    end
end

headmodel.meshing.meshres = S.meshres;

% Fiducial things
fid = [];
for ii = 1:numel(S.fiducials)
    
   fid(ii).fidname = S.fiducials(ii).name;
   
   if isnumerc(S.fiducials(ii).location)
       fid(ii).specification.type = S.fiducials(ii).location;
   elseif ischar(S.fiducials(ii).location)
       fid(ii).specification.select = S.fiducials(ii).location;
   else
       error('not a valid fiducial location!')
   end
       
end
headmodel.coregistration.coregspecify.fiducial = fid;
headmodel.coregistration.coregspecify.useheadshape = S.useheadshape;

headmodel.forward = S.forward;

% determine number of jobs in list then iterate by 1;
jobID = numel(matlabbatch) + 1;
% generate matlabbatch
matlabbatch{jobID}.spm.meeg.source.headmodel = headmodel;
end

function g_fixed = fix_fs_offset(g,mri)
% Function to fix the offset of the freesurfer derived meshes for SPM.
    

    
end
