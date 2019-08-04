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
qtd_palavras=20;

cd '../books';


# sed 's/ /\n/g' 'The_prince.txt' | sort -u > sort_chave
# 	tr -s [:space:][:punct:][:digit:] '\n' < 'The_prince.txt' | tr [:upper:] [:lower:] | sort | uniq -c | join -2 2 sort_chave - > wt.txt
# 	cd '../src';
# 	awk '{ if ($2 > "'$qtd_palavras'") print $1}' wt.txt | sort -nrk 2 -t ' ' | ../src/./removeStopWords.sh | head -100 >> words_test.txt

for book in `ls`
do
	# echo $book;
	sed 's/ /\n/g' $book | tr -s [:punct:] ' '| sort -u | sed '/^$/d' | sed 's/,//g' | sed 's/\"//g' | sed 's/”//g' | sed 's/ //g' | sed 's/“//g' | sed 's/‘//g' | sed 's/’//g' | sed 's/«//g' | sed 's/»//g' > wsort_chave
	tr -s [:space:][:punct:][:digit:] '\n' < $book | sed '/^$/d' | tr [:upper:] [:lower:] | sort | uniq -c | join -2 2 wsort_chave - | sed '/^$/d' > wt.txt
	# # cd '../src';
	awk '{ if ($2 > "'$qtd_palavras'") print $1, $2}' wt.txt | sort -nrk 2,2 -t ' ' | ../src/./removeStopWords.sh | head -10 | cut -d ' ' -f 1 >> words_test.txt
done

# sort -k 1 -t':' -g -r
# sort -k1n -k3rn

# while read linha
# do
# 	# echo $linha
# 	cd '../books';

# 	for book in `ls`
# 	do
# 	echo $book;

# 		make
# 		if [ ! -e text8 ]; then
# 			wget http://mattmahoney.net/dc/text8.zip -O text8.gz
# 			gzip -d text8.gz -f
# 		fi
# 		time ./word2vec -train $book -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
# 		./distance vectors.bin 'boys'

# 		cd output;
# 		mkdir $book;
# 		cd $book;
# 		cat '../../aux' > $linha'.txt';
		
# 	done

# done < words_test.txt

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


