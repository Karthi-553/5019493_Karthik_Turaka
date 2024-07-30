package dependencyInjectionExample;

public class CustomerRepositoryImpl implements CustomerRepository {
 public Customer findCustomerById(String id) {
     // For demonstration purposes, we're returning a hard-coded customer.
     // In a real-world application, this would involve database access logic.
     return new Customer(id, "John Doe", "john.doe@example.com");
 }
}

