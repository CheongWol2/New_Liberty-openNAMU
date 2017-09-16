<html>
    <head>
        <title>{{imp[0]}} - {{imp[1]}}</title>
        <link rel="stylesheet" href="/views/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/views/css/default.css">
        <link rel="stylesheet" href="/views/css/default_mobile.css">
        <link rel="stylesheet" href="/views/css/jquery-ui.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript" src="/views/js/lib/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/views/js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="/views/js/layout.js"></script>
        <link rel="stylesheet" href="/views/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/styles/default.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.7/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
        <link rel="stylesheet" href="/views/css/awesome/font-awesome.min.css">
        <script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script>
        <script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_CHTML"></script>
        <style>{{!imp[4]}}</style>
        <script>{{!imp[5]}}</script>
        <meta name="twitter:creator" content="@{{imp[1]}}">
        <meta name="twitter:title" content="{{imp[0]}}">
        <meta name="twitter:site" content="@{{imp[1]}}">
        <meta name="twitter:card" content="summary">
        <link rel="shortcut icon" href="/views/img/on.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
            function folding(num) {
                var fol = document.getElementById('folding_' + num);
                if(fol.style.display == 'inline-block' || fol.style.display == 'block') {
                    fol.style.display = 'none';
                } else {
                    if(num % 3 == 0) {
                        fol.style.display = 'block';
                    } else {
                        fol.style.display = 'inline-block';
                    }
                }
            }
        </script>
    </head>
    <body class="Liberty">
        <div class="nav-wrapper navbar-fixed-top">
            <nav class="navbar navbar-dark">
                <a class="navbar-brand" href="/">{{imp[1]}}</a>
                <ul class="nav navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/recent_changes"><span class="fa fa-refresh"></span><span class="hide-title">최근 변경</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/recent_discuss"><span class="fa fa-comments"></span><span class="hide-title">최근 토론</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/random"><span class="fa fa-random"></span><span class="hide-title">랜덤</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user">
                            % if(imp[3] == 1):
                                <span class="fa fa-user"></span>
                            % elif(imp[3] == 0):
                                <span class="fa fa-user-times"></span>
                            % else:
                                <span class="fa fa-user-secret"></span>
                            % end
                            <span class="hide-title">사용자</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/other"><span class="fa fa-cogs"></span><span class="hide-title">기타</span></a>
                    </li>
                </ul>
                <form method="post" action="/search" id="searchform" class="form-inline">
                    <div class="input-group">
                        <input type="search" name="search" placeholder="검색" accesskey="f" class="form-control" id="searchInput" autocomplete="off">
                        <span class="input-group-btn">
                            <button formaction="/goto" name="go" value="보기" id="searchGoButton" class="btn btn-secondary"><span class="fa fa-eye"></span></button>
                            <button name="fulltext" value="검색" id="searchSearchButton" class="btn btn-secondary"><span class="fa fa-search"></span></button>
                        </span>
                    </div>
                </form>
            </nav>
        </div>
        <div class="scroll-buttons">
            <a class="scroll-toc" href="#toc"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
            <a class="scroll-button" href="#" id="left"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
            <a class="scroll-bottom" href="#powered" id="right"><i class="fa fa-arrow-down" aria-hidden="true"></i></a>
        </div>
        <div class="content-wrapper">
            <div class="container-fluid liberty-content">
                <div class="liberty-content-header">
                    % if(not menu == 0):
                        <div class="content-tools">
                            <div class="btn-group" role="group" aria-label="content-tools">
                            % i = 1
                                % for sub_d in menu:
                                    % if(i > 4 or i < 0):
                                        % if(i > 4):
                                            <button type="button" class="btn btn-secondary tools-btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                <span class="caret"></span>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                            % i = -100
                                        % end
                                        % if(sub_d[1] == 1):
                                            <a class="dropdown-item" href="/{{sub_d[0]}}" id="open">토론</a>
                                        % elif(sub_d[1] == 0):
                                            <a class="dropdown-item" href="/{{sub_d[0]}}">토론</a>
                                        % else:
                                            <a class="dropdown-item" href="/{{sub_d[0]}}">{{sub_d[1]}}</a>
                                        % end
                                    % else:
                                        % i += 1
                                        % if(sub_d[1] == 1):
                                            <a class="btn btn-secondary tools-btn" href="/{{sub_d[0]}}" id="open">토론</a>
                                        % elif(sub_d[1] == 0):
                                            <a class="btn btn-secondary tools-btn" href="/{{sub_d[0]}}">토론</a>
                                        % else:
                                            <a class="btn btn-secondary tools-btn" href="/{{sub_d[0]}}">{{sub_d[1]}}</a>
                                        % end
                                    % end
                                % else:
                                    % if(i < 0):
                                        </div>
                                    % end
                                % end
                            </div>
                        </div>
                    % end
                    <div class="title">
                        <h1 id="main_title">
                            {{imp[0]}}
                            % if(not imp[6] == 0):
                                <sub>{{imp[6]}}</sub>
                            % end
                        </h1>
                    </div>
                </div>
                <div class="liberty-content-main wiki-article">
                    {{!data}}
                </div>
                <div class="liberty-footer" id="bottom">
                    <p>
                        {{!imp[2]}}
                    </p>
                    <div id="powered">
                        <a href="https://github.com/2DU/openNAMU"><img src="/views/img/on2.png" width="100px"></a> <a href="/views/license.html">리버티 스킨</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>