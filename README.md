# 1. 소개

안녕하세요 체인지 프로 FMP 프로젝트 소개를 맡게 된 정보개발부 은승원 선임입니다.

내용 소개에 앞서 제가 부서 내에서 하는 일과, 저와 함께 주제를 구상하고 자료를 준비한 정은지 선임님이 하는 일을 간단하게 소개드리려고 합니다.

우선 저는 정보개발부 루키팜 셀에  소속되어 있으며, 비즈니스 분석 플랫폼 운영, 비즈니스 마트 운영, 신입직원 소프트랜딩 보조 등의 업무를 맡고 있습니다.

정은지 선임님은 BI 셀에 소속되어 있으며, 주요 지표의 직관적인 대시보드 구축 및 싱글 뷰 조회환경을 제공하는 원클릭마케팅플랫폼을 운영하는 업무를 맡고 있습니다.

정은지 선임님과 제가 맡고 있는 두 업무에는 차이가 있지만, 모두 SQL과 셸스크립트 역량이 중요한 업무입니다.

따라서 공통 업무 부분인 셸스크립트 부분을 주제로 선정하여 "업무 효율 향상을 위한 셸 프로그래밍 기술 및 응용"이라는 제목으로 소개드리게 되었습니다.

# 2. 셸스크립트란?

셸이란 쉽게 말하면 컴퓨터가 이해할 수 있도록 명령할 수 있는 인터페이스를 말합니다.

셸스크립트는 이러한 명령을 모아 수행하는 일종의 명령어 집합이라고 할 수 있습니다.

커맨드라인 환경을 접해보지 않은 분들께서는 셸을 처음 접하면, 제가 그랬던 것처럼 굉장히 난해하고 어렵다고 생각하실 수도 있을 것 같습니다.

하지만 막상 사용해보니 굉장히 편리하고 좋은 도구라는 것을 알게 되었습니다.

여러분들도 같이 따라할 수 있도록 간단한 예제를 준비해 보았습니다.

같이 코드를 리눅스 또는 Git bash 환경에서 실행하시면 몇가지 예제 파일들이 있습니다.

# 3. 실습

사용하실 때 필수적인 커맨드 몇 가지만 간략하게 소개드리겠습니다.

우선 현재 위치에 어떤 파일들이 있는지 알기 위해서는 `ls` 명령어를 입력하시면 됩니다.

파일을 만들기 위해서는 `touch` 명령어를 입력하면 되며, 디렉토리를 만들기 위해서는 `mkdir` 명령어를 사용하시면 됩니다.

디렉토리간 이동을 위해서는 change directory의 약자인 `cd`를 사용하시면 됩니다.

`cd` 명령어의 경우 `./`과 `../` 그리고 `~/` 를 사용하여 디렉토리를 이동할 수 있습니다.

파일 삭제는 `rm` 명령어로 할 수 있고, 디렉토리 삭제는 `rm -rf` 와 같이 옵션을 부여하여 할 수 있습니다.

이외에도 잠시 뒤 다시 소개드릴 파일을 탐색할 때 유용한 `find` 명령어, 문자열 탐색에 사용되는 `grep` 명령어,

또 파일을 복사하는 `cp` 명령어, 파일명을 변경하거나 파일을 이동할 때 사용하는 `mv` 명령어 등 다양한 명령어가 존재합니다.

| Command | Usage                      |
| ------- | -------------------------- |
| sed     | 파일(문자열) 편집          |
| tar     | 파일 압축 및 해제          |
| find    | 파일 탐색                  |
| grep    | 문자열 탐색                |
| awk     | 데이터 레코드 조작 및 출력 |
| chmod   | 파일 및 폴더 권한 부여     |
| cut     | 문자열 자르기              |
| xvsql   | VERTICA DB 접속            |
| bteq    | TERADATA DB 접속           |
| xsqlldr | ORACLE DB 접속             |

# 4. Batch

당행에서 셸스크립트는 대부분 배치작업을 위해 사용되고 있습니다.

배치란 대용량 데이터 처리 작업을 말하며, 데이터량이 많은 은행에서는 주로 새벽시간을 이용해 데이터를 자동으로 처리하고 있습니다.

다양한 배치 형태가 있지만, 여기서는 DW 배치 형태 위주로 간략하게 설명드리도록 하겠습니다.

대용량 데이터 처리라고 하면 복잡해보이지만, 쉽게 설명하면 컴퓨터에게 데이터 삭제, 데이터 조회, 데이터 삽입 등을

특정 시각(시점)에 DB에 접속하여 자동으로 수행되도록 조작하는 거라고 생각하면 편합니다.

배치의 구조는 일반적으로는 다음과 같습니다.

혹시나 잘못된 데이터가 들어가거나 문제가 생겼을 때 재수행이 용이하도록 특정 조건에 따라 데이터를 삭제하는 부분이 맨 앞에 있으며,

필요한 데이터를 조회하는 부분이 다음에 있습니다.

마지막으로 필요한 데이터를 조회했으면 이를 다른 테이블에 삽입하는 과정을 맨 마지막으로 하여 배치 수행이 완료되는 형태입니다.

현재 당행에서 매일매일 수행되는 작업은 10만개가 넘고 있으며, 그만큼 어마어마한 비중을 차지한다고 할 수 있습니다.

# 5. 셸스크립트의 활용

부서마다 차이가 있을 수 있지만, 셸스크립트를 많이 사용하는 부서의 경우에는 개인에게 할당된 배치작업이 수천개에 달하기도 합니다.

그렇다면 만약 특정 배치파일의 특정 테이블의 구조나 명칭이 변경되었다면 어떻게 할까요?

가장 원론적으로 생각할 수 있는 방법은 모든 배치파일을 열어서 수작업으로 일일이 확인하는 것이라고 할 수 있습니다.

그러나 이 경우에는 수작업으로 확인하는 것이기에 실수가 발생할 가능성이 커지며, 시간이 너무 오래 걸린다는 단점이 있습니다.

이 경우에는 셸스크립트를 활용하여 탐색시간을 획기적으로 단축시킬 수 있습니다.

제가 부서에 와서 시간이 남을 때 업무 효율화를 위해 개발했던 스크립트 하나를 소개드리고자 합니다.

우선 예제파일 중 리눅스 샘플과 맥 샘플을 환경에 맞게 실행하시면 저와 동일한 환경을 얻으실 수 있습니다.

cat은 문자열을 출력하는 명령어이고, grep은 파일을 라인별로 읽으면서 문자열을 탐색하는 명령어입니다.

두 명령어를 `xargs`를 이용해 엮으면, 특정 파일을 출력하되, 특정 문자열을 포함하고 있는 파일만을 출력할 수 있습니다.

따라서, 관리하고 있는 배치프로그램의 종류만 리스트로 가지고 있다면, 해당 리스트에서 특정 키워드를 포함하고 있는 작업을 분리해낼 수 있습니다.

```shell
# my_program_list.txt
./EDU_TEST100/EX1.txt
./EDU_TEST100/EX3.txt
./EDU_TEST100/EX5.txt
./EDU_TEST101/EX1.txt
./EDU_TEST102/EX1.txt
```

```shell
$ cat ./my_program_list.txt
$ grep "7f1" *.txt

$ cat my_program_list.txt | xargs grep -il "7e3"
```

보시는 바와 같이 명령어를 구성할 경우, 모든 파일을 탐색하지 않고 원하는 작업만 탐색하면서 원하는 키워드를 찾을 수 있습니다.

서버 수십만개의 배치파일을 전부 탐색하는 것과 원하는 작업 최대 수천개만 탐색하는 것은 차이가 정말 큽니다.

이처럼 셸스크립트를 효율적으로 구성할 수 있다면, 업무 효율도 크게 향상시킬 수 있다는 것을 말씀드리고 싶습니다.

# 6. 마무리

시간상 더 말씀드리지는 못했지만, 현재 행내 비즈니스 분석 플랫폼에 셸스크립트를 사용하여 제가 직접 제작한 [776819]엑셀 업로드(버티카) 화면이 있습니다.

사용자가 엑셀 파일을 양식에 맞춰서 올리면, 이를 셸스크립트로 파일 변환을 통해 DB가 인식할 수 있도록 바꾸고

변환한 파일을 DB에 대량인서트 하는 방식의 스크립트를 구현하였습니다.

셸스크립트는 이처럼 배치파일 처리 외에도 충분히 행내에서 업무 효율화, 자동화 등에 쓰일 수 있다는 것을 마지막으로 다시 말씀드리고 싶습니다.

이상으로 "업무 효율 향상을 위한 셸 프로그래밍 기술 및 응용"에 관련된 간단한 영상을 마치도록 하겠습니다.

정보개발부 은승원, 정은지 선임이었습니다. 감사합니다
