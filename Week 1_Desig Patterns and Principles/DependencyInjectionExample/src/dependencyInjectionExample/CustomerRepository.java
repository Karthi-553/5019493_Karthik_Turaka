package dependencyInjectionExample;

public interface CustomerRepository {
    Customer findCustomerById(String id);
}