---
title: "hugo를 활용한 GitBlog - PaperMod 테마 활용하기"
date: 2023-01-15 17:47:34.139 +0900
# weight: 1
# aliases: ["/first"]
tags: ["hugo", "GitBlog", "PaperMod", "github"]
categories: ["TIL"]
author: "Elmo"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: true
draft: false
hidemeta: false
comments: false
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
    image: "img/test.jpg" # image path/url
    alt: "this is a post image" # alt text
    caption: "this is a post image" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/sinelmo/blog/tree/main/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---
## 기본 지식
* .md => markdown extension(확장자) <br/>
* markdown 파일에서 '--- ---' 사이에 적힌 코드들을 front matter 라고 불린다.
    * 기본적으로 구조를 설정하고 content의 특정한 부분을 설정해준다.
    * key-value 구조의 collection이다.
* draft
    * draft란 현재 이 문서가 작업중인지(true) 아닌지(false) 나타내는 특성이다. hugo server -D 로 localhost에서 확인 했을때는 빌드 되지만 나중에 빌드할 때 생성되는 html에는 포함되지 않는다.
* themes/layouts/default/markup
    * 기본적으로 제공 해 주는 기능들이 구현 되어 있다. config.toml에서 menu.main에 추가 한 후, content에 .md파일을 생성 해 주면 해당 기능들을 블로그에 구현 할 수 있다.
    * themes와 같은 폴더 구조에 파일이름을 동일하게 해서 복사 해 놓고 수정하면 override하여 사용 할 수 있다.
* date를 입력 할 때, 2023-01-25 13:00:00 이런식으로 입력하면 된다.
* css나 기본 제공 파일을 수정하고 싶다면, 같은 구조로 파일을 생성 한 후 변경하는 것이 좋다.
## 삽질 기록
### disableFingerprinting이란? 
깃허브 블로그를 처음 개설하고 나서 hugo server명령어로 로컬에서 확인했을때는 제대로 나오는데 깃허브로 commit 후 실제 사이트로 들어가보면 화면이 이상하게 나오고 있고,
> Failed to find a valid digest in the 'integrity' attribute for resource...

와 같은 에러 문구가 콘솔에 떠있었다. 도대체 저게 뭔지 검색해도 잘 안나오고 2주간 삽질 한 결과 PaperMod FAQ에 해결책이 나와있었다고 한다...

 해결 방법은 config.toml에
~~~
[params]
    [params.assets]
    disableFingerprinting = true
~~~
이렇게 적용 해 주면 해결이 된다.
그렇다면 Fingerprinting이란 뭘까?
- 웹사이트에 접속한 브라우저를 95% uniquely하게 식별하는 기술이다.
    - 1. html5 canvas로 렌더링 되는 이미지는 GPU나 드라이버의 영향으로 pc 마다 달라서 고유 이미지가 된다. 
    - 2. 이 canvas 이미지를 base64으로 인코딩하여 서버로 전달한다.
    - 3. 이 이미지를 해싱 후 서버에 저장하여 관리한다.

fingerprinting값은 각 .html 파일마다 'integrity="sha256-' 부분에 설정 되어 있는데, 아마 테마를 적용하는 과정에서 해시값이 해당 pc의 고유 fingerprint가 아닌 이상한 값이 들어가고, 그래서 Fingerprinting이 적용 안되도록 설정 해주는 것 같다. 보안을 위해 fingerprinting을 굳이 적용하고 싶다고 한다면, public에 있는 각 .html 파일마다 sha256- 다음에 오는 해시값을 구글 콘솔창에서 띄워주는 해시값으로 변경해주면 된다. 하지만 그냥 disableFingerprinting을 적용하는 것을 추천한다.

<참고 url>
* https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-faq/