#!/bin/bash

if [[ $# -le 1 || $1 -le 1 ]]; then
	echo "Uso: $0 <n> <prog> [args...]"
	echo "Repete <n> vezes a execução de <prog>, parando se"
  echo "os resultados de 2 execuções consecutivas forem diferentes."
  echo "Obs.:"
  echo "   <n> deve ser maior que 1"
  echo "   <prog> pode ter argumentos"
  exit 1
fi

n=$1
prog=`echo $@ | cut -d ' ' -f 2-`
dif=0

# executa o programa uma vez
$prog > tmp1

i=2
while [ $i -le $n ]; do
  $prog > tmp2
  if ! `cmp -s tmp1 tmp2` ; then
  	# arquivos sao diferentes
  	echo "===> "$i"a. execução:"
    cat tmp1
    echo "===> "$[$i-1]"a. execução:"
    cat tmp2
    dif=1
    break
  fi
  mv -f tmp2 tmp1
  i=$[$i+1]
done
if [ $dif == 0 ]; then
   echo "Resultados idênticos em todas as "$n" execuções."
fi
rm -f tmp1 tmp2


