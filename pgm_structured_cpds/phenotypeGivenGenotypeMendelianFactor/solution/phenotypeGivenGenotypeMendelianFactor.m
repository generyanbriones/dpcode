function phenotypeFactor = phenotypeGivenGenotypeMendelianFactor(isDominant, genotypeVar, phenotypeVar)
% This function computes the probability of each phenotype given the
% different genotypes for a trait.  It assumes that there is 1 dominant
% allele and 1 recessive allele.
%
% If you do not have much background in genetics, you should read the
% on-line Appendix or watch the Khan Academy Introduction to Heredity Video
% (http://www.khanacademy.org/video/introduction-to-heredity?playlist=Biology)
% before you start coding.
%
% For the genotypes, assignment 1 maps to homozygous dominant, assignment 2
% maps to heterozygous, and assignment 3 maps to homozygous recessive.  For
% example, say that there is a gene with two alleles, dominant allele A and
% recessive allele a.  Assignment 1 would map to AA, assignment 2 would
% make to Aa, and assignment 3 would map to aa.  For the phenotypes, 
% assignment 1 maps to having the physical trait, and assignment 2 maps to 
% not having the physical trait.
%
% THE VARIABLE TO THE LEFT OF THE CONDITIONING BAR MUST BE THE FIRST
% VARIABLE IN THE .var FIELD FOR GRADING PURPOSES
%
% Input:
%   isDominant: 1 if the trait is caused by the dominant allele (trait 
%   would be caused by A in example above) and 0 if the trait is caused by
%   the recessive allele (trait would be caused by a in the example above)
%   genotypeVar: The variable number for the genotype variable (goes in the
%   .var part of the factor)
%   phenotypeVar: The variable number for the phenotype variable (goes in
%   the .var part of the factor)
%
% Output:
%   phenotypeFactor: Factor denoting the probability of having each 
%   phenotype for each genotype

phenotypeFactor = struct('var', [], 'card', [], 'val', []);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INSERT YOUR CODE HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Fill in phenotypeFactor.var.  This should be a 1-D row vector.
phenotypeFactor.var = [phenotypeVar genotypeVar];
% Fill in phenotypeFactor.card.  This should be a 1-D row vector.
phenotypeFactor.card = [2, 3];

phenotypeFactor.val = zeros(1, prod(phenotypeFactor.card));
% Replace the zeros in phentoypeFactor.val with the correct values.
phenotypeFactor = SetValueOfAssignment(phenotypeFactor, [1, 1], isDominant);
phenotypeFactor = SetValueOfAssignment(phenotypeFactor, [2, 2], !isDominant);
phenotypeFactor = SetValueOfAssignment(phenotypeFactor, [1, 3], !isDominant);
phenotypeFactor = SetValueOfAssignment(phenotypeFactor, [2, 1], !isDominant);
phenotypeFactor = SetValueOfAssignment(phenotypeFactor, [1, 2], isDominant);
phenotypeFactor = SetValueOfAssignment(phenotypeFactor, [2, 3], isDominant);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PhenotypeVar | GenotypeVar | P(Phenotype|Genotype) with isDominant = 1 | P(Phenotype|Genotype) with isDominant = 0 |
%       1 (A) |      1 (AA) |                     1                     |                     0                     |
%       2 (a) |      1 (AA) |                     0                     |                     1                     |
%       1 (A) |      2 (Aa) |                     1                     |                     0                     |
%       2 (a) |      2 (Aa) |                     0                     |                     1                     |
%       1 (A) |      3 (aa) |                     0                     |                     1                     |
%       2 (a) |      3 (aa) |                     1                     |                     0                     |

test phenotypeGivenGenotypeMendelianFactor

%!test
%! isDominant = 1;
%! genotypeVar = 1;
%! phenotypeVar = 3;
%! phenotypeFactor = phenotypeGivenGenotypeMendelianFactor(isDominant, genotypeVar, phenotypeVar);
%! assert(phenotypeFactor, struct('var', [3,1], 'card', [2,3], 'val', [1,0,1,0,0,1]));
%! isDominant = 0;
%! phenotypeFactor = phenotypeGivenGenotypeMendelianFactor(isDominant, genotypeVar, phenotypeVar);
%! assert(phenotypeFactor, struct('var', [3,1], 'card', [2,3], 'val', [0,1,0,1,1,0]));
