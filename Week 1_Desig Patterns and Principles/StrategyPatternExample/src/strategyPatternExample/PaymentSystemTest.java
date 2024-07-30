package strategyPatternExample;

public class PaymentSystemTest {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();
        PaymentStrategy creditCardPayment = new CreditCardPayment("1234-5678-9876-5432", "Ramesh");
        context.setPaymentStrategy(creditCardPayment);
        context.pay(154.0);
        PaymentStrategy payPalPayment = new PayPalPayment("Ramesh@example.com");
        context.setPaymentStrategy(payPalPayment);
        context.pay(255.0);
    }
}
