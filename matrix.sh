# make
# if [ ! -e text8 ]; then
#   wget http://mattmahoney.net/dc/text8.zip -O text8.gz
#   gzip -d text8.gz -f
# fi
# time ./word2vec -train text8 -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
# ./distance vectors.bin


# 
#  Selecao de palavras 
# 
# qtd_palavras=20;

# cd '../books';


# sed 's/ /\n/g' 'The_prince.txt' | sort -u > sort_chave
# 	tr -s [:space:][:punct:][:digit:] '\n' < 'The_prince.txt' | tr [:upper:] [:lower:] | sort | uniq -c | join -2 2 sort_chave - > wt.txt
# 	cd '../src';
# 	awk '{ if ($2 > "'$qtd_palavras'") print $1}' wt.txt | sort -nrk 2 -t ' ' | ../src/./removeStopWords.sh | head -100 >> words_test.txt

# for book in `ls`
# do
# 	# echo $book;
# 	sed 's/ /\n/g' $book | sort -u | sed '/^$/d' > sort_chave$book
# 	tr -s [:space:][:punct:][:digit:] '\n' < $book | tr [:upper:] [:lower:] | sort | uniq -c | join -2 2 sort_chave$book - | sed '/^$/d' > wt.txt
# 	# cd '../src';
# 	awk '{ if ($2 > "'$qtd_palavras'") print $1, $2}' wt.txt | sort -nrk 2,2 -t ' ' | ../src/./removeStopWords.sh | head -50 | cut -d ' ' -f 1 >> words_test.txt
# done


# sort -k 1 -t':' -g -r
# sort -k1n -k3rn

		# echo $linha
		cd '../books';

		for book in `ls`
		do
		# echo $book;

			cd '../src';
			make
			if [ ! -e text8 ]; then
				wget http://mattmahoney.net/dc/text8.zip -O text8.gz
				gzip -d text8.gz -f
			fi
			time ./word2vec -train 'books/'$book -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
			
			while read linha
			do
				while read palavra2
				do		
					
					./distance vectors.bin $linha $palavra2  >> aux

					# cd output;
					# mkdir $book;
					# cd $book;
					# cat '../../aux' > $linha'.txt';
			
				done < words_test.txt
			done < words_test.txt

			cat aux > 'output/'$book'.txt'
			cat ept >> aux
		done


# ./distance vectors.bin 'boys'


# make
# if [ ! -e text8 ]; then
#   wget http://mattmahoney.net/dc/text8.zip -O text8.gz
#   gzip -d text8.gz -f
# fi
# time ./word2vec -train '../books/A Christmas Carol.txt' -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
# ./distance vectors.bin > aux
# cd output;
# mkdir 'A Christmas Carol.txt';
# cd 'A Christmas Carol.txt';
# cat '../../aux' > 'boys.txt';


# cd books;

# for book in `ls`
# do
# echo $book;

# 	make
# 	if [ ! -e text8 ]; then
# 		wget http://mattmahoney.net/dc/text8.zip -O text8.gz
# 		gzip -d text8.gz -f
# 	fi
# 	time ./word2vec -train $book -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
# 	./distance vectors.bin

# done


