package observerPatternExample;

public class MobileApp implements Observer {
    private String name;

    public MobileApp(String name) {
        this.name = name;
    }

    public void update(double stockPrice) {
        System.out.println(name + " received stock price update: " + stockPrice);
    }
}

