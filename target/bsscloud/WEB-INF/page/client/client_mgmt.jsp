<%--
  Created by Yujianfei.
  User: dell
  Date: 2017/10/3
  Time: 18:18
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
    <link rel="stylesheet" href="${ctx}/css/bootstrap-datetimepicker.min.css?_=${bss_ver}"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap-table.min.js?_=${bss_ver}"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap/bootstrap-datetimepicker.min.js?_=${bss_ver}"></script>

    <script type="text/javascript">
        function doSelectClientType() {

        }

        function doSelectInvoiceSameFlag() {

        }

        function doAddAdditionalServicePlan() {

        }

        function doSelectMethod() {

        }
    </script>
</head>
<body>
<div class="container-fluid">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#step1" data-toggle="tab"><%=rb.getString("BuZhouYi")%></a>
        </li>
        <li>
            <a href="#step2" data-toggle="tab"><%=rb.getString("BuZhouEr")%></a>
        </li>
        <li>
            <a href="#step3" data-toggle="tab"><%=rb.getString("BuZhouSan")%></a>
        </li>
        <li>
            <a href="#step4" data-toggle="tab"><%=rb.getString("BuZhouSi")%></a>
        </li>
    </ul>
    <div id="clientTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="step1">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("ShenFenXinXi")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="operator" class="col-md-3 control-label no-padding-right"><%=rb.getString("YunYingShang")%></label>
                            <div class="col-md-9">
                                <select class="form-control" id="operator">
                                    <option><%=rb.getString("MoRen")%></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="client_type" class="col-md-3 control-label no-padding-right"><%=rb.getString("KeHuLeiXing")%></label>
                            <div class="col-md-9">
                                <select class="form-control" id="client_type" onchange="doSelectClientType()">
                                    <option value="0"><%=rb.getString("PuTong")%></option>
                                    <option value="1"><%=rb.getString("GongSi")%></option>
                                    <option value="2"><%=rb.getString("XueSheng")%></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row"  id="row_general">
                        <div class="col-md-6">
                            <label for="first_name" class="col-md-3 control-label no-padding-right"><%=rb.getString("XingShi")%><font color=red>*</font></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="first_name" placeholder="<%=rb.getString("XingShi")%>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="last_name" class="col-md-3 control-label no-padding-right"><%=rb.getString("MingZi")%><font color=red>*</font></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="last_name" placeholder="<%=rb.getString("MingZi")%>">
                            </div>
                        </div>
                    </div>
                    <div class="row" tagName="row_company" style="display:none">
                        <div class="col-md-6">
                            <label for="first_name" class="col-sm-3 control-label no-padding-right"><%=rb.getString("LianXiRenXingShi")%><font color=red>*</font></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="company_first_name" placeholder="<%=rb.getString("LianXiRenXingShi")%>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="last_name" class="col-md-3 control-label no-padding-right"><%=rb.getString("LianXiRenMingZi")%><font color=red>*</font></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="company_last_name" placeholder="<%=rb.getString("LianXiRenMingZi")%>">
                            </div>
                        </div>
                    </div>
                    <div class="row" tagName="row_company" style="display:none">
                        <div class="col-md-6">
                            <label for="company_name" class="col-md-3 control-label no-padding-right"><%=rb.getString("GongSiMingCheng")%><font color=red>*</font></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="company_name" placeholder="<%=rb.getString("GongSiMingCheng")%>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="registration_number" class="col-md-3 control-label no-padding-right"><%=rb.getString("ZhuCeHao")%></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="registration_number" placeholder="<%=rb.getString("ZhuCeHao")%>">
                            </div>
                        </div>
                    </div>
                    <div class="row" tagName="row_company" style="display:none">
                        <div class="col-md-6">
                            <label for="tax_id" class="col-md-3 control-label no-padding-right"><%=rb.getString("BaoShuiHaoMa")%></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="tax_id" placeholder="<%=rb.getString("BaoShuiHaoMa")%>">
                            </div>
                        </div>
                        <div class="col-md-6"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="email" class="col-md-3 control-label no-padding-right"><%=rb.getString("YouXiang")%></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="email" placeholder="<%=rb.getString("YouXiang")%>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="male" class="col-md-3 control-label no-padding-right"><%=rb.getString("XingBie")%></label>
                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="male" value="0"><%=rb.getString("NanXing")%>
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="female" value="1"><%=rb.getString("NvXing")%>
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="X" value="2"><%=rb.getString("WeiZhi")%>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="mobile_phone" class="col-md-3 control-label no-padding-right"><%=rb.getString("YiDongDianHua")%></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="mobile_phone" placeholder="<%=rb.getString("YiDongDianHua")%>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="birth_date" class="col-md-3 control-label no-padding-right"><%=rb.getString("JiaTingDianHua")%></label>
                            <div class="col-md-9">
                                <div id="birth_date" class="input-group date form_date col-md-7" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                    <input class="form-control" size="16" type="text" value="" readonly>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="home_phone" class="col-md-3 control-label no-padding-right"><%=rb.getString("ShengRi")%></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="home_phone" placeholder="<%=rb.getString("ShengRi")%>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="wedding_date" class="col-md-3 control-label no-padding-right"><%=rb.getString("JieHunRi")%></label>
                            <div class="col-md-9">
                                <div id="wedding_date" class="input-group date form_date col-md-7" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input22" data-link-format="yyyy-mm-dd">
                                    <input class="form-control" size="16" type="text" value="" readonly>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="work_phone" class="col-md-3 control-label no-padding-right"><%=rb.getString("BanGongDianHua")%></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="work_phone" placeholder="<%=rb.getString("BanGongDianHua")%>">
                            </div>
                        </div>
                        <div class="col-md-6"></div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("LianXiDiZhi")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <label for="country" class="col-md-2 control-label no-padding-right"><%=rb.getString("GuoJi")%></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="country" placeholder="<%=rb.getString("GuoJi")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label for="address_line1" class="col-md-2 control-label no-padding-right"><%=rb.getString("DiZhi1")%></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="address_line1" placeholder="<%=rb.getString("DiZhi1")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label for="address_line2" class="col-md-2 control-label no-padding-right"><%=rb.getString("DiZhi2")%></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="address_line2" placeholder="<%=rb.getString("DiZhi2")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label for="city" class="col-md-2 control-label no-padding-right"><%=rb.getString("ChengShi")%></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="city" placeholder="<%=rb.getString("ChengShi")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label for="state" class="col-md-2 control-label no-padding-right"><%=rb.getString("Zhou/Sheng")%></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="state" placeholder="<%=rb.getString("Zhou/Sheng")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label for="zip_code" class="col-md-2 control-label no-padding-right"><%=rb.getString("YouBian")%></label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="zip_code" placeholder="<%=rb.getString("YouBian")%>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("FaPiaoDiZhi")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <input type="checkbox" id="same_invoice_flag" style="margin: 0 0 10px 16px;" onClick="doSelectInvoiceSameFlag()"><%=rb.getString("FaPiaoDiZhiYuLianXiDiZhiXiangTong")%>
                    </div>
                    <div id="row_invoice_address">
                        <div class="row">
                            <label for="i_country" class="col-md-2 control-label no-padding-right"><%=rb.getString("GuoJi")%></label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="i_country" placeholder="<%=rb.getString("GuoJi")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="i_address_line1" class="col-md-2 control-label no-padding-right"><%=rb.getString("DiZhi1")%></label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="i_address_line1" placeholder="<%=rb.getString("DiZhi1")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="i_address_line2" class="col-md-2 control-label no-padding-right"><%=rb.getString("DiZhi2")%></label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="i_address_line2" placeholder="<%=rb.getString("DiZhi2")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="i_city" class="col-md-2 control-label no-padding-right"><%=rb.getString("ChengShi")%></label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="i_city" placeholder="<%=rb.getString("ChengShi")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="i_state" class="col-md-2 control-label no-padding-right"><%=rb.getString("Zhou/Sheng")%></label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="i_state" placeholder="<%=rb.getString("Zhou/Sheng")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="i_zip_code" class="col-md-2 control-label no-padding-right"><%=rb.getString("YouBian")%></label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="i_zip_code" placeholder="<%=rb.getString("YouBian")%>">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("BeiZhu")%></h3>
                </div>
                <div class="panel-body">
                    <textarea id="note" class="form-control" rows="3"></textarea>
                </div>
            </div>
            <div class="row">
                <button type="button" style="float: right;margin-right: 20px;" class="btn btn-primary btn-lg active"><%=rb.getString("XiaYiBu")%></button>
            </div>
        </div>
        <div class="tab-pane fade" id="step2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("XuanZeYiZhangSimKa")%></h3>
                </div>
                <div class="panel-body">
                    <label for="sim" class="col-md-2 control-label no-padding-right" style="height: 34px;display: inline-block;line-height: 34px;"><%=rb.getString("XuanZeYiZhangSimKa")%></label>
                    <div class="col-md-10">
                        <form class="form-inline">
                            <div class="form-group">
                                <input type="text" class="form-control" id="sim" style="width:100%" placeholder="<%=rb.getString("XuanZeYiZhangSimKa")%>">
                            </div>
                            <button class="btn btn-success btn-sm">
                                <span class="glyphicon glyphicon-search"></span><%=rb.getString("SouSuo")%>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <button type="button" style="float: left; margin-left: 15px;" class="btn btn-warning btn-lg"><%=rb.getString("ShangYiBu")%></button>
                <button type="button" style="float: left; margin-left: 20px;" class="btn btn-primary btn-lg active"><%=rb.getString("XiaYiBu")%></button>
            </div>
        </div>
        <div class="tab-pane fade" id="step3">
            <%--<div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("TaoCan")%></h3>
                </div>
                <div class="panel-body">
                    <table id="serivcePlanTable" class="table table-striped table-bordered" cellspacing="0" width="100%"
                        data-toggle="table" data-url="/client/getServicePlan.do">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th><%=rb.getString("TaoCanMingCheng")%></th>
                            <th><%=rb.getString("MiaoShu")%></th>
                            <th><%=rb.getString("JiaGe")%></th>
                            <th><%=rb.getString("ShiXian")%></th>
                            <th><%=rb.getString("ChuangJianShiJian")%></th>
                            <th><%=rb.getString("ZhuangTai")%></th>
                            <th><%=rb.getString("ZhuangTaiBianGengShiJian")%></th>
                            <th><%=rb.getString("GongNeng")%></th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>--%>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("QingXuanZeZhuTaoCan")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <form class="form-inline">
                                <div class="form-group">
                                    <label><%=rb.getString("TaoCan")%></label>
                                    <input type="text" class="form-control" id="service_plan" placeholder="<%=rb.getString("TaoCan")%>">
                                </div>
                                <button class="btn btn-success btn-sm">
                                    <span class="glyphicon glyphicon-search"></span><%=rb.getString("SouSuo")%>
                                </button>
                            </form>
                        </div>
                        <div class="col-md-6">
                            20元/月， 上行20m，下行20m。
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("ZhuiJiaTaoCan")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <button type="button" class="btn btn-success btn-sm" style="margin: 0 0 10px 20px;" onClick="doAddAdditionalServicePlan()"><%=rb.getString("TianJiaTaoCan")%></button>
                    </div>
                    <div id="d_addition_service_plan">
                        <div id="additionalServicePlan" class="row"></div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("TaoCanDingZhi")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <label for="active_from" class="col-md-4 control-label no-padding-right"><%=rb.getString("JiHuoRiQi")%></label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="active_from" placeholder="<%=rb.getString("JiHuoRiQi")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label for="active_to" class="col-md-4 control-label no-padding-right"><%=rb.getString("GuanBiRiQi")%></label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="active_to" placeholder="<%=rb.getString("GuanBiRiQi")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-md-4 control-label no-padding-right"><%=rb.getString("RuGuoGuoQiWeiFu")%></label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="suspend_radio" id="suspend_service_radio" value="0"><%=rb.getString("ZhongZhiFuWu")%>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="suspend_radio" id="limit_speed_radio" value="1"><%=rb.getString("XianSu")%>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="suspend_radio" id="continue_use_radio" value="1"><%=rb.getString("JiXuShiYong")%>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <label for="suspend_day" class="col-md-4 control-label no-padding-right"><%=rb.getString("ZhongZhiYanShi")%></label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="suspend_day" placeholder="<%=rb.getString("ZhongZhiYanShi")%>">
                        </div>
                    </div>
                    <div class="row">
                        <label for="invoice_send_flag" class="col-md-4 control-label no-padding-right"><%=rb.getString("YouJianTongZhi")%></label>
                        <div class="col-md-8">
                            <select id="invoice_send_flag" class="input-sm">
                                <option value="0">No</option>
                                <option value="1">Yes</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("FaPiaoSheZhi")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <label for="invoice_type" class="col-md-4 control-label no-padding-right"><%=rb.getString("FaPiaoLeiXing")%></label>
                        <div class="col-md-8">
                            <select id="invoice_type" class="form-control">
                                <option value="0">Backward</option>
                                <option value="1">Forward</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <label for="period_start_day" class="col-sm-4 control-label no-padding-right"><%=rb.getString("KaiPiaoRiQi")%></label>
                        <div class="col-sm-8">
                            <select id="period_start_day" class="input-sm">
                                <option value="1">1</option>
                            </select> Day in month when the recurring invoicing period starts.
                        </div>
                    </div>
                    <div class="row">
                        <label for="invoice_maturity_day" class="col-sm-4 control-label no-padding-right"><%=rb.getString("FaPiaoDaoQi")%></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="invoice_maturity_day" placeholder="14">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <button type="button" style="float: left; margin-left: 15px;" class="btn btn-warning btn-lg"><%=rb.getString("ShangYiBu")%></button>
                <button type="button" style="float: left; margin-left: 20px;" class="btn btn-primary btn-lg active"><%=rb.getString("XiaYiBu")%></button>
            </div>
        </div>
        <div class="tab-pane fade" id="step4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rb.getString("ChongZhi")%></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <label for="payables" class="col-md-3 control-label no-padding-right"><%=rb.getString("YingFuKuanXiang")%></label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="payables" placeholder="Payables" readOnly=true>
                        </div>
                    </div>
                    <div class="row">
                        <label for="method" class="col-md-3 control-label no-padding-right"><%=rb.getString("FangShi")%></label>
                        <div class="col-md-6">
                            <select class="form-control" id="method" onChange="doSelectMethod()">
                                <option value="0">Cash</option>
                                <option value="1">Authorize.net credit card</option>
                                <option value="2">Voucher card</option>
                            </select>
                        </div>
                    </div>
                    <div id="r_charge_0">
                        <div class="row">
                            <label for="amount" class="col-md-3 control-label no-padding-right"><%=rb.getString("JinE")%></label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="amount" placeholder="<%=rb.getString("JinE")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="currency" class="col-md-3 control-label no-padding-right"><%=rb.getString("HuoBi")%></label>
                            <div class="col-md-6">
                                <select class="form-control" id="currency">
                                    <option value="0">USD($)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div id="r_charge_1" style="display:none">
                        <div class="row">
                            <label for="amount" class="col-md-3 control-label no-padding-right"><%=rb.getString("JinE")%></label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="credit_amount" placeholder="<%=rb.getString("JinE")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="first_name" class="col-md-3 control-label no-padding-right"><%=rb.getString("XingShi")%></label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="credit_first_name" placeholder="<%=rb.getString("XingShi")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="last_name" class="col-md-3 control-label no-padding-right"><%=rb.getString("MingZi")%></label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="credit_last_name" placeholder="<%=rb.getString("MingZi")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="email" class="col-md-3 control-label no-padding-right"><%=rb.getString("YouXiang")%></label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="credit_email" placeholder="<%=rb.getString("YouXiang")%>">
                            </div>
                        </div>
                        <div class="row">
                            <label for="credit_card" class="col-md-3 control-label no-padding-right"><%=rb.getString("XinYongKa")%></label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="credit_card" placeholder="<%=rb.getString("XinYongKa")%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-2">
                                <select class="form-control" id="month">
                                    <option value="0"><%=rb.getString("Yue")%></option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="01">07</option>
                                    <option value="02">08</option>
                                    <option value="03">09</option>
                                    <option value="04">10</option>
                                    <option value="05">11</option>
                                    <option value="06">12</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select class="form-control" id="year">
                                    <option value="0"><%=rb.getString("Nian")%></option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="cvc" placeholder="CVC">
                            </div>
                        </div>
                    </div>
                    <div id="r_charge_2" style="display:none">
                        <div class="row">
                            <label for="voucher_card" class="col-md-3 control-label no-padding-right">Voucher active code</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="voucher_card" placeholder="acvive code">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <button type="button" style="float: left; margin-left: 15px;" class="btn btn-warning btn-lg"><%=rb.getString("ShangYiBu")%></button>
                <button type="button" style="float: left; margin-left: 20px;" class="btn btn-primary btn-lg active"><%=rb.getString("BaoCun")%></button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
