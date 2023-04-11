---
title: "[API 실습]AWS RDS 서비스, HikariCP"
date: 2023-04-10T21:23:00+09:00
# weight: 1
# aliases: ["/first"]
categories: ["TIL"]
tags: ["SpringBoot", "API", "java", "AWS", "HikariCP", "Connection Pool"]
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
# AWS RDS 서비스 생성
1. AWS 계정 생성
2. RDS 서비스 생성
3. DBeaver에 AWS 데이터베이스 연결
4. DB와 SpringBoot 프로젝트 연동

## HikariCP
### 정의
 - HikariCP는 가벼운 용량과 빠른 속도를 가지는 JDBC의 Connection Pool framework이다. SpringBoot는 Connection Pool 관리를 위해 HikariCP를 사용한다.
 - 이 framework가 다른 connection pooling보다 빠른 이유는 몇몇 bytecode 레벨의 구현이 있으며, 마이크로 최적화, ArrayList\<Statement\> 사용 대신 FasgList 직접 구현으로 처음부터 끝까지 모든 것을 스캔하는 과정 생략 등이 있다.
### Connection Pool
![Connection Pool 동작 원리](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F09FqZ%2FbtrAaPi5CKO%2FKU7KXUB2PzluFD1sSSkFNK%2Fimg.webp)
 - 만약 Thread가 커넥션을 요청했을 때 유휴 커넥션이 없다면 다음과 같이 동작한다.
![Connection Pool 동작 원리2](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdnpjgL%2Fbtrz9PDJOb6%2FQdfQNe7n8AiWjWb4cNVcFk%2Fimg.webp)
     1. 유휴 커넥션이 존재하지 않는다면, HandOffQueue에서 Polling(하나의 장치 또는 프로그램이 충돌 회피 또는 동기화 처리 등을 목적으로 다른 장치 또는 프로그램의 상태를 주기적으로 검사하여 일정한 조건을 만족할 때 송수신등의 자료처리를 하는 방식)하면서 다른 Thread가 커넥션을 반납하기를 기다린다.
     2. 다른 Thread가 Connection Pool에 커넥션을 반납하면 Connection Pool은 HandOffQueue에 반납된 커넥션을 삽입하고 HandOffQueue를 Polling하던 Thread는 커넥션을 획득하게 된다.
        - 만약 Connection Pool의 크기가 너무 작다면, 커넥션을 획득하기 위해 대기하고 있는 Thread가 많아지게 될 것이다. 이러한 문제는 Connection Pool의 크기를 늘려주면 해결 할 수 있다. 
        - MySQL의 공식레퍼런스에서는 600여 명의 유저를 대응하는데에 15~20개의 Connection Pool만으로도 충분하다고 언급하고 있다.
        - 우아한 형제들 테크 블로그에서는 다음과 같은 공식을 추천하고 있다.
            - *pool size = Tn(전체 Thread의 갯수) x (Cm(하나의 Task에서 동시에 필요한 Connection 수) - 1) + 1*
### JDBC
 - JDBC는 자바에서 DB에 접속할 수 있도록 하는 자바 API이다. JDBC는 DB에서 자료를 쿼리하거나 업데이트하는 방법을 제공한다.