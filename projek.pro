DOMAINS
	gejala = symbol
	apa = string
	jawab = char
	penyakit = symbol
	keadaan = cond*
	cond = string
	nama = orang(symbol,symbol) 
	hari_lahir = tanggal_lahir(integer,symbol,integer) 
	telepon = symbol 

FACTS
	search2(gejala)
	failed2(gejala)
	nmklpk3(keadaan)
	false(cond)
	
PREDICATES
	
	nondeterm mulai
	nondeterm start				
	nondeterm beranda			
	nondeterm pilih(char)
	nondeterm gangguan(penyakit)
	nondeterm penyebab(penyakit)						
	nondeterm hasil(char)	
	nondeterm hasil1(char)					
	nondeterm gejala(gejala)
	nondeterm diagnosa(penyakit)
	nondeterm penanganan(penyakit)
	nondeterm pencegahan(penyakit)
	nondeterm mauliat(keadaan)
	del
	clear_fakta2
	simpan(gejala,jawab)
	tanya(apa,gejala,jawab)
	go_once
	search1(apa,gejala)
	failed1(apa,gejala)
	xx(char,char)
	yy(char,char)
CLAUSES
xx(Y,Y):-!.
xx(_,_):-fail.

yy(Y,Y):-!.
yy(_,_):-fail.
	
	
	
nmklpk3(["1. Saroja				1515015185","2. Vera Ramadhaniyah		1515015191","3. Fandy				1515015197"]).
start:-
	write("--------------------------------------------------------------------"),nl,
	write("PROGRAM MENDIANOSA PENYAKIT KANKER LEUKIMIA"), nl,
	write("--------------------------------------------------------------------"),nl,
	write("Nama Anggota Kelompok	: "),nl,	
	nmklpk3(Kelompok),
	mauliat(Kelompok),	
	write("Masukkan Nama Anda ? "),
	readln(Pasien),
	write("Selamat datang, ", Pasien),nl,
	write("UNTUK MEMULAI PROGRAM, TEKAN TOMBOL 'Y'\n"),
	readchar(A), hasil(A).
	hasil(A):-xx(A,'Y'), beranda.
	hasil(A):-xx(A,'y'), beranda.
	hasil(_):-mulai.
	
	mauliat([H|T]):-
	not(false(H)),
	write(H),nl,
	mauliat(T).
	
	mauliat([H|_]):-
	assertz(false(H)).
	
mulai:-
		go_once,nl,nl,nl,nl,nl,
                write("Apakah Ingin mengulang lagi (Y/N) ?\n"),
                readchar(A),hasil1(A).
		hasil1(A):-xx(A,'Y'), mulai.
		hasil1(A):-xx(A,'y'), mulai.
		hasil1(A):-xx(A,'N'), beranda.
		hasil1(A):-xx(A,'n'), beranda.
                hasil1(_):-mulai.
	
	
            go_once:-
                        diagnosa(_),!,
                        save("test.dat"),
                        del.
            go_once:-
                        write("\n\n\MAAF PROGRAM KAMI TIDAK DAPAT MENYELESAIKAN PERMASALAHAN ANDA."),nl,
                        del.
            search1(_,Gejala):-write("\nAPAKAH "),
                        search2(Gejala),!.
            search1(Tanya,Gejala):-
                        not(failed2(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='y'.
            failed1(_,Gejala):-
                        failed2(Gejala),!.
            failed1(Tanya,Gejala):-
                        not(search2(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='n'.
            tanya(Tanya,Gejala,Jawab):-
                        write(Tanya),
                        readchar(Jawab),
                        write(Jawab),nl,
                        simpan(Gejala,Jawab).
            simpan(Gejala,'y'):-
                        asserta(search2(Gejala)).
            simpan(Gejala,'n'):-
                        asserta(failed2(Gejala)).
            clear_fakta2:-
                        retract(search2(_)),fail.
            clear_fakta2:-
                        retract(failed2(_)),fail.
            clear_fakta2.
            del:-
                        retract(search2(_)),fail.
            del:-
                        retract(failed2(_)),fail.
            del.

	
	beranda:-	
	write("*************************************************************************************\n"),
	write("1. Mendiagnosa Kanker Leukimia .\n"),
	write("2. Keluar.\n"),
	write("Piihan : (1-2): \n"),

	readchar(A), pilih(A).

	pilih(A):- xx(A,'1'),mulai.
	
	pilih(A):- xx(A,'2'),exit.
	pilih(_):-beranda.


	

		gejala(Gejala):-    
                        search2(Gejala),!.
            	gejala(Gejala):-
                        failed2(Gejala),!,fail.
                        
	gejala(lla):-
	search1(" ANDA MENGALAMI ANEMIA (y/n)?",lla1),
	search1(" ANDA MENGALAMI KEHILANGAN NAFSU MAKAN(y/n)?",lla2),
	search1(" ANDA MENGALAMI DEMAM(y/n)?",lla3),
	search1(" ANDA MENGALAMI GELISAH(y/n)?",lla4),
	search1(" ANDA MENGALAMI NYERI PADA TULANG DAN SENDI(y/n) ?",lla5),
	search1(" MENGALAMI PEMBESARAN LIMFA(y/n)?",lla6).
				
	gejala(lma):-
	search1(" ANDA MENGALAMI GANGGUAN KESADARAN(y/n)?",lma1),
	search1(" ANDA MENGALAMI GANGGUAN PERNAFASAN(y/n)?",lma2),
	search1(" ANDA MENGALAMI NYERI PADA DADA(y/n)?",lma3),
	search1(" ANDA MENGALAMI PENDARAHAN DIGUSI(y/n)?",lma4).
					
	gejala(llk):-
	search1(" ANDA MENGALAMI INFEKSI KARNA BAKTERI(y/n)?",llk1),
	search1(" ANDA BERKERINGAT PADA MALAM HARI(y/n)?",llk2),
search1(" ANDA MUDAH MEMAR(y/n)?",llk3),
	search1(" ANDA MENGALAMI PENURUNAN BERAT BADAN (y/n)?",llk4).

	gejala(lmk):-
	search1(" ANDA TIDAK MENGALAMI MENSTRUASI LAGI(y/n)?",lmk1),
	search1(" ANDA MEMPUNYAI BENJOLAN DIKULIT(y/n)?",lmk2),
	search1(" ANDA MENGALAMI INFEKSI KULIT AKUT(y/n)?",lmk3),
	search1(" ANDA MENGALAMI LIMFADENOPATI (y/n)?",lmk4),
	search1(" ANDA MENGALAMI PENURUNAN BERAT BADAN(y/n)?",lmk5).
	
	/* ***************************************** DIAGNOSA KANKER LEUKIMIA ***************************************** */

diagnosa("Stadium I Kanker Luekimia"):-
		gejala(lla),
		gejala(lla1),
		gejala(lla2),
		gejala(lla3),
		gejala(lla4),
		gejala(lla5),
		gejala(lla6),
		gangguan("Stadium I Kanker Leukimia\n"),
		penyebab("\n 1. Faktor Keturunan.\n 2. Pengaruh Makanan yang dikonsumsi.\n"),
		penanganan("\n 1. segera konsultasikan kedokter.\n"),		
                pencegahan("\n1.Diet dengan memakan makanan yang bergizi tinggi.\n").
                
diagnosa("Stadium II Kanker Luekimia"):-
		gejala(lma),
		gejala(lma1),
		gejala(lma2),
		gejala(lma3),
		gejala(lma4),
		gangguan("Stadium II Kanker Leukimia\n"),
		penyebab("\n 1. Faktor Keturunan.\n\n 2. Pengaruh Makanan yang dikonsumsi.\n \n 3. Paparan Radiasi.\n \n 4. Bahan Kimia.\n \n 5.Rokok.\n"),
		penanganan("\n Kemoterapi.\n"),		
                pencegahan("\n1.Diet dengan memakan makanan yang bergizi tinggi.\n").
                
diagnosa("Stadium III Kanker Luekimia"):-
		gejala(llk),
		gejala(llk1),
		gejala(llk2),
		gejala(llk3),
		gejala(llk4),
		gangguan("Stadium III Kanker Leukimia\n"),
		penyebab("\n 1. Faktor Keturunan.\n 2.Pengaruh Makanan yang dikonsumsi.\n 3. Paparan Radiasi.\n 4. Bahan Kimia.\n 5.Rokok.\n"),
		penanganan("\Kemoterapi dan minum Obat Herbal.\n"),		
                pencegahan("\n1.Diet dengan memakan makanan yang bergizi tinggi.\n").
diagnosa("Stadium IV Kanker Luekimia"):-
		gejala(lmk),
		gejala(lmk1),
		gejala(lmk2),
		gejala(lmk3),
		gejala(lmk4),
		gejala(lmk5),
		gangguan("Stadium IV Kanker Leukimia\n"),
		penyebab("\n 1. Faktor Keturunan.\n 2.Pengaruh Makanan yang dikonsumsi.\n 3. Paparan Radiasi.\n 4. Bahan Kimia.\n 5.Rokok.\n"),
		penanganan("\n 1. Kemotrapi.\n  2.minum Obat Herbal.\n 3. Radioterapi.\n "),		
                pencegahan("\n1.Diet dengan memakan makanan yang bergizi tinggi.\n").

gangguan(Penyakit):-
	write("\n***********************************************************************************"),
	write("\nAnda Terdiagnosis Kanker Leukimia Stadium : ",Penyakit).

penyebab(Penyakit):-
	write("\nPenyebab : ",Penyakit).
	
penanganan(Penyakit):-
	write("\nPenanganan : ",Penyakit).
	
pencegahan(Penyakit):-
	write("\nPencegahan : ",Penyakit),
	write("\n***********************************************************************************").


GOAL
start,
mulai.
