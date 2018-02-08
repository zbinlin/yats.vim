syntax region  typescriptObjectLiteral         matchgroup=typescriptBraces
  \ start=/{/ end=/}/
  \ contains=@typescriptComments,typescriptObjectLabel,typescriptPropertyName,typescriptMethodDef,typescriptComputedPropertyName
  \ fold contained

syntax match   typescriptObjectLabel           contained /\k\+\_s*:/he=e-1 nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptPropertyName   contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\_s*:\|$/he=e-1 nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptPropertyName    contained start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1(/me=e-1 nextgroup=@typescriptCallSignature skipwhite skipempty oneline
syntax region  typescriptComputedPropertyName  contained matchgroup=typescriptPropertyName start=/\[/rs=s+1 end=/]\_s*:/he=e-1 contains=@typescriptValue nextgroup=@typescriptValue skipwhite skipempty
syntax region  typescriptComputedPropertyName  contained matchgroup=typescriptPropertyName start=/\[/rs=s+1 end=/]\_s*(/me=e-1 contains=@typescriptValue nextgroup=@typescriptCallSignature skipwhite skipempty
" Value for object, statement for label statement
syntax match typescriptRestOrSpread /\.\.\./ contained
syntax match typescriptObjectSpread /\.\.\./ contained containedin=typescriptObjectLiteral,typescriptArray nextgroup=@typescriptValue
