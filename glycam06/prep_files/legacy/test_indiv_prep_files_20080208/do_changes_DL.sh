#!/bin/bash
##loc="/home/lachele/PREP_FIX_20071211/indiv_prep_files_errorfix_BLF_20071211"
prog="/home/lachele/software/change_DL_prep_charges/change_chg_DL_prep"
## PREP_CHECK/Fru_f_result.dat
$prog Fru_Ddu_04.prep Fru_Ldu_04.prep Fru_f D
##PREP_CHECK/Fuc_p_result.dat
$prog Fuc_Dab_04.prep Fuc_Lab_04.prep Fuc_p L
## PREP_CHECK/Gal_p_result.dat
$prog Gal_Dab_04.prep Gal_Lab_04.prep Gal_p D
## PREP_CHECK/Glc_p_result.dat
$prog Glc_Dab_04.prep Glc_Lab_04.prep Glc_p D
## PREP_CHECK/ManNac_p_result.dat
$prog ManNAc_Dab_04.prep ManNAc_Lab_04.prep ManNac_p D
## PREP_CHECK/Psi_f_result.dat
$prog Psi_Ddu_04.prep Psi_Ldu_04.prep Psi_f D
## PREP_CHECK/Rha_p_result.dat
$prog Rha_Dab_04.prep Rha_Lab_04.prep Rha_p L
## PREP_CHECK/Sor_f_result.dat
$prog Sor_Ddu_04.prep Sor_Ldu_04.prep Sor_f D
## PREP_CHECK/Sor_p_result.dat
$prog Sor_Dab_04.prep Sor_Lab_04.prep Sor_p D
## PREP_CHECK/Tag_f_result.dat
$prog Tag_Ddu_04.prep Tag_Ldu_04.prep Tag_f D
