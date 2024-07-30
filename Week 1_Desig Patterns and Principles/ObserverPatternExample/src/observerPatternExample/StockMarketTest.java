package observerPatternExample;

public class StockMarketTest {
    public static void main(String[] args) {
        StockMarket stockMarket = new StockMarket();

        Observer mobileApp = new MobileApp("MobileApp1");
        Observer webApp = new WebApp("WebApp1");
        stockMarket.registerObserver(mobileApp);
        stockMarket.registerObserver(webApp);
        stockMarket.setStockPrice(1200.59);
        stockMarket.deregisterObserver(mobileApp);
        stockMarket.setStockPrice(1345.32);
    }
}

