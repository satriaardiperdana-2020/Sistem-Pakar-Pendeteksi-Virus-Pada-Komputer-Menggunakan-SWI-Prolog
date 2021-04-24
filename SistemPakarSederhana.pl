mulai:-
      init,
      data_pengamatan,
      aturan(Nomor,Alasan),
      jawaban(Alasan,Jawab),
      write(Jawab),nl,
      write('Aturan yang dipakai adalah '),
      write(Nomor),nl,nl,
      retractall(observation(_)).
 mulai:-
      write('Maaf, virus tersebut tidak ada dalam database kami.'),nl,nl,
      retractall(observation(_)).
 init:-
      write('PROGRAM SISTEM PAKAR PENDETEKSI VIRUS'),nl,
      judul(Judul),write(Judul),nl,nl,
      tulis_pesan,nl.
 tulis_pesan:-
      pesan(Pesan),
   write(Pesan),nl,fail.
 tulis_pesan:-
      nl.
 data_pengamatan:-
   pertanyaan(Tanya,Obs),
   write(Tanya),nl,
   read(Yatidak),
   Yatidak=y,
   assert(observation(Obs)),
   fail.
 data_pengamatan.
 judul('MENGANALISA KOMPUTER...').
 pesan('Jawab pertanyaan berikut dengan y atau t').
 pertanyaan('Apakah komputer terasa lambat?', komputer).
 pertanyaan('Apakah ada program yang tidak bisa jalan?', program).
 pertanyaan('Apakah Internet terasa lambat?', internet).
 pertanyaan('Apakah muncul file-file aneh?', file).
 pertanyaan('Apakah muncul pesan gambar atau teks yang aneh?', pesan).
 aturan(1, win32_ramnit):-
      observation(komputer),
      observation(program),
      not(observation(internet)),
      observation(file),
      not(observation(pesan)).
 aturan(2, win32_sality):-
      not(observation(komputer)),
      observation(program),
      observation(internet),
      observation(file),
      not(observation(pesan)).
 aturan(3, win32_virut):-
      observation(komputer),
      observation(program),
      observation(internet),
      not(observation(file)),
      not(observation(pesan)).
 aturan(4, conficker):-
      not(observation(komputer)),
      observation(program),
      observation(internet),
      not(observation(file)),
      not(observation(pesan)).
 aturan(5, xfly):-
      not(observation(komputer)),
      observation(program),
      not(observation(internet)),
      observation(file),
      observation(pesan).
 aturan(6, reva_vbs):-
      not(observation(komputer)),
      not(observation(program)),
      not(observation(internet)),
      observation(file),
      not(observation(pesan)).
 jawaban(win32_ramnit, 'Komputer Anda terinfeksi Win32/Ramnit').
