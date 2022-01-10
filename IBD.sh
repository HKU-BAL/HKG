n=0
for i in `shuf -i 1-10000 -n 15`
do
    n=$(($n+1))
    echo "Round:"$n" "$i
    java -jar beagle.27Jan18.7e1.jar  gt=output.vcf.gz out=output_round$n ibd=true seed=$i ibdcm=3
done