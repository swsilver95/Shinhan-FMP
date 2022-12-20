# mac 환경에서만 동작하는 코드입니다.
mkdir EDU_TEST100 EDU_TEST101 EDU_TEST102

for idx in {100..102}
do
    for i in {100..110}
    do
        touch ./EDU_TEST${idx}/EX${i}.txt
        
        for j in {1..30}
        do
            echo $RANDOM | md5 | head -c 20 >> ./EDU_TEST${idx}/EX${i}.txt
            echo " " >> ./EDU_TEST${idx}/EX${i}.txt
        done
    done
done

if [ $? -ne 0 ]; then
    echo "ERROR!"
    exit 1
fi

exit 0