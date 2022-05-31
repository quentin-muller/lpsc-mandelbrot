# Projet Mandelbrot

la formule de mandelbrot est 
$$
Z_{n+1}=Z^2_n+C
$$
le c est imaginaire. c'est la position de pixel dans le plan complexe

on arrête quand le module de |z| =2 le n d'arrêt itération défini la couleur

Si le nombre d'itération max est atteins alors on lui donne la valeur 0 donc noir

les zones noir ont un long temps de calcul et les zones bleus sont plus courtes

nombre max itération 127 **On peut le changer pour avoir un truc plus beau** 

size à 18 bits mieux

virgule fixe avec comma à 12bits

