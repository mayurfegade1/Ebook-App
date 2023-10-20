<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.razorpay.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Order</title>
</head>
<body>
    <%
        // Replace with your Razorpay API Key and Secret Key
        String apiKey = "YOUR_RAZORPAY_API_KEY";
        String apiSecret = "YOUR_RAZORPAY_API_SECRET";

        RazorpayClient razorpay = new RazorpayClient(apiKey, apiSecret);

        try {
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", request.getParameter("amount"));
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_rcptid_" + System.currentTimeMillis());

            Order order = razorpay.orders.create(orderRequest);

            out.println(order.toString());
        } catch (RazorpayException e) {
            out.println(e.getMessage());
        }
    %>
</body>
</html>
