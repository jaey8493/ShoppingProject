<%@page import="pack.product.ProductBean"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="orderMgr" class="pack.order.OrderMgr"/>
    <jsp:useBean id="productMgr" class="pack.product.ProductMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文商品目録</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<script src="../js/script.js"></script>
</head>


<body>
<%@ include file ="guest_top.jsp" %>
<h2> ** 注文商品確認 **</h2>


<table>
	<tr>
		<th>注文番号</th><th>商品名</th><th>注文量</th><th>注文日</th><th>注文状態</th>	
	</tr>
	<%
	String id = (String)session.getAttribute("idKey");
	ArrayList<OrderBean> list = orderMgr.getOrder(id);
	
	if(list.size() == 0){
	%>
		<tr><td colspan="5">注文した商品がありません。</td></tr>
	<%
	}else{
		for(OrderBean ord:list){
			ProductBean product = productMgr.getProduct(ord.getProduct_no());
	%>
		<tr style="text-align:center;">
		<td><%=ord.getNo() %></td>
		<td><%=product.getName() %></td>
		<td><%=ord.getQuantity() %></td>
		<td><%=ord.getSdate().substring(0,10) %></td>
		<td>
		<%
		switch(ord.getState()){
		case "1":out.println("受付"); break;
		case "2":out.println("入金確認"); break;
		case "3":out.println("配送準備"); break;
		case "4":out.println("配送中"); break;
		case "5":out.println("処理完了"); break;
		default:out.println("受付中");
		}
		 %>
		</td>
				
		</tr>	
	<%
		}
	}
	
	%>	
</table>
<%@ include file ="guest_bottom.jsp" %>
</body>
</html>