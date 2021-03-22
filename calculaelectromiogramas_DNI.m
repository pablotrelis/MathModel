function [var]=calculaelectromiogramas_DNI
clear
load AP_ventriculo.mat
% SANO
AP_sano5=repmat(AP_sano,5);
AP_sano5=AP_sano5(1,:);
AP_sano_des=[AP_sano5(1,:) AP_sano];
AP_sano_des=AP_sano_des(30:5029);
var.AP_sano=AP_sano5;
var.AP_sano_des=AP_sano_des;
% ISCH
AP_isch5=repmat(AP_isch,5);
AP_isch5=AP_isch5(1,:);
AP_isch_des=[AP_isch5(1,:) AP_isch];
AP_isch_des=AP_isch_des(30:5029);
var.AP_isch=AP_isch5;
var.AP_isch_des=AP_isch_des;
var.EGM_sano=AP_sano5-AP_sano_des;
var.EGM_ischemico=AP_isch5-AP_isch_des;
var.EGM_transicion=AP_sano5-AP_isch_des;



end