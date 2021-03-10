%function calculaelectromiogramas_DNI
clear
load AP_ventriculo.mat
% SANO
AP_sano5=repmat(AP_sano,5);
AP_sano5=AP_sano5(1,:);
AP_sano_des=[AP_sano5(1,:) AP_sano];
AP_sano_des=AP_sano_des(30:5029);
% ISCH
AP_isch5=repmat(AP_isch,5);
AP_isch5=AP_isch5(1,:);
AP_isch_des=[AP_isch5(1,:) AP_isch];
AP_isch_des=AP_isch_des(30:5029);

figure
plot(AP_sano5)
hold on
plot(AP_sano_des)
hold off
title('Sano y Sano desfasado')
figure
plot(AP_isch5)
hold on
plot(AP_isch_des)
hold off
title('Isch y Isch desfasado')
EGM_sano=AP_sano5-AP_sano_des;
EGM_ischemico=AP_isch5-AP_isch_des;
EGM_transicion=AP_sano5-AP_isch_des;
figure
plot(EGM_sano);
title('SANO')
figure
plot(EGM_ischemico);
title('ISCH')
figure
plot(EGM_transicion);
title('TRANS')


%end