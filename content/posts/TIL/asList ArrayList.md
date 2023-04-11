---
title: "[java] Arrays.asList, ArrayList, AWS RDS 서비스"
date: 2023-04-05T23:00:00+09:00
# weight: 1
# aliases: ["/first"]
categories: ["TIL"]
tags: ["TIL", "ProgrammersCodingTest", "java", "AWS", "ArrayList", "asList"]
author: "Elmo"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
description: "Desc Text."
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/sinelmo/blog/tree/main/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---
# TIL
## Arrays.asList
### 정의
|Modifier and Type|Method|Description|
|:---|:---|:---|
|static \<T\> List\<t\>|asList(T . . .  a)|Returns a fixed-size list backed by the specified array.  |


 특정한 배열을 받아 고정된 크기의 리스트를 반환한다.  

# AWS RDS 서비스 생성
1. AWS 계정 생성
2. RDS 서비스 생성
3. DBeaver에 AWS 데이터베이스 연결
4. DB와 SpringBoot 프로젝트 연동

### MariaDB
* mariaDB 기본포트 : 3306
* mySQL은 1990년대 출시, 여기저기서 많이 쓰이는 만큼 성능이 꾸준히 개선되었고, 신뢰성이 높음. 다중사용자와 다중스레드를 지원. 하지만 상업적으로 사용할때는 상업용 라이센스를 구입해야함. 
 오라클에 인수됨.
* MariaDB는 MySQL창시자가 MySQL 데이터베이스 시스템을 fork(하나의 소프트웨어 소스코드를 통째로 복사하여 독립적인 새로운 소프트웨어를 개발하는 것)한 서비스로 MySQL과의 호환성이 매우 높으며, MySQL에서는 찾을 수 없는 수많은 강력한 기능이 내장되엉ㅆ기ㅗ 보안 및 능 개선사항이 제공됨. 오픈소스.

## Gradle
 - 빌드 도구. build.gradle 에 스크립트를 작성. 최근에는 Kotlin 문법으로 작성되기도 하지만, 웹 프로젝트에서는 여전히 Groovy 문법으로 작성 되는 경우가 많다.
### Gradle Wrapper
 - Gradle을 각 개발자나 CI서버에 깔지 않고, 프로젝트에 함께 포함시켜 배포할 수 있는 방법을 제공해준다.
 - Gradle Wrapper가 없으면 대규모 프로젝트에서 초기 환경 설정 시 많은 시간을 허비하게 된다.
 - 특정 버전의 Java나 Gradle을 설치 할 필요 없이 바로 프로젝트를 실행 할 수 있기 때문에 번거로운 작업을 줄일 수 있다.
 - 참고 url : https://junilhwang.github.io/TIL/Gradle/GradleWrapper/
### Gradle의 장점
 1. 간결한 스크립트
    - 이전의 빌드 도구들은 열고 닫는 태그가 필수인 xml 문법으로 작성했지만 Gradle은 Groovy 문법으로 간결한 스크립트
 2. 빌드 속도
    - Gradle은 캐싱을 하기 때문에 이전 빌드 도구보다 빌드 속도가 빠름. 최대 100배까지 벌어질 수 있다고 한다.
### 빌드(Biuld)
 - 소스코드 파일을 컴퓨터나 휴대폰에서 실행할 수 있는 독립 소프트웨어 가공물로 변환하는 과정을 말하거나 그에 대한 결과물을 일컫는다.
### 빌드 도구(Build Tool)
 - 소프트웨어 개발에 있어서 소스 코드를 실행 가능한 어플리케이션으로 만들어주는 도구. 빌드 과정을 자동화하여 관리하는 기능을 하기 때문에 빌드 관리 도구(Build Management Tool) 또는 빌드 자동화 도구(Build Automation Tool)라고 불리기도 한다.
 - 빌드 도구의 특징
     - 개발자가 script를 작성하여 다양한 작업을 수행 할 수 있게 한다.
     - 소스 코드 컴파일 또는 패키징, 테스트 자동 수행, 의존성 주입 및 배포 작업
     - 빌드 도구 종류에 따라 사용하는 문법이 다른다. 일반적으로 xml이나 특정 도메인 언어(ex. Groovy)를 사용한다.
 - 빌드 도구 종류와 차이점
     - Ant
        - **이클립스 IDE에 기본적으로 탑재**, XML 스크립트 기반
        - 자동으로 라이브러리를 업데이트 하는 기능이 없음. 레거시 시스템에서만 사용
     - Maven
        - Ant 이후에 나온 자바 빌드 도구
        - 자동으로 라이브러리와 의존성(dependency)을 관리하는 기능
        - XML 스크립트 기반, **pom.xml** 파일로 의존성 관리
        - Life Cicle 개념 도입
     - Gradle
        - 가장 최근에 나온 자바 빌드 도구. 'Groovy' 문법을 사용.
        - **build.gradle**에 스크립트를 작성
        - XML 기반 스크립트에 비해 관리가 편하다는 장점이 있다.
        - SpringBoot, Android에서 주로 사용.

### Groovy
 - Groovy는 Apache 재단에서 개발된 **동적 객체 지향** 프로그래밍 언어  
 Java에 Python + Ruby + SmallTalk 등 다양한 객체지향 프로그래밍 언어의 특징을 더함.
 - JVM 위에서 작동하며, 자바 및 python 등의 영향을 받아 자바 프로그래머들이 익숙하게 사용 할 수 있다.
 - Groovy Shell도 지원하며 간단한 코드를 테스트 할 수 있는 환경도 제공
 - Java와 호환이 되며, Java 클래스 파일을 그대로 Groovy 클래스로 사용 할 수 있다.
### JVM
#### JVM 뜻
 - Java Virtual Machine (자바 가상 머신 - 자바를 실행하기 위한 가상 기계)
#### JVM의 역할
 - Java는 OS에 종속적이지 않다는 특징을 가지고 있다. OS에 종속받지 않고 실행되기 위해선 OS 위에서 Java를 실행시킬 무언가가 필요하다. 그것이 바로 JVM이다. 즉, **OS에 종속받지 않고 CPU가 Java를 인식, 실행할 수 있게 하는 가상 컴퓨터**이다.
 - Java소스코드, 즉 원시코드(\*.java)는 CPU가 인식을 하지 못하므로 기계어로 컴파일을 해줘야한다. 자바에선 Java compiler가 자바 프로그램 코드를 bytecode로 변환 한 다음, 실제 bytecode를 실행하는 시점에서 JVM이 bytecode를 JIT 컴파일러를 통해 기계어로 변환한다.
#### JVM 컴파일 과정
![JVM 컴파일](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F0kg24%2Fbtq4YOOQH4J%2FEF2ISOpkYA36a1flwtLEmK%2Fimg.png)
1. 먼저, Java compiler가 원시코드(\*.java)를 JVM이 인식할 수 있는 Java bytecode(\*.class)로 변환한다.  
    - Java compiler : JDK를 설치하면 bin에 존재하는 javac.exe를 말한다. javac 명령어를 통해 .java를 .class로 컴파일 할 수 있다.
    - 컴파일 : 어떤 언어의 코드 전체를 다른 언어로 바꿔주는 과정이다. 그리고 이것을 자동으로 수행해주는 소프트웨어를 컴파일러라고 한다.
2. 변환된 bytecode는 기계어가 아니기 때문에 OS에서 바로 실행되지 않는다. 이 때, JVM이 OS가 bytecode를 이해할 수 있도록 해석해준다. 따라서 bytecode는 JVM위에서 OS 상관없이 실행될 수 있는 것이다.  
*OS에 종속적이지 않고, Java 파일 하나만 만들면 어느 디바이스든 JVM 위에서 실행 할 수 있다.*
    - JIT 컴파일러(just-in-time compilation 또는 동적 번역(dynamic translation) 이라고 한다.)는  프로그램을 *실제 실행하는 시점에* 기계어로 번역하는 컴파일러이다.
        - 인터프리터 방식(코드를 한줄씩 읽어나가며 실행하는 방식)을 보완하기 위해 도입. 인터프리터 방식으로 실행하다가 적절한 시점에 바이트 코드 전체를 컴파일하여 기계어로 변경하고, 이후에는 더이상 인터프리팅 하지 않고 기계어로 직접 실행하는 방식이다.
        - 기계어로 컴파일된 코드는 캐시에 보관히기 때문에 한 번 컴파일 된 코드는 수행 속도가 빠르나, 기계어 컴파일은 인터프리터 방식보다 속도가 느리기 때문에 한 번만 실행되는 코드라면 인터프리팅 하는것이 유리하다. 따라서 JIT 컴파일러를 사용하는 JVM들은 내부적으로 해당 메서드가 얼마나 자주 수행되는지 체크하고 일정 정도를 넘을때에만 컴파일을 수행한다.

