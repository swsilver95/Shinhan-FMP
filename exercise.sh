# 내 담당 작업 출력
cat ./my_program_list.txt

# 현재 디렉토리에서 "for" 라는 단어가 들어간 작업 출력
grep "for" ./*.*

# 내 담당 작업 중 "7f" 이라는 단어가 들어간 작업만 출력
cat ./my_program_list.txt | xargs grep "7f"