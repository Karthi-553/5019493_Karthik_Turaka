package adapterPatternExample;

public class PhonePeAdapter implements PaymentProcessor {
    private PhonePe phonePe;

    public PhonePeAdapter(PhonePe phonePe) {
        this.phonePe = phonePe;
    }

    public void processPayment(double amount) {
        phonePe.makePayment(amount);
    }
}

