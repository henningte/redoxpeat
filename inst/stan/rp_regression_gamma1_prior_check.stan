data{

  // number of observations at different hierarchical levels
  int<lower = 1> N_i;
  int<lower = 1> N_j;
  int<lower = 1> k;

  // group indices for sites and layers
  int<lower = 1> id_layers_measurements[N_i];
  matrix[N_j, k] X;
  real y_layers_scale_factor;

  //prior parameters
  real mu_beta_0; // mean of normal prior for the population intercept
  real<lower = 0> sigma_beta_0; // sd of normal prior for the population intercept
  real<lower = 0>  lambda_2; // rate parameter of exponential prior for the residual variance
  real<lower = 0> lambda_1; // rate parameter of exponential prior for the variance of replicate measurements
  vector[k] mu_betas; // mean of normal prior for slopes
  vector[k] sigma_betas; // sd of normal prior for slopes

}
generated quantities{

  vector<lower = 0>[N_j] mu_j;
  real y[N_i];
  vector[k] betas;

  real y_pop = normal_rng(mu_beta_0, sigma_beta_0);
  real<lower = 0> sigma_2 = exponential_rng(lambda_2);
  real<lower = 0> sigma_j[N_j];
  real<lower = 0>y_layers_mu[N_j];
  vector<lower = 0>[N_j] mu_j_scaled;
  for (i in 1:k) {
    betas[i] = normal_rng(mu_betas[i], sigma_betas[i]);
  }
  for(i in 1:N_j) {
    y_layers_mu[i] = exp(y_pop + X[i, ] * betas);
    mu_j[i] = gamma_rng(y_layers_mu[i]^2/sigma_2^2, y_layers_mu[i]/(sigma_2^2 * y_layers_scale_factor));
    mu_j_scaled = mu_j/y_layers_scale_factor;
    sigma_j[i] = exponential_rng(lambda_1);
  }
  for(i in 1:N_i) {
    y[i] = gamma_rng(mu_j_scaled[id_layers_measurements[i]]^2/sigma_j[id_layers_measurements[i]]^2 , mu_j_scaled[id_layers_measurements[i]]/sigma_j[id_layers_measurements[i]]^2);
  }
}

