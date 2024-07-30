package strategyPatternExample;

public class CreditCardPayment implements PaymentStrategy {
    private String cardNumber;
    private String cardHolderName;
    public CreditCardPayment(String cardNumber, String cardHolderName) {
        this.cardNumber = cardNumber;
        this.cardHolderName = cardHolderName;
    }
    public void pay(double amount) {
        System.out.println(amount + " paid using Credit Card.");
    }
}
