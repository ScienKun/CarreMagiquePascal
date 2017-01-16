{
PROGRAMME Algo_CarreMagique
 // G : afficher un carre magique a l'ecran
 // I : une constante pour gerer la taille de la matrice, des procedures d'initialisation, placement et affichage
 // O : l'affichage du carre magique genere par les procedures
CONST
	idProgramme <- 1
	tailleMatrice <- 5

TYPE 
	Matrice <- Tableau[1..MAX, 1..MAX] de ENTIER

PROCEDURE Version
VAR
	v : ENTIER
DEBUT
	ECRIRE "Programme " & idProgramme & "." & v & "."
FIN

PROCEDURE InitMatrice(VAR Tableau : Matrice)
VAR
	i, j : ENTIER
DEBUT
	POUR i de 1 A tailleMatrice FAIRE
		POUR j de 1 A tailleMatrice FAIRE
			Tableau[i, j] <- 0
		FINPOUR
	FINPOUR
FIN

PROCEDURE PremierEntier(VAR Tableau : Matrice)
VAR 
	i, j : ENTIER
DEBUT
	i <- tailleMatrice DIV 2
	j <- (tailleMatrice DIV 2) + 1
	Tableau[i, j] <- 1
FIN

PROCEDURE Placement(VAR Tableau : Matrice)
VAR
	i, j, compteur : ENTIER
DEBUT
	i <- tailleMatrice DIV 2
	j <- (tailleMatrice DIV 2) + 1
	POUR compteur de 2 A (tailleMatrice * tailleMatrice) FAIRE
		SI (j + 1 > tailleMatrice) ALORS
			j <- 0
		FINSI
		SI (i - 1 = 0) ALORS
			i <- tailleMatrice + 1
		FINSI
		i <- i - 1
		j <- j + 1
		SI (Tableau[i, j] <> 0) ALORS
			TANT QUE (Tableau[i, j] <> 0) FAIRE
				SI (j - 1 = 0) ALORS
					J <- tailleMatrice + 1
				FINSI
				SI (i - 1 = 0) ALORS
					i <- tailleMatrice + 1
				FINSI
				i <- i - 1
				j <- j - 1
			FINTANTQUE

			FINSI
		FINSI
		Tableau[i, j] := compteur
	FINPOUR
FIN

 // Corps de l'algorithme
VAR
	i, j : ENTIER
	CarreMagique : Matrice
	
DEBUT
	Version;
	ECRIRE "Algorithme d'affichage d'un carre magique !"
	// DEBUT DES ETAPES DE TRAITEMENT DU CARRE magique
	POUR i de 1 A tailleMatrice FAIRE
		POUR j de 1 A tailleMatrice FAIRE
			SI (CarreMagique[i, j] < 0) ALORS
				ECRIRE "0" & CarreMagique[i, j] & " "
			SINON
				ECRIRE CarreMagique & " "
			FINSI
		FINPOUR
	FINPOUR
FIN
}
program Algo_CarreMagique;

uses crt, sysutils;

const
	idProgramme = 1;
	tailleMatrice = 7;

type
	Matrice = array [1..tailleMatrice,1..tailleMatrice] of integer;

Procedure Version;
	var
		v : integer;
begin
	v := 2;
	writeln('Programme ',idProgramme, '.', v, '.');
end;

// Initialise le tableau en le ramplissant d'un nombre
Procedure InitMatrice(var Tableau : Matrice);
	var i, j : integer; // i et j sont des variables de position dans le tableau
begin
	for i := 1 to tailleMatrice do
		begin
			for j := 1 to tailleMatrice do
				begin
					Tableau[i, j] := 0;
				end;
		end;
end;

// Place le premier entier au milieu du nord de la matrice
Procedure PremierEntier(var Tableau : Matrice);
	var i, j, position : integer; // i et j sont des variables de position dans le tableau
begin
	i := (tailleMatrice div 2);
	j := (tailleMatrice div 2) + 1;
	//write(i, ' ', j, ' ');
	Tableau[i, j] := 1;
end;

// Place les uns après les autres les nombre de 2 au carre de la taille de la matrice
Procedure Placement(var Tableau : Matrice);
	var i, j, compteur : integer; // i et j sont des variables de position dans le tableau, compteur sert à positionner un nombre à une position i et j du tableau
begin
	i := (tailleMatrice div 2);
	j := (tailleMatrice div 2) + 1;
	// les deux lignes ci-dessus servent a replacer la position du "curseur" pour commencer les calculs de placement ci-dessous
	for compteur := 2 to (tailleMatrice * tailleMatrice) do
	begin
		if (j + 1 > tailleMatrice) then // si j est superieur a la taille de la matrice quand on lui ajoute 1, on repasse la valeur de j a 0
			begin
				j := 0;
			end;
		if (i - 1 = 0) then // dans ce cas, si i vaut 0 lors d'une soustraction, on passe i a la taille de la matrice + 1 (6 si la valeur de tailleMatrice est 5)
			begin
				i := tailleMatrice + 1;
			end;
			i := i - 1; // on avance ici au nord est
			j := j + 1;
			if (Tableau[i, j] <> 0) then // si la "case" n'est pas vide
				begin
					while (Tableau[i, j] <> 0) do // on fera les actions suivantes jusqu'à ce que la "case" soit vide
						begin
							if (j - 1 = 0) then		
								begin
									j := tailleMatrice + 1;
								end;
							if (i - 1 = 0 )then
								begin
								i := tailleMatrice + 1;
								end;
							i := i - 1; // on avance ici au nord est
							j := j - 1;
						end;
				end;
		Tableau[i,j] := compteur; // on remplace la valeur initiale du tableau
	end;
end;

// Procedure d'affichage a l'ecran du resultat du carre magiqu
Procedure Affichage(var Tableau : Matrice);
	var i, j : integer;
begin
	for i := 1 to tailleMatrice do // boucle pour afficher les nombres de la Matrice (le carre Magique)
		begin
			for j := 1 to tailleMatrice do
				begin
					if (Tableau[i, j] < 10) then // pour que le tableau soit correctement aligne, on ajoute un 0 devant les chiffres si c'est un chiffre
						write('0', Tableau[i, j], ' ') 
					else
						write(Tableau[i,j], ' ');
				
				end;
			writeln;
		end;
end;

{ Partie main du programme }

var
	CarreMagique : Matrice;

begin
	clrscr;
	Version;
	writeln('Programme d''affichage d''un carre magique !');
	writeln;
	// debut du programme
	InitMatrice(CarreMagique); // utilise la procedure d'initiation de la matrice
	PremierEntier(CarreMagique); // utilise la procedure pour placer le premier entier
	Placement(CarreMagique); // utilise la procedure pour placer les nombres de 2 à tailleMatrice au carre
	Affichage(CarreMagique); // on appelle la procedure d'affichage

	readln;
end.
