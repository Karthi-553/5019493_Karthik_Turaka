package adapterPatternExample;

public class Main {
    public static void main(String[] args) {
        Paytm paytm = new Paytm();
        PaymentProcessor paytmAdapter = new PaytmAdapter(paytm);
        paytmAdapter.processPayment(500.0);

        PhonePe phonePe = new PhonePe();
        PaymentProcessor phonePeAdapter = new PhonePeAdapter(phonePe);
        phonePeAdapter.processPayment(300.0);
    }
}
