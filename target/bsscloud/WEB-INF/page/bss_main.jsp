<%--
  Created by IntelliJ IDEA.
  User: yujianfei
  Date: 2017/8/25
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
         import="com.bss.entity.User" %>
<%@ include file="/common/taglibs.jsp" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    User user = (User) session.getAttribute("userInfo");
%>
<!doctype html>
<html>
<head>
    <style type="text/css">
        .menu_background {
            background: #39444d;
        }

        ul.mtree.bubba li.mtree-node > a > i {
            width: 34px;
            float: left;
            line-height: 18px;
            font-size: 16px;
            text-align: left;
        }

        ul.mtree.bubba li > a > i {
            width: 34px;
            float: left;
            line-height: 18px;
            font-size: 16px;
            text-align: left;
        }
    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width = device-width, initial-scale=1">
    <title><%=rb.getString("JiFeiGuanLiXiTong")%></title>
    <link rel="stylesheet" href="${ctx}/css/font-awesome/css/font-awesome.min.css?_=${bss_ver}"/>
    <%--<link rel="stylesheet" href="${ctx}/css/jquery-accordion-menu.css?_=${bss_ver}"/>
    <script type="text/javascript" src="${ctx}/js/jquery-accordion-menu.js?_=${bss_ver}"></script>--%>
    <link rel="shortcut icon" href="${ctx}/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css?_=${bss_ver}"/>
    <link rel="stylesheet" href="${ctx}/css/bootstrap-datetimepicker.min.css?_=${bss_ver}"/>
    <link rel="stylesheet" href="${ctx}/skin/main.css?_=${bss_ver}"/>
    <link rel="stylesheet" href="${ctx}/css/mtree.css?_=${bss_ver}"/>
    <link rel="stylesheet" href="${ctx}/skin/skin.css?_=${bss_ver}"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js?_=${bss_ver}"></script>
    <%--<script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/jquery.dataTables.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/dataTables.bootstrap.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap-datetimepicker.min.js?_=${bss_ver}"></script>--%>
    <script type="text/javascript" src="${ctx}/js/jquery.velocity.min.js?_=${bss_ver}"></script>

    <script type="text/javascript">
        //URL请求
        var ctx = '${ctx}';

        $(function () {
            var tree_url = "${ctx}/bss/login/getMenuTree.do?top_id=0";
            $.post(tree_url, {}, function (data) {
                // 最上层的父级菜单
                var parent = addChildren(null, data);
                parent.addClass("mtree");
                parent.addClass("bubba");
                $("#body_div").append(parent);

                // Only apply if mtree list exists
                if ($('ul.mtree').length) {
                    // Settings
                    var collapsed = true; // Start with collapsed menu (only level 1 items visible)
                    var close_same_level = true; // Close elements on same level when opening new node.
                    var duration = 400; // Animation duration should be tweaked according to easing.
                    var listAnim = true; // Animate separate list items on open/close element (velocity.js only).
                    var easing = 'easeOutQuart'; // Velocity.js only, defaults to 'swing' with jquery animation.


                    // Set initial styles
                    $('.mtree ul').css({
                        'overflow': 'hidden',
                        'height': (collapsed) ? 0 : 'auto',
                        'display': (collapsed) ? 'none' : 'block'
                    });
                    //将(基站)station所对应的li标签添加“mtree-open”类，将（监控）monitor所对应的li标签添加“mtree-active”类，将（基站）所属的2级菜单全部展开
                    //$('a[menu_id=100]').siblings().css({'overflow': 'hidden', 'height': 'auto', 'display': 'block'});
                    //$('a[menu_id=100]').parent().addClass('mtree-open');
                    //$('a[menu_id=100]').parent().addClass('mtree-active');

                    // Get node elements, and add classes for styling
                    var node = $('.mtree li:has(ul)');
                    node.each(function (index, val) {
                        $(this).children(':first-child').css('cursor', 'pointer');
                        $(this).addClass('mtree-node mtree-' + ((collapsed) ? 'closed' : 'open'));
                        $(this).children('ul').addClass('mtree-level-' + ($(this).parentsUntil($('ul.mtree'), 'ul').length + 1));
                    });

                    // Set mtree-active class on list items for last opened element
                    $('.mtree li > *:first-child').on('click.mtree-active', function (e) {
                        if ($(this).parent().hasClass('mtree-closed')) {
                            $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
                            $(this).parent().addClass('mtree-active');
                        } else if ($(this).parent().hasClass('mtree-open')) {
                            $(this).parent().removeClass('mtree-active');
                        } else {
                            if (!$(this).parent().hasClass('mtree-active')) {
                                $('.mtree-active').not($(this).parent()).removeClass('mtree-active');
                                $(this).parent().toggleClass('mtree-active');
                            }
                        }
                    });

                    // Set node click elements, preferably <a> but node links can be <span> also
                    node.children(':first-child').on('click.mtree', function (e) {

                        // element vars
                        var el = $(this).parent().children('ul').first();
                        var isOpen = $(this).parent().hasClass('mtree-open');

                        // close other elements on same level if opening
                        if ((close_same_level || $('.csl').hasClass('active')) && !isOpen) {
                            var close_items = $(this).closest('ul').children('.mtree-open').not($(this).parent()).children('ul');

                            // Velocity.js
                            if ($.Velocity) {
                                close_items.velocity({
                                    height: 0
                                }, {
                                    duration: duration,
                                    easing: easing,
                                    display: 'none',
                                    delay: 100,
                                    complete: function () {
                                        setNodeClass($(this).parent(), true)
                                    }
                                });

                                // jQuery fallback
                            } else {
                                close_items.delay(100).slideToggle(duration, function () {
                                    setNodeClass($(this).parent(), true);
                                });
                            }
                        }

                        // force auto height of element so actual height can be extracted
                        el.css({'height': 'auto'});

                        // listAnim: animate child elements when opening
                        if (!isOpen && $.Velocity && listAnim) el.find(' > li, li.mtree-open > ul > li').css({'opacity': 0}).velocity('stop').velocity('list');

                        // Velocity.js animate element
                        if ($.Velocity) {
                            el.velocity('stop').velocity({
                                //translateZ: 0, // optional hardware-acceleration is automatic on mobile
                                height: isOpen ? [0, el.outerHeight()] : [el.outerHeight(), 0]
                            }, {
                                queue: false,
                                duration: duration,
                                easing: easing,
                                display: isOpen ? 'none' : 'block',
                                begin: setNodeClass($(this).parent(), isOpen),
                                complete: function () {
                                    if (!isOpen) $(this).css('height', 'auto');
                                }
                            });

                            // jQuery fallback animate element
                        } else {
                            setNodeClass($(this).parent(), isOpen);
                            el.slideToggle(duration);
                        }

                        // We can't have nodes as links unfortunately
                        e.preventDefault();
                    });

                    // Function for updating node class(将所有一级<li>标签添加“mtree-closed”类)
                    function setNodeClass(el, isOpen) {
                        if (isOpen) {
                            el.removeClass('mtree-open').addClass('mtree-closed');
                        } else {
                            el.removeClass('mtree-closed').addClass('mtree-open');
                        }
                    }

                    $('a[menu_id=100]').addClass('no-list');
                    $('a[menu_id=500]').addClass('no-list');

                    // List animation sequence
                    if ($.Velocity && listAnim) {
                        $.Velocity.Sequences.list = function (element, options, index, size) {
                            $.Velocity.animate(element, {
                                opacity: [1, 0],
                                translateY: [0, -(index + 1)]
                            }, {
                                delay: index * (duration / size / 2),
                                duration: duration,
                                easing: easing
                            });
                        };
                    }

                    // Fade in mtree after classes are added.
                    // Useful if you have set collapsed = true or applied styles that change the structure so the menu doesn't jump between states after the function executes.
                    if ($('.mtree').css('opacity') == 0) {
                        if ($.Velocity) {
                            $('.mtree').css('opacity', 1).children().css('opacity', 0).velocity('list');
                        } else {
                            $('.mtree').show(200);
                        }
                    }
                }
            }, "json");
        });
        //递归树
        function addChildren(parent, children) {
            // 创建一个ul标签，表示子节点列表
            var children_ul = $("<ul></ul>");
            for (var i = 0; i < children.length; i++) {
                var child_li = $("<li></li>");// 创建一个子节点
                var child_li_a = $("<a href='#' onclick='menuNodeOnClick(this)'>" + children[i]["text"] + "</a>");
                child_li_a.attr("menu_url", children[i]["menu_url"]);
                child_li_a.attr("path", children[i]["path"]);
                child_li_a.attr("menu_id", children[i]["menu_id"]);
                child_li.append(child_li_a);
                // 判断该子节点，是否有子节点列表
                if (children[i]["children"]) {
                    if (children[i]["children"].length > 0) {
                        addChildren(child_li, children[i]["children"]);
                    }
                }
                children_ul.append(child_li);
                if(!parent){
                    //var li_a_img = $("<img src='${ctx}"+children[i]['menu_icon']+ "'/>");
                    //child_li_a.prepend(li_a_img);
                    var $i = $("<i></i>");
                    if (children[i]["menu_id"] == "100") {
                        $i.addClass("fa fa-dashboard");
                    } else if (children[i]["menu_id"] == "200") {
                        $i.addClass("fa fa-tty");
                    } else if (children[i]["menu_id"] == "300") {
                        $i.addClass("fa fa-users");
                    } else if (children[i]["menu_id"] == "400") {
                        $i.addClass("fa fa-file-text");
                    } else if (children[i]["menu_id"] == "500") {
                        $i.addClass("fa fa-home");
                    } else if (children[i]["menu_id"] == "600") {
                        $i.addClass("fa fa-cloud-download");
                    } else if (children[i]["menu_id"] == "700") {
                        $i.addClass("fa fa-area-chart");
                    } else if (children[i]["menu_id"] == "800") {
                        $i.addClass("fa fa-cogs");
                    } else if (children[i]["menu_id"] == "900") {
                        $i.addClass("fa fa-question-circle");
                    }
                    child_li_a.prepend($i);
                }
            }
            if (parent) {
                parent.append(children_ul);
            } else {
                return children_ul;
            }
        }

        // 菜单节点点击事件
        function menuNodeOnClick(nodeDom) {
            var duration = 400; // Animation duration should be tweaked according to easing.
            var easing = 'easeOutQuart';
            var node = $(nodeDom);
            if (node.attr("menu_url")) {
                if (node.attr("menu_url") != "null") {// 说明点击的是叶子节点
                    if (node.attr("menu_url").indexOf("getHelpList") >= 0) {// 帮助页面，特殊处理
                        $("#help_link").attr("href", "${ctx}" + node.attr("menu_url"));
                        document.getElementById("help_link").click();
                    } else if (node.attr("menu_url").indexOf("getAbout") >= 0) {
                        $("#winAbout").window("center").window("open");
                        $("#winAbout").window("refresh", "${ctx}" + node.attr("menu_url"));
                    } else {
                        if ($(node.parent().children("ul")).length == 0 && node.parent().siblings().hasClass("mtree-open") == true) {
                            var closeSibling = node.parent().siblings(".mtree-open").children("ul");
                            if($.Velocity) {
                                closeSibling.velocity({
                                    height: 0
                                }, {
                                    duration: duration,
                                    easing: easing,
                                    display: 'none',
                                    delay: 100,
                                    complete: function(){
                                        setNodeClass($(this).parent(), true);
                                        $("#mainPage").attr('src', ctx + node.attr("menu_url"));
                                    }
                                });
                            }
                        } else {
                            //document.getElementById("mainPage").src = ctx + node.attr("menu_url");
                            $("#mainPage").attr('src', ctx + node.attr("menu_url"));
                        }
                    }
                }
            }

            function setNodeClass(el, isOpen) {
                if(isOpen) {
                    el.removeClass('mtree-open').addClass('mtree-closed');
                } else {
                    el.removeClass('mtree-closed').addClass('mtree-open');
                }
            }
        }

        function doSwitchMenu() {
            var $menuSwitch = $("#menu_switch");
            var $mainContent = $("#main_content");
            var menuAnimate = $("#menuAnimate");
            var img_class = $menuSwitch.attr("class");
            if (img_class == "img_menu_switch") {
                $menuSwitch.removeClass("img_menu_switch");
                $menuSwitch.addClass("img_menu_switch_r");
                menuAnimate.hide();

                $mainContent.removeClass("center");
                $mainContent.addClass("center_all");
            } else {
                $menuSwitch.removeClass("img_menu_switch_r");
                $menuSwitch.addClass("img_menu_switch");
                menuAnimate.show();

                $mainContent.removeClass("center_all");
                $mainContent.addClass("center");
            }
        }

        function toggleUserPopPanel(e) {

        }

        function showNotification() {

        }
    </script>
</head>

<body>
<div class="heading">
    <div style="background: #00a0df;overflow: hidden">
        <div style="margin-right: 25px;">
            <div class="arrow" style="width: 10px;"></div>
            <div class="nav_bar_div" style="padding-left:15px;" onclick="toggleUserPopPanel(event)">
                <span><%=user.getUser_name()%></span>
            </div>
            <div class="nav_bar_div" style="padding-left:15px;" onclick="showNotification()">
                <img class="notificationIcon" style="margin-left:85px;display:inline-block;" src="${ctx}/images/menu/notify_icon.png"/>
            </div>
        </div>
        <div style="display: inline-block;margin-left: 65px;line-height: 46px;">
            <img src="${ctx}/skin/img/ucrm.png">
        </div>
    </div>
</div>
<div class="main_container">
    <div id="menuAnimate" class="left" style="background: #39444d; overflow: auto">
        <div id="body_div" class="menu_background" style="height: 100%; border-style: none;"></div>
        <a id="help_link" style="display: none;" target="_blank"></a>
    </div>
    <div id="menu_switch" class="img_menu_switch" onclick="doSwitchMenu()"></div>
    <div id="main_content" class="center" style="background-color: #F3F3F4;">
        <div style="padding: 10px;height: 100%">
            <iframe id="mainPage" src="" style="height: 100%;width: 100%;" frameborder="0">
            </iframe>
        </div>
    </div>
</div>
</body>
</html>


