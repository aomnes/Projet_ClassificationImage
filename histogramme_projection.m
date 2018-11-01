clear;

image = imread('app.tif');

%on recupere l'histogramme de l'axe des ordonnees
h_horizontale = histo_horizontale(image);
% figure('Name','Histogramme Horizontale');
% plot(result);
coord_ligne = getCoordV(h_horizontale, image);
% imshow(image);
coordEachDigits = getCoordH(coord_ligne, 20, 10, image);
%on optimise l'encapsulation des digits
coordEachDigitsOpt = optimiserEachDigit(coordEachDigits, image, 10, 20);
nb_trait = 5;
%profils ==> vecteur nb_trait * nb_digits ->10
profils = getProfils(coordEachDigitsOpt, 10, 20, image, nb_trait);

proba_result = testClassifieur1(profils, nb_trait);
proba_result(:,:,10)

function  [result] = histo_horizontale(I)
result = sum(I < 50, 2);
end
