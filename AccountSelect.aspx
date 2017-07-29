<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountSelect.aspx.cs" Inherits="Daimler.WeChat.Web.AccountSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <%=Daimler.WeChat.Web.Wordings.GetTitle(weChatType) %>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=yes" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Css/Common.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .AlertLabel {
            color: white;
            background-image: url("/images/alert.png");
            background-position-x: right;
            background-position-y: 0;
            background-repeat: no-repeat;
            background-size: 1.25em;
            padding-right: 1.5em;
            line-height: 1.5em;
        }

        .button {
            color: #71AED7;
            background-color: rgba(255,255,255,0.13);
            border-top: 1px solid rgba(255,255,255,.15);
            border-bottom-left-radius: 5px !important;
            border-bottom-right-radius: 5px !important;
            -webkit-border-bottom-left-radius: 5px !important;
            -webkit-border-bottom-right-radius: 5px !important;
            border-top-left-radius: 5px !important;
            border-top-right-radius: 5px !important;
            -webkit-border-top-left-radius: 5px !important;
            -webkit-border-top-right-radius: 5px !important;
            -webkit-appearance: none;
            border-right: 0;
            border-bottom: 0;
            border-left: 0;
            cursor: pointer;
            display: block;
            white-space: pre-line;
            height: 2.5em;
            width: 95%;
            margin-left: auto;
            margin-right: auto;
            font-size: 1em;
            padding: 0;
            text-align: center;
        }


    .ContentDescription{
            padding: 1em 1em 1em 1em;
            margin: 0 0 0 0;
            text-align: left;
            font-size: 0.75em;
            color: #fff;
            border: 0 0 0 0;
            border-top: solid 1px rgb(72,72,72);
            border-bottom: solid 1px rgb(21,21,21);
     }

    .ContractLabel {
            color: white;
            font-weight: bold;
            font-size: 1em;
            float: left;
            line-height: 1em;
            vertical-align:bottom; 
            margin-top:10px;  
            width:80px;        
            
        }

    .nice {
        display: inline-block;
        font-size: 1.15em;
    }
    </style>
    <script type="text/javascript">
        //function onLoad() {

        //    var overdueAmountControl = document.getElementById("LbOverdueAmount");
        //    if (overdueAmountControl.innerText != "￥0.00") {
        //        overdueAmountControl.className = "AlertLabel";
        //    }
        //    else {
        //        overdueAmountControl.className = "";
        //    }
        //}
        function SelChange() {
            var noControl = document.getElementById("HdContractNo");
            var selControl = document.getElementById("SlContractNo");
            if (noControl.value != selControl.value) {
                noControl.value = selControl.value;
                form1.submit();
            }

        }

        function UpdateAccount() {
            var upControl = document.getElementById("UpAccount");
            upControl.value = "UpAccount";
            form1.submit();
        }
    </script>
</head>
<body >
    <form id="form1" runat="server">
        <div id="TitleBar">
            <div id="logo">&nbsp;</div>
        </div>       
        <table width="100%">
            <tr>
                <td class="ContentTh"><%=weChatType== Daimler.WeChat.WECHATTYPE.AFC?"合同号:":"合同号:" %></td>
                <td class="ContentTd"><select class="nice" id="SlContractNo" onchange="SelChange()" runat="server">
                <option>合同：IP123456</option>
                    </select>
                        <input type="hidden" id="HdContractNo" runat="server" value="" />
                    <input type="hidden" id="UpAccount" runat="server" value="" />
                </td>
            </tr>
            <tr>
                <td class="ContentTh">当前还款账号:</td>
                <td class="ContentTd">
                    <label runat="server" id="accountLb"></label>
                </td>
            </tr>
        </table> 
        <div id="pWeChatType" style="color:#fff"  class="ContentDescription">
            <font size="2">
                如果您的还款账号发生变更,
            <a href="#" onclick="UpdateAccount()">请填写变更账户资料</a>
            <p>如新账号是工商银行借记卡,变更时间<%=weChatType== Daimler.WeChat.WECHATTYPE.AFC?"3-5":"7" %>个工作日</p> 
            <p>如新账号是工商银行/建设银行公司户,变更时间15个工作日(只限公司客户)</p> 
            <p>新账号成功变更后,会短信通知您的预留手机</p>
            <p>如果现在已经临近您的还款日,原来的账户又无法使用,请将本期应付款项汇款至
            <a id="defaultLink" runat="server">
                <%=weChatType== Daimler.WeChat.WECHATTYPE.AFC?"奔驰金融官方账户":"奔驰租赁官方账户" %>
            </a><br/>
            <br/>汇款后请务必使用“回传汇款通知”功能填写汇款信息,或者致电 <%=weChatType== Daimler.WeChat.WECHATTYPE.AFC?"400-898-1888":"400-898-1889" %>告知。
            </p>
            </font>
        </div>         
    <%=Daimler.WeChat.Web.Wordings.GetBottom(weChatType) %>
    </form>
</body>
</html>
