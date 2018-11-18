<%--
  Created by yujianfei.
  User: admin
  Date: 2017/11/11
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width = device-width, initial-scale=1">
    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css?_=${bss_ver}"/>
    <link rel="stylesheet" href="${ctx}/css/bootstrap-table.min.css?_=${bss_ver}"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap-table.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap-table-zh-CN.min.js?_=${bss_ver}"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><%=rb.getString("KeHu")%></h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <label for="organization" class="col-md-1 control-label no-padding-right"><%=rb.getString("YunYingShang")%></label>
                    <div class="col-md-2">
                        <select class="form-control" id="organization">
                            <option value="default">default</option>
                        </select>
                    </div>
                    <label for="client_id" class="col-md-1 control-label no-padding-right"><%=rb.getString("YongHuId")%></label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" id="client_id" placeholder="">
                    </div>
                    <label for="client_name" class="col-md-1 control-label no-padding-right"><%=rb.getString("YongHuMingCheng")%></label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" id="client_name" placeholder="">
                    </div>
                </div>
                <div class="row">
                    <label for="sim" class="col-md-1 control-label no-padding-right"><%=rb.getString("SimKa")%></label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" id="sim" placeholder="">
                    </div>
                    <label for="status" class="col-md-1 control-label no-padding-right"><%=rb.getString("ZhuangTai")%></label>
                    <div class="col-md-2">
                        <select class="form-control" id="status">
                            <option value="00"><%=rb.getString("WeiJiHuo")%></option>
                            <option value="01" selected><%=rb.getString("JiHuo")%></option>
                            <option value="02"><%=rb.getString("ZhuDongTingZhi")%></option>
                            <%--<option value="03">Overdy stop</option>--%>
                            <option value="04"><%=rb.getString("GuaShi")%></option>
                            <option value="09"><%=rb.getString("DengDaiChongZhi")%></option>
                            <option value="10"><%=rb.getString("SuoSi")%></option>
                            <option value="11"><%=rb.getString("ZuoFei")%></option>
                            <option value="98"><%=rb.getString("YuKaiHu")%></option>
                            <option value="98"><%=rb.getString("YuXaiHu")%></option>
                        </select>
                    </div>
                    <label for="lifecycle" class="col-md-1 control-label no-padding-right"><%=rb.getString("ShengMingZhouQi")%></label>
                    <div class="col-md-2">
                        <select class="form-control" id="lifecycle">
                            <option value="0"><%=rb.getString("WeiJiHuo")%></option>
                            <option value="1" selected><%=rb.getString("JiHuo")%></option>
                            <option value="2"><%=rb.getString("ChongZhi")%></option>
                            <option value="3"><%=rb.getString("SuoSi")%></option>
                            <option value="4"><%=rb.getString("ZuoFei")%></option>
                        </select>
                    </div>
                    <div class="col-md-3" align=center>
                        <button type="button" class="btn btn-primary btn-md active"><%=rb.getString("TiJiao")%></button>
                        <button type="button" class="btn btn-warning btn-md"><%=rb.getString("ChongZhiReset")%></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><%=rb.getString("YongHuXinXiJiLu")%></h3>
            </div>
            <div class="panel-body">
                <div id="toolbar_clientInfo" class="btn-group">
                    <button id="btn_add" type="button" class="btn btn-default" onclick="doCreateClient()">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Create
                    </button>
                    <button id="btn_active" type="button" class="btn btn-default" onclick="doActiveClient()">
                        <span class="glyphicon glyphicon-play" aria-hidden="true"></span>Active
                    </button>
                    <button id="btn_deactive" type="button" class="btn btn-default" onclick="doDeactiveClient()">
                        <span class="glyphicon glyphicon-pause" aria-hidden="true"></span>Deactive
                    </button>
                    <button id="btn_delete" type="button" class="btn btn-default" onclick="doDeleteClient()">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>Delete
                    </button>
                    <button id="btn_detail" type="button" class="btn btn-default" onclick="showClientInfo()">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>Detail
                    </button>
                    <button id="btn_edit" type="button" class="btn btn-default" onclick="editClientInfo()">
                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>Edit
                    </button>
                </div>
                <table  id="clientInfoTable"
                        data-toggle="table"
                        data-url="/client/getClientInfos.do"
                        data-pagination="true"
                        data-side-pagination="server"
                        data-page-list="[5, 10, 20, 50, 100, 200]"
                        data-search="false"
                        data-show-columns="false"
                        data-cache="false"
                        data-striped="true"
                        data-toolbar="#toolbar">
                    <thead>
                    <tr>
                        <th data-field="state" data-checkbox="true"></th>
                        <th data-field="user_id" data-align="center" data-sortable="true"><%=rb.getString("YongHuId")%></th>
                        <th data-field="cust_name" data-align="center" data-sortable="true"><%=rb.getString("YongHuMingCheng")%></th>
                        <th data-field="balance" data-sortable="true"><%=rb.getString("YuE")%></th>
                        <th data-field="prod_name" data-sortable="true"><%=rb.getString("TaoCan")%></th>
                        <th data-field="phone_number" data-sortable="true"><%=rb.getString("DianHuaHaoMa")%></th>
                        <th data-field="status" data-sortable="true"><%=rb.getString("ZhuangTai")%></th>
                        <th data-field="life_status" data-sortable="true"><%=rb.getString("ShengMingZhouQi")%></th>
                        <th data-field="create_date" data-sortable="true"><%=rb.getString("ChuangJianShiJian")%></th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
