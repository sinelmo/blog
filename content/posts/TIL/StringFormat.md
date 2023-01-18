---
title: "[java] StringFormat, replace | 프로그래머스 코딩테스트 1단계 [1차] 비밀지도"
date: 2023-01-18T23:37:57+09:00
# weight: 1
# aliases: ["/first"]
categories: ["TIL"]
tags: ["TIL", "ProgrammersCodingTest", "java", "StringFormat"]
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
# [1차] 비밀지도 코딩테스트 답
```java
class Solution {
    public String[] solution(int n, int[] arr1, int[] arr2) {
        String[] answer = new String[n];
        
        for(int i = 0; i < arr1.length; i++) {
            answer[i] = String.format("%0" + n + "d", Long.parseLong(Long.toString(arr1[i] | arr2[i], 2))).replace("1", "#").replace("0", " ");
        }
        
        return answer;
    }
}
```
# TIL
 replace는 저번에 써봤던 함수인데 사용법을 까먹어 다시 찾아보았다.
String.format()은 이번에 처음 알았다.
## String.format
 - public static String format(String format, Object... args)  
 - String.format()은 보통 숫자 1을 0001 처럼 문자열로 자릿수를 맞출 때 많이 쓰이는 것 같다. 나같은 경우도 2진수 자릿수를 맞추기 위해 사용하였다.
사용법은 다음과 같다.  
String format : 포맷 형식  
Object... args : 포맷 할 Object
 - 위 코드에 쓰인 포맷 형식은 "%05d" 를 예로 들면 %d는 숫자 형식, 5는 맞출 자릿수, 0은 자릿수를 맞추기위해 대신 들어갈 숫자 를 뜻한다.

 - 포맷 형식에 관련해서는 https://docs.oracle.com/en/java/javase/18/docs/api/java.base/java/util/Formatter.html 여기에 잘 나와있다.

## replace
 - public String replace(char oldChar, char newChar)
 - str.replace("a" , "b") 를 예로 들면 str에 있는 모든 a를 b로 replace 해준다.