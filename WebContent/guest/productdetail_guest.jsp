<%@page import="pack.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />

<%
	String no = request.getParameter("no");
	ProductBean bean = productMgr.getProduct(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="icon" href="../images/favicon.ico">
<script src="../js/script.js">
	
</script>
</head>
<body>
	<%@include file="guest_top.jsp"%>
	<form action="cartproc.jsp">
		<table style="vertical-align: top;">
			<tr>
				<td style="width: 20%; padding-left: 150px; padding-right: 40px;" ><img title="<%=bean.getName()%>"
					src="../data/<%=bean.getImage()%>" width="500px"></td>
				<td style="width: 50%; vertical-align: top; padding-left: 20px;">
					<table style="width: 100%;">
						<tr>
							<td style="padding-top: 20px">번호 </td>
							<td style="padding-top: 20px"><%=bean.getNo()%></td>
						</tr>
						<tr>
							<td>상품명 </td>
							<td><%=bean.getName()%></td>
						</tr>
						<tr>
							<td>판매가격 </td>
							<td><b><%=bean.getPrice()%></b></td>
						</tr>
						<tr>
							<td>등록일 </td>
							<td><%=bean.getSdate().substring(0, 10)%></td>
						</tr>
						<tr>
							<td>재고량 </td>
							<td><%=bean.getStock()%></td>
						</tr>
						<Tr>
							<td>주문 수량</td>
							<Td><input type="text" name="quantity" value="1" size="5"
								style="text-align: center;"></Td>
						</Tr>
						<tr>
							<td colspan="3" style="text-align: center; padding-top: 175px;"><Br>
							<input type="hidden" name="product_no" value="<%=bean.getNo()%>">
								<button class="button" type="submit" value="장바구니에 담기">장바구니</button>
								<button class="button" type="button" value="이전화면으로"
									onclick="history.back()">이전화면으로</button></td>
						</tr>
					</table>
				</td>
		</table>
		<h3 style="text-align: center; background-color: #676767; padding-top:30px;height: 50px; font-size: 30px;">상세설명</h3>
		<table>
		<td style="width: 30%;">
					
				</td>
			<tr>
				<p style="text-align: center;">
					<img src="../data/<%=bean.getDetailImage()%>" width="1000px;">
				</p>
			</tr>
			</tr>
		</table>
	</form>
	<%@include file="guest_bottom.jsp"%>
</body>
</html>
















