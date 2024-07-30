package financialForecasting;

import java.util.HashMap;
import java.util.Map;

public class FinancialForecasting {
    public static double calculateFutureValue(double pv, double r, int n, Map<Integer, Double> memo) {
        if (memo.containsKey(n)) {
            return memo.get(n);
        }
        if (n == 0) {
            return pv;
        }
        double result = calculateFutureValue(pv, r, n - 1, memo) * (1 + r);
        System.out.println("Result at period "+n+" is "+result);
        memo.put(n, result);
        return result;
    }

    public static void main(String[] args) {
        double presentValue = 1000;  
        double growthRate = 0.05;  
        int periods = 10;            

        Map<Integer, Double> memo = new HashMap<>();

        double futureValue = calculateFutureValue(presentValue, growthRate, periods, memo);
        System.out.println("Future Value after " + periods + " periods: " + futureValue);
    }
}
