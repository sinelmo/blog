---
title: "hugo를 활용한 GitBlog - PaperMod 테마 활용하기"
date: 2020-09-15T11:30:03+00:00
# weight: 1
# aliases: ["/first"]
tags: ["hugo", "GitBlog", "PaperMod", "github"]
author: "Me"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
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
    image: "<image path/url>" # image path/url
    alt: "<alt text>" # alt text
    caption: "<text>" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/sinelmo/blog/tree/main/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---
## 기본 지식
.md => markdown extension(확장자) <br/>
### disableFingerprinting이란? 
참고 url :
* https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-faq/
> Failed to find a valid digest in the 'integrity' attribute for resource...

와 같은 에러 문구가 콘솔에 떴을 때, config.toml에
~~~
[params]
    [params.assets]
    disableFingerprinting = true
~~~
이렇게 적용 해 주면 해결이 된다.
그렇다면 disableFingerprinting이란 뭘까?
