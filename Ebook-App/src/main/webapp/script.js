document.getElementById("payButton").addEventListener("click", function () {
    const amount = document.getElementById("amount").value;

    // Replace with your Razorpay API Key
    const razorpayApiKey = 'YOUR_RAZORPAY_API_KEY';

    fetch("/create-order", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            amount: amount * 100, // Convert to paise (Indian currency)
        }),
    })
    .then((response) => response.json())
    .then((data) => {
        const options = {
            key: razorpayApiKey,
            amount: data.amount,
            currency: "INR",
            name: "Your Company Name",
            description: "Payment for Services",
            order_id: data.id,
            handler: function (response) {
                alert("Payment Successful. Payment ID: " + response.razorpay_payment_id);
            },
            prefill: {
                name: "Customer Name",
                email: "customer@example.com",
            },
        };
        const rzp = new Razorpay(options);
        rzp.on("payment.failed", function (response) {
            alert("Payment Failed");
        });
        rzp.open();
    })
    .catch((error) => {
        console.error("Error creating order:", error);
    });
});
