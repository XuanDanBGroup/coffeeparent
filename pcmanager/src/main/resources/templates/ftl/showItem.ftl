<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="utf-8"/>
        <title>index</title>
        <link rel="stylesheet" href="http://fonts.useso.com/css?family=Arimo:400,700,400italic">
        <link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
        <link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/xenon-core.css">
        <link rel="stylesheet" href="assets/css/xenon-forms.css">
        <link rel="stylesheet" href="assets/css/xenon-components.css">
        <link rel="stylesheet" href="assets/css/xenon-skins.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <script src="assets/js/jquery-1.11.1.min.js"></script>
    </head>
<body>
<!-- Table exporting -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">新闻列表展示</h3>
        <#--新增-->
        <a href="/addItem"  class="btn btn-primary btn-single btn-sm" style="background-color: #0b6aff;margin-left: 500px;">添加</a>
        <div class="panel-options">
            <a href="#" data-toggle="panel">
                <span class="collapse-icon">&ndash;</span>
                <span class="expand-icon">+</span>
            </a>
            <a href="#" data-toggle="remove">
                &times;
            </a>
        </div>
    </div>
    <div class="panel-body">
        <script type="text/javascript">
            jQuery(document).ready(function($)
            {
                $("#example-4").dataTable({
                    aLengthMenu: [
                        [5, 10, 15, 100, -1], [5, 10, 15, 100, "All"]
                    ]
                });
            });
        </script>
        <table class="table table-bordered table-striped" id="example-4">
            <thead>
            <tr>
                <th>新闻标题</th>
                <th>新闻图片</th>
                <th>新闻内容</th>
                <th>操作</th>
            </tr>
            </thead>

            <tfoot>
            <tr>
                <th>新闻标题</th>
                <th>新闻图片</th>

                <th>新闻内容</th>
                <th>操作</th>
            </tr>
            </tfoot>

            <tbody>
            <#list itemList as it>
                <tr>
                    <td>${it.ititle}</td>
                    <td>
                        <img src="${it.ipic}" alt="新闻图片" height="80px">
                    </td>

                    <td>${it.icontent}</td>
                    <td>
                        <a href="updateItem?id=${it.itemid}" class="btn btn-secondary btn-sm btn-icon icon-left">修改</a>
                        <a href="#" class="btn btn-danger btn-sm btn-icon icon-left" onclick="del(${it.itemid})">删除</a>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <script type="text/javascript">
            function del(id) {
               if ( window.confirm("确定要删除吗？")){
                   location.href="delItemByStatus?id="+id;
               }
            }
        </script>

    </div>
</div>
<!-- Imported styles on this page -->
<link rel="stylesheet" href="assets/js/datatables/dataTables.bootstrap.css">
<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>
<script src="assets/js/datatables/js/jquery.dataTables.min.js"></script>
<!-- Imported scripts on this page -->
<script src="assets/js/datatables/dataTables.bootstrap.js"></script>
<script src="assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
<script src="assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>

</html>


