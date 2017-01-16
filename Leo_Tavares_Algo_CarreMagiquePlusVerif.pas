program Algo_CarreMagiquePlusVerif;

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
	var i, j : integer;
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
	var i, j, position : integer;
begin
	i := (tailleMatrice div 2);
	j := (tailleMatrice div 2) + 1;
	//write(i, ' ', j, ' ');
	Tableau[i, j] := 1;
end;

// Place les uns après les autres les nombre de 2 au carre de la taille de la matrice
Procedure Placement(var Tableau : Matrice);
	var i, j, compteur : integer;
begin
	i := (tailleMatrice div 2);
	j := (tailleMatrice div 2) + 1;
	for compteur := 2 to (tailleMatrice * tailleMatrice) do
	begin
		if (j + 1 > tailleMatrice) then
			begin
				j := 0;
			end;
		if (i - 1 = 0) then
			begin
				i := tailleMatrice + 1;
			end;
			i := i - 1;
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
							i := i - 1;
							j := j - 1;
						end;
				end;
		Tableau[i,j] := compteur;
	end;
end;


// fonctions permettant de faire des verifications, HS
function VerifHorizontale (VerifTab : Matrice; k : integer):integer;
var i, j, verif : integer;
begin
	verif := 0;
	for j := 1 to tailleMatrice do
		begin
			verif := verif + VerifTab[k, j];
			if (j = tailleMatrice) then
				write(VerifTab[k, j], ' = ')
			else
				write(VerifTab[k, j], ' + ');
		end;
		VerifHorizontale := verif;
end;

function VerifVerticale (VerifTab : Matrice; k : integer):integer;
var i, j, verif : integer;
begin
	verif := 0;
	for i := 1 to tailleMatrice do
		begin
			verif := verif + VerifTab[i, k];
			if (i = tailleMatrice) then
				write(VerifTab[i, k], ' = ')
			else
				write(VerifTab[i, k], ' + ');	
		end;
		VerifVerticale := verif;
end;

function VerifDiago (VerifTab : Matrice):integer;
var i, j, verif : integer;
begin
	verif := 0;
	for i := 1 to tailleMatrice do
		begin
			verif := verif + VerifTab[i, i];
			if (i = tailleMatrice) then
				write(VerifTab[i, i], ' = ')
			else
				write(VerifTab[i, i], ' + ');
		end;
		VerifDiago := verif;
end;

function VerifDiago2 (VerifTab : Matrice):integer;
var i, j, verif : integer;
begin
	verif := 0;
	for i := tailleMatrice downto 1 do
		begin
			verif := verif + VerifTab[i, i];
			if (i = 1) then
				write(VerifTab[i, i], ' = ')
			else
				write(VerifTab[i, i], ' + ');
		end;
		VerifDiago2 := verif;
end;


{ Partie main du programme }

var
	i, j, verif : integer;
	CarreMagique : Matrice;
	inputVerif : string;

begin
	clrscr;
	Version;
	writeln('Programme d''affichage d''un carre magique !');
	writeln;
	// debut du programme
	InitMatrice(CarreMagique); // utilise la procedure d'initiation de la matrice
	PremierEntier(CarreMagique); // utilise la procedure pour placer le premier entier
	Placement(CarreMagique); // utilise la procedure pour placer les nombres de 2 à tailleMatrice au carre
	for i := 1 to tailleMatrice do // boucle pour afficher les nombres de la Matrice (le carre Magique)
		begin
			for j := 1 to tailleMatrice do
				begin
					if (CarreMagique[i, j] < 10) then // pour que le tableau soit correctement aligne, on ajoute un
						write('0', CarreMagique[i, j], ' ') // 0 devant les chiffres
					else
						write(CarreMagique[i,j], ' ');
				
				end;
			writeln;
		end;


	// verification :
	writeln;
	writeln;

	repeat
		begin
			write('Voulez-vous effectuer les calculs de verifications ? OUI ou NON : ');
			readln(inputVerif);
			inputVerif := UpCase(inputVerif);
		end;
	until ((inputVerif = 'OUI') or (inputVerif ='NON'));

	if (inputVerif = 'OUI') then
		begin
			writeln('Verifications : ');
			writeln;

			for verif := 1 to tailleMatrice do
				writeln('Le total de la ligne ', verif ,' vaut : ', VerifHorizontale(CarreMagique, verif));

			writeln;
			for verif := 1 to tailleMatrice do
				begin
					writeln('Le total de la colonne ', verif ,' vaut : ', VerifVerticale(CarreMagique, verif));
				end;

			writeln;

			writeln('Le total de la diagonale gauche vers droite vaut : ', VerifDiago(CarreMagique));

			writeln('Le total de la diagonale droite vers gauche vaut : ', VerifDiago2(CarreMagique));
		end
	else
		writeln('Vous quittez le programme ?');

	readln;
end.
