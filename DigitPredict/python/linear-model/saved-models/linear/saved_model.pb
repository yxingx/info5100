÷
Ů
A
AddV2
x"T
y"T
z"T"
Ttype:
2	

ApplyGradientDescent
var"T

alpha"T

delta"T
out"T" 
Ttype:
2	"
use_lockingbool( 

ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
h
Equal
x"T
y"T
z
"
Ttype:
2	
"$
incompatible_shape_errorbool(
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
,
Log
x"T
y"T"
Ttype:

2
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
8
MergeSummary
inputs*N
summary"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
5

Reciprocal
x"T
y"T"
Ttype:

2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.15.02v1.15.0-rc3-22-g590d6eef7e r
f
xPlaceholder*
dtype0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
shape:˙˙˙˙˙˙˙˙˙
n
PlaceholderPlaceholder*
dtype0*
shape:˙˙˙˙˙˙˙˙˙
*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

f
zeros/shape_as_tensorConst*
dtype0*
valueB"  
   *
_output_shapes
:
P
zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
m
zerosFillzeros/shape_as_tensorzeros/Const*
_output_shapes
:	
*

index_type0*
T0
~
Variable
VariableV2*
dtype0*
shared_name *
_output_shapes
:	
*
shape:	
*
	container 

Variable/AssignAssignVariablezeros*
T0*
_class
loc:@Variable*
_output_shapes
:	
*
use_locking(*
validate_shape(
j
Variable/readIdentityVariable*
T0*
_output_shapes
:	
*
_class
loc:@Variable
T
zeros_1Const*
dtype0*
_output_shapes
:
*
valueB
*    
v

Variable_1
VariableV2*
shape:
*
dtype0*
shared_name *
_output_shapes
:
*
	container 

Variable_1/AssignAssign
Variable_1zeros_1*
_class
loc:@Variable_1*
validate_shape(*
_output_shapes
:
*
use_locking(*
T0
k
Variable_1/readIdentity
Variable_1*
_class
loc:@Variable_1*
T0*
_output_shapes
:

z
MatMulMatMulxVariable/read*
transpose_a( *
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
transpose_b( 
W
addAddV2MatMulVariable_1/read*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
C
ySoftmaxadd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

S
weights/tagConst*
dtype0*
valueB Bweights*
_output_shapes
: 
X
weightsHistogramSummaryweights/tagVariable/read*
T0*
_output_shapes
: 
Q

biases/tagConst*
valueB Bbiases*
dtype0*
_output_shapes
: 
X
biasesHistogramSummary
biases/tagVariable_1/read*
T0*
_output_shapes
: 
M
cost_function/LogLogy*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
j
cost_function/mulMulPlaceholdercost_function/Log*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
d
cost_function/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
~
cost_function/SumSumcost_function/mulcost_function/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
L
cost_function/NegNegcost_function/Sum*
T0*
_output_shapes
: 
|
 cost_function/cost_function/tagsConst*
dtype0*,
value#B! Bcost_function/cost_function*
_output_shapes
: 

cost_function/cost_functionScalarSummary cost_function/cost_function/tagscost_function/Neg*
T0*
_output_shapes
: 
X
train/gradients/ShapeConst*
dtype0*
valueB *
_output_shapes
: 
^
train/gradients/grad_ys_0Const*
valueB
 *  ?*
dtype0*
_output_shapes
: 

train/gradients/FillFilltrain/gradients/Shapetrain/gradients/grad_ys_0*

index_type0*
T0*
_output_shapes
: 
h
*train/gradients/cost_function/Neg_grad/NegNegtrain/gradients/Fill*
_output_shapes
: *
T0

4train/gradients/cost_function/Sum_grad/Reshape/shapeConst*
dtype0*
valueB"      *
_output_shapes
:
Ň
.train/gradients/cost_function/Sum_grad/ReshapeReshape*train/gradients/cost_function/Neg_grad/Neg4train/gradients/cost_function/Sum_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes

:
}
,train/gradients/cost_function/Sum_grad/ShapeShapecost_function/mul*
out_type0*
_output_shapes
:*
T0
Ő
+train/gradients/cost_function/Sum_grad/TileTile.train/gradients/cost_function/Sum_grad/Reshape,train/gradients/cost_function/Sum_grad/Shape*
T0*

Tmultiples0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

w
,train/gradients/cost_function/mul_grad/ShapeShapePlaceholder*
T0*
out_type0*
_output_shapes
:

.train/gradients/cost_function/mul_grad/Shape_1Shapecost_function/Log*
T0*
out_type0*
_output_shapes
:
đ
<train/gradients/cost_function/mul_grad/BroadcastGradientArgsBroadcastGradientArgs,train/gradients/cost_function/mul_grad/Shape.train/gradients/cost_function/mul_grad/Shape_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0
Ł
*train/gradients/cost_function/mul_grad/MulMul+train/gradients/cost_function/Sum_grad/Tilecost_function/Log*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

Ű
*train/gradients/cost_function/mul_grad/SumSum*train/gradients/cost_function/mul_grad/Mul<train/gradients/cost_function/mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
Ó
.train/gradients/cost_function/mul_grad/ReshapeReshape*train/gradients/cost_function/mul_grad/Sum,train/gradients/cost_function/mul_grad/Shape*
T0*
Tshape0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


,train/gradients/cost_function/mul_grad/Mul_1MulPlaceholder+train/gradients/cost_function/Sum_grad/Tile*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
á
,train/gradients/cost_function/mul_grad/Sum_1Sum,train/gradients/cost_function/mul_grad/Mul_1>train/gradients/cost_function/mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
Ů
0train/gradients/cost_function/mul_grad/Reshape_1Reshape,train/gradients/cost_function/mul_grad/Sum_1.train/gradients/cost_function/mul_grad/Shape_1*
Tshape0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

Ł
7train/gradients/cost_function/mul_grad/tuple/group_depsNoOp/^train/gradients/cost_function/mul_grad/Reshape1^train/gradients/cost_function/mul_grad/Reshape_1
Ş
?train/gradients/cost_function/mul_grad/tuple/control_dependencyIdentity.train/gradients/cost_function/mul_grad/Reshape8^train/gradients/cost_function/mul_grad/tuple/group_deps*A
_class7
53loc:@train/gradients/cost_function/mul_grad/Reshape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
°
Atrain/gradients/cost_function/mul_grad/tuple/control_dependency_1Identity0train/gradients/cost_function/mul_grad/Reshape_18^train/gradients/cost_function/mul_grad/tuple/group_deps*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*C
_class9
75loc:@train/gradients/cost_function/mul_grad/Reshape_1
¸
1train/gradients/cost_function/Log_grad/Reciprocal
ReciprocalyB^train/gradients/cost_function/mul_grad/tuple/control_dependency_1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
Ů
*train/gradients/cost_function/Log_grad/mulMulAtrain/gradients/cost_function/mul_grad/tuple/control_dependency_11train/gradients/cost_function/Log_grad/Reciprocal*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0

train/gradients/y_grad/mulMul*train/gradients/cost_function/Log_grad/muly*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
w
,train/gradients/y_grad/Sum/reduction_indicesConst*
dtype0*
_output_shapes
: *
valueB :
˙˙˙˙˙˙˙˙˙
ş
train/gradients/y_grad/SumSumtrain/gradients/y_grad/mul,train/gradients/y_grad/Sum/reduction_indices*
	keep_dims(*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*

Tidx0

train/gradients/y_grad/subSub*train/gradients/cost_function/Log_grad/multrain/gradients/y_grad/Sum*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
t
train/gradients/y_grad/mul_1Multrain/gradients/y_grad/suby*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
d
train/gradients/add_grad/ShapeShapeMatMul*
_output_shapes
:*
T0*
out_type0
o
 train/gradients/add_grad/Shape_1ShapeVariable_1/read*
_output_shapes
:*
T0*
out_type0
Ć
.train/gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgstrain/gradients/add_grad/Shape train/gradients/add_grad/Shape_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0
ą
train/gradients/add_grad/SumSumtrain/gradients/y_grad/mul_1.train/gradients/add_grad/BroadcastGradientArgs*
	keep_dims( *
T0*
_output_shapes
:*

Tidx0
Š
 train/gradients/add_grad/ReshapeReshapetrain/gradients/add_grad/Sumtrain/gradients/add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

ľ
train/gradients/add_grad/Sum_1Sumtrain/gradients/y_grad/mul_10train/gradients/add_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
T0*
	keep_dims( 
˘
"train/gradients/add_grad/Reshape_1Reshapetrain/gradients/add_grad/Sum_1 train/gradients/add_grad/Shape_1*
T0*
_output_shapes
:
*
Tshape0
y
)train/gradients/add_grad/tuple/group_depsNoOp!^train/gradients/add_grad/Reshape#^train/gradients/add_grad/Reshape_1
ň
1train/gradients/add_grad/tuple/control_dependencyIdentity train/gradients/add_grad/Reshape*^train/gradients/add_grad/tuple/group_deps*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*3
_class)
'%loc:@train/gradients/add_grad/Reshape
ë
3train/gradients/add_grad/tuple/control_dependency_1Identity"train/gradients/add_grad/Reshape_1*^train/gradients/add_grad/tuple/group_deps*5
_class+
)'loc:@train/gradients/add_grad/Reshape_1*
T0*
_output_shapes
:

Ç
"train/gradients/MatMul_grad/MatMulMatMul1train/gradients/add_grad/tuple/control_dependencyVariable/read*
transpose_a( *
T0*
transpose_b(*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
´
$train/gradients/MatMul_grad/MatMul_1MatMulx1train/gradients/add_grad/tuple/control_dependency*
transpose_a(*
T0*
transpose_b( *
_output_shapes
:	


,train/gradients/MatMul_grad/tuple/group_depsNoOp#^train/gradients/MatMul_grad/MatMul%^train/gradients/MatMul_grad/MatMul_1
ý
4train/gradients/MatMul_grad/tuple/control_dependencyIdentity"train/gradients/MatMul_grad/MatMul-^train/gradients/MatMul_grad/tuple/group_deps*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*5
_class+
)'loc:@train/gradients/MatMul_grad/MatMul
ú
6train/gradients/MatMul_grad/tuple/control_dependency_1Identity$train/gradients/MatMul_grad/MatMul_1-^train/gradients/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@train/gradients/MatMul_grad/MatMul_1*
_output_shapes
:	

h
#train/GradientDescent/learning_rateConst*
valueB
 *
×#<*
_output_shapes
: *
dtype0

:train/GradientDescent/update_Variable/ApplyGradientDescentApplyGradientDescentVariable#train/GradientDescent/learning_rate6train/gradients/MatMul_grad/tuple/control_dependency_1*
_class
loc:@Variable*
T0*
use_locking( *
_output_shapes
:	


<train/GradientDescent/update_Variable_1/ApplyGradientDescentApplyGradientDescent
Variable_1#train/GradientDescent/learning_rate3train/gradients/add_grad/tuple/control_dependency_1*
_class
loc:@Variable_1*
T0*
_output_shapes
:
*
use_locking( 

train/GradientDescentNoOp;^train/GradientDescent/update_Variable/ApplyGradientDescent=^train/GradientDescent/update_Variable_1/ApplyGradientDescent
2
initNoOp^Variable/Assign^Variable_1/Assign
q
Merge/MergeSummaryMergeSummaryweightsbiasescost_function/cost_function*
N*
_output_shapes
: 
R
ArgMax/dimensionConst*
_output_shapes
: *
dtype0*
value	B :
r
ArgMaxArgMaxyArgMax/dimension*
T0*
output_type0	*

Tidx0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
T
ArgMax_1/dimensionConst*
_output_shapes
: *
dtype0*
value	B :

ArgMax_1ArgMaxPlaceholderArgMax_1/dimension*
T0*

Tidx0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
output_type0	
n
EqualEqualArgMaxArgMax_1*
incompatible_shape_error(*
T0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
CastCastEqual*

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Truncate( *

SrcT0

O
ConstConst*
valueB: *
_output_shapes
:*
dtype0
W
MeanMeanCastConst*
	keep_dims( *
_output_shapes
: *
T0*

Tidx0
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
_output_shapes
: *
dtype0
e

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
_output_shapes
: *
dtype0

save/StringJoin/inputs_1Const*
dtype0*<
value3B1 B+_temp_32aadcb81f85423281695231efa9bb62/part*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
_output_shapes
: *
dtype0
\
save/ShardedFilename/shardConst*
dtype0*
value	B : *
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
u
save/SaveV2/tensor_namesConst*
dtype0*)
value BBVariableB
Variable_1*
_output_shapes
:
g
save/SaveV2/shape_and_slicesConst*
valueBB B *
_output_shapes
:*
dtype0

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesVariable
Variable_1*
dtypes
2

save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*'
_class
loc:@save/ShardedFilename*
T0*
_output_shapes
: 

+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*

axis *
T0*
N*
_output_shapes
:
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency*
T0*
_output_shapes
: 
x
save/RestoreV2/tensor_namesConst*
dtype0*)
value BBVariableB
Variable_1*
_output_shapes
:
j
save/RestoreV2/shape_and_slicesConst*
valueBB B *
_output_shapes
:*
dtype0

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes

::*
dtypes
2

save/AssignAssignVariablesave/RestoreV2*
_class
loc:@Variable*
_output_shapes
:	
*
use_locking(*
T0*
validate_shape(
˘
save/Assign_1Assign
Variable_1save/RestoreV2:1*
validate_shape(*
T0*
_class
loc:@Variable_1*
_output_shapes
:
*
use_locking(
8
save/restore_shardNoOp^save/Assign^save/Assign_1
-
save/restore_allNoOp^save/restore_shard "<
save/Const:0save/Identity:0save/restore_all (5 @F8"C
	summaries6
4
	weights:0
biases:0
cost_function/cost_function:0"
	variables~
9

Variable:0Variable/AssignVariable/read:02zeros:08
A
Variable_1:0Variable_1/AssignVariable_1/read:02	zeros_1:08"%
train_op

train/GradientDescent"
trainable_variables~
9

Variable:0Variable/AssignVariable/read:02zeros:08
A
Variable_1:0Variable_1/AssignVariable_1/read:02	zeros_1:08*r
serving_default_
 
x
x:0˙˙˙˙˙˙˙˙˙
y
y:0˙˙˙˙˙˙˙˙˙
tensorflow/serving/predict