%kkgate 'Based on Gating Input, Output Values Will Be From Input 1 or Input 2'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros kgate.pane file
%
% Parameters: 
% InputFile: i1 'Input 1 ', required: 'First input data object'
% InputFile: i2 'Input 2 ', required: 'Second input file object'
% InputFile: igate 'Gating Input', required: 'Gating input data object'
% OutputFile: o 'Output', required: 'Resulting output data object'
%
% Example: o = kkgate({i1, i2, igate}, {'i1','';'i2','';'igate','';'o',''})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% kgate - Based on Gating Input, Output Values Will Be From Input 1 or Input 2
%
%  DESCRIPTION
% For each point in Input 1 (i1) and Input 2 (i2), "kgate" assigns 
% to the Output (o) either the value from Input 1 or Input 2, depending 
% on the corresponding value in the Gating Input (igate), the specified 
% Gate Value (gval), and the gating logic (logic).
% 
% .I kgate
% can be used to gate many operations.  The illustration below shows gating 
% the addition of of two data objects.  The result of the gating is that the 
% second input is added to the first only for those pixels defined by the 
% gate object.  The data objects in the illustration are represented as
% 2x2 matrices.  For example, Input 1 is a 2x2 data file with data values
% of 3, shown as 
% 
% \f(CW
%         3 3
%         3 3
%        Input1
% "
% 
% 
% To perform a gated addition, first add the objects using the Add operator 
% (kadd).  Next use the first data object as Input 1 (i1) to "kgate", 
% and the output of the addition operation as Input 2 (i2) to "kgate".  
% The third input to "kgate" is the gating object (igate).  Using the 
% default logic option (True) and Gate Value (0), the output will get the value 
% of Input 2 any time that the value in the gate object is equal to the 
% specified Gate Value (0).  Otherwise, the output will get the value from 
% Input 1.  
% .KS
% 
%  "\fBGated Addition Example:"" 5
% 
% 
% \f(CW
%                                       +------+
%     3 3 ---+------------------------> |i1    |
%     3 3    |    +------+              |   out| --- 3 8 
%    Input1  +--> |i1    |    8 8 ----> |i2    |     8 3
%                 |   out|--- 8 8       |      |    Result
%     5 5 ------> |i2    |         +--> |igate |
%     5 5         +------+         |    +------+
%    Input2         Add            |      Gate
%                                  |
%                           1 0 ---+
%                           0 1
%                       Gating Input
% "
% 
% .KE
% 
% 
%  "Gate Value"
% The Gate Value (gval) is a constant that can be specified by the user. 
% "kgate" will compare the elements of the Gate Object against this
% value, and will gate based on whether the values in the Gate Object 
% are equal/unequal to the Gate Value.  How the gating is applied
% depends on the Gating Logic (logic), described below.
% 
%  "Gating Logic TRUE"
% When the Gating Logic is set to TRUE (ie. If value in Gating Input equals 
% Gate Value, Output = Input 2), Input 1 is predominant, and is only gated when 
% the gating condition is met.  Therefore the Output will be assigned values 
% from Input 1 "unless" the value in the Gating Input equals the specified 
% Gate Value, in which case Input 1 is gated and the Output is assigned the 
% value from Input 2.
% 
%  "Gating Logic FALSE"
% When the Gating Logic is set to FALSE (ie. If value in Gating Input equals 
% Gate Value, Output = Input 1), Input 2 is predominant, and is only gated when 
% the gating condition is met.  Therefore the Output will be assigned values 
% from Input 2 "unless" the value in the Gating Input equals the specified 
% Gate Value, in which case Input 2 is gated and the Output is assigned the 
% value from Input 1.
% 
%  "Subobject Position" 5
% If the Use Subobject Position option (subpos) is set to "Yes", then 
% the subobject position of each object will be applied.  This includes
% its use in calculating the output object size.  See the "Input Objects of 
% Different Sizes - Resizing & Padding" section below.  The subobject position
% functionality can be disabled by setting this option to "No".
% 
%  "Data Type" 5
% If the gate object is complex, only the real component will be used.
% 
% 
% .cI $DATAMANIP/repos/shared/man/sections/value_type_2input
% 
%  "Map Data" 5
% .cI $DATAMANIP/repos/shared/man/sections/map_2input
% 
%  "Validity Mask" 5
% If there is a validity mask associated with either source object, the
% destination object mask value will be assigned according to the same
% rules as apply to gating the value data.
% 
% 
% Important: The Gating object may contain mask data "or" value data, 
% but "not" both.  If mask data is supplied in the gating object, it 
% will be used only as gate values, and will not be propagated as a mask 
% to the output object.
% 
%  "Input Objects of Different Sizes - Resizing & Padding" 5
% .cI $DATAMANIP/repos/shared/man/sections/resize_2input
% 
% 
% \fBPadding": If Input 1 and/or Input 2 are enlarged, the value and/or map
% data will be zero padded; masks will be padded with ones.
% If the gating object is enlarged, it will be padded with a value "unequal" 
% to the gating value.  Note that padding, not pixel replication, is performed 
% by "kgate".  Therefore, if the user wants the gate to be replicated
% along certain dimensions, that operation must be performed before hand using
% the resampling operator (kresample).
% 
%  "Explicit Location and Time Data" 5
% .cI $DATAMANIP/repos/shared/man/sections/loc_and_time_2input
% 
%  "Failure Modes" 5
% .cI $DATAMANIP/repos/shared/man/sections/fail_2input
%
%  
%
%  EXAMPLES
%
%  "SEE ALSO"
% DATAMANIP::kblend
%
%  RESTRICTIONS 
%
%  REFERENCES 
%
%  COPYRIGHT
% Copyright (C) 1993 - 1997, Khoral Research, Inc. ("KRI")  All rights reserved.
% 


function varargout = kkgate(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kkgate(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i1', '__input';'i2', '__input';'igate', '__input';'o', '__output'};
maxval={0,0,0,0};
minval={0,0,0,0};
istoggle=[0,0,0,0];
was_set=istoggle * 0;
paramtype={'InputFile','InputFile','InputFile','OutputFile'};
% identify the input arrays and assign them to the arguments as stated by the user
if ~iscell(Inputs)
Inputs = {Inputs};
end
NumReqOutputs=1; nextinput=1; nextoutput=1;
  for ii=1:size(arglist,1)
  wasmatched=0;
  for jj=1:size(narglist,1)
   if strcmp(arglist{ii,1},narglist{jj,1})  % a given argument was matched to the possible arguments
     wasmatched = 1;
     was_set(jj) = 1;
     if strcmp(narglist{jj,2}, '__input')
      if (nextinput > length(Inputs)) 
        error(['Input ' narglist{jj,1} ' has no corresponding input!']); 
      end
      narglist{jj,2} = 'OK_in';
      nextinput = nextinput + 1;
     elseif strcmp(narglist{jj,2}, '__output')
      if (nextoutput > nargout) 
        error(['Output nr. ' narglist{jj,1} ' is not present in the assignment list of outputs !']); 
      end
      if (isempty(arglist{ii,2}))
        narglist{jj,2} = 'OK_out';
      else
        narglist{jj,2} = arglist{ii,2};
      end

      nextoutput = nextoutput + 1;
      if (minval{jj} == 0)  
         NumReqOutputs = NumReqOutputs - 1;
      end
     elseif isstr(arglist{ii,2})
      narglist{jj,2} = arglist{ii,2};
     else
        if strcmp(paramtype{jj}, 'Integer') & (round(arglist{ii,2}) ~= arglist{ii,2})
            error(['Argument ' arglist{ii,1} ' is of integer type but non-integer number ' arglist{ii,2} ' was supplied']);
        end
        if (minval{jj} ~= 0 | maxval{jj} ~= 0)
          if (minval{jj} == 1 & maxval{jj} == 1 & arglist{ii,2} < 0)
            error(['Argument ' arglist{ii,1} ' must be bigger or equal to zero!']);
          elseif (minval{jj} == -1 & maxval{jj} == -1 & arglist{ii,2} > 0)
            error(['Argument ' arglist{ii,1} ' must be smaller or equal to zero!']);
          elseif (minval{jj} == 2 & maxval{jj} == 2 & arglist{ii,2} <= 0)
            error(['Argument ' arglist{ii,1} ' must be bigger than zero!']);
          elseif (minval{jj} == -2 & maxval{jj} == -2 & arglist{ii,2} >= 0)
            error(['Argument ' arglist{ii,1} ' must be smaller than zero!']);
          elseif (minval{jj} ~= maxval{jj} & arglist{ii,2} < minval{jj})
            error(['Argument ' arglist{ii,1} ' must be bigger than ' num2str(minval{jj})]);
          elseif (minval{jj} ~= maxval{jj} & arglist{ii,2} > maxval{jj})
            error(['Argument ' arglist{ii,1} ' must be smaller than ' num2str(maxval{jj})]);
          end
        end
     end
     if ~strcmp(narglist{jj,2},'OK_out') &  ~strcmp(narglist{jj,2},'OK_in') 
       narglist{jj,2} = arglist{ii,2};
     end
   end
   end
   if (wasmatched == 0 & ~strcmp(arglist{ii,1},''))
        error(['Argument ' arglist{ii,1} ' is not a valid argument for this function']);
   end
end
% match the remaining inputs/outputs to the unused arguments and test for missing required inputs
 for jj=1:size(narglist,1)
     if  strcmp(paramtype{jj}, 'Toggle')
        if (narglist{jj,2} ==0)
          narglist{jj,1} = ''; 
        end;
        narglist{jj,2} = ''; 
     end;
     if  ~strcmp(narglist{jj,2},'__input') && ~strcmp(narglist{jj,2},'__output') && istoggle(jj) && ~ was_set(jj)
          narglist{jj,1} = ''; 
          narglist{jj,2} = ''; 
     end;
     if strcmp(narglist{jj,2}, '__input')
      if (minval{jj} == 0)  % meaning this input is required
        if (nextinput > size(Inputs)) 
           error(['Required input ' narglist{jj,1} ' has no corresponding input in the list!']); 
        else
          narglist{jj,2} = 'OK_in';
          nextinput = nextinput + 1;
        end
      else  % this is an optional input
        if (nextinput <= length(Inputs)) 
          narglist{jj,2} = 'OK_in';
          nextinput = nextinput + 1;
        else 
          narglist{jj,1} = '';
          narglist{jj,2} = '';
        end;
      end;
     else 
     if strcmp(narglist{jj,2}, '__output')
      if (minval{jj} == 0) % this is a required output
        if (nextoutput > nargout & nargout > 1) 
           error(['Required output ' narglist{jj,1} ' is not stated in the assignment list!']); 
        else
          narglist{jj,2} = 'OK_out';
          nextoutput = nextoutput + 1;
          NumReqOutputs = NumReqOutputs-1;
        end
      else % this is an optional output
        if (nargout - nextoutput >= NumReqOutputs) 
          narglist{jj,2} = 'OK_out';
          nextoutput = nextoutput + 1;
        else 
          narglist{jj,1} = '';
          narglist{jj,2} = '';
        end;
      end
     end
  end
end
if nargout
   varargout = cell(1,nargout);
else
  varargout = cell(1,1);
end
global KhorosRoot
if exist('KhorosRoot') && ~isempty(KhorosRoot)
w=['"' KhorosRoot];
else
if ispc
  w='"C:\Program Files\dip\khorosBin\';
else
[s,w] = system('which cantata');
w=['"' w(1:end-8)];
end
end
[varargout{:}]=callKhoros([w 'kgate"  '],Inputs,narglist);