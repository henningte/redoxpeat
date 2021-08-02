data{

  // number of observations at different hierarchical levels
  int<lower = 1> N_i;
  int<lower = 1> N_j;

  // group indices for sites and layers
  int<lower = 1> id_layers_measurements[N_i];

  // variables
  real y[N_i];
  real y_layers_scale_factor;

  //prior parameters
  real mu_beta_0; // mean of normal prior for the population intercept
  real<lower = 0> sigma_beta_0; // sd of normal prior for the population intercept
  real<lower = 0>  lambda_2; // rate parameter of exponential prior for the residual variance
  real<lower = 0> lambda_1; // rate parameter of exponential prior for the variance of replicate measurements

}
parameters{

  real beta_0; // population intercept
  vector<lower = 0>[N_j] mu_j; // intercept for each sample/layer
  real<lower = 0> sigma_2; // residual variance
  real<lower = 0> sigma_j[N_j]; // variance of measurements per sample/layer

}
transformed parameters{
  real<lower = 0>y_layers_mu[N_j];
  vector<lower = 0>[N_j] mu_j_scaled;
  for(i in 1:N_j) {
    y_layers_mu[i] = exp(beta_0);
  }
  mu_j_scaled = mu_j/y_layers_scale_factor;
}
model{

  // population intercept
  beta_0 ~ normal(mu_beta_0, sigma_beta_0);

  // y for each sample/layer
  sigma_2 ~ exponential(lambda_2);
  for(i in 1:N_j) {
    mu_j[i] ~ gamma(y_layers_mu[i]^2/sigma_2^2, y_layers_mu[i]/(sigma_2^2 * y_layers_scale_factor));
  }

  // measurement mean
  sigma_j ~ exponential(lambda_1);
  for(i in 1:N_i) {
    y[i] ~ gamma(mu_j_scaled[id_layers_measurements[i]]^2/sigma_j[id_layers_measurements[i]]^2 , mu_j_scaled[id_layers_measurements[i]]/sigma_j[id_layers_measurements[i]]^2);
  }

}
generated quantities{

  vector[N_i] y_rep;
  vector[N_j] mu_j_rep;
  vector[N_j] log_lik;

  // predicted values for each measurement
  for(i in 1:N_i) {
    y_rep[i] = gamma_rng(mu_j_scaled[id_layers_measurements[i]]^2/sigma_j[id_layers_measurements[i]]^2, mu_j_scaled[id_layers_measurements[i]]/sigma_j[id_layers_measurements[i]]^2);
  }

  // predicted values for each layer and log likelihood
  for(i in 1:N_j) {
    mu_j_rep[i] = gamma_rng(y_layers_mu[i]^2/sigma_2^2, y_layers_mu[i]/(sigma_2^2 * y_layers_scale_factor))/y_layers_scale_factor;
    log_lik[i] = gamma_lpdf(mu_j[i] | y_layers_mu[i]^2/sigma_2^2, y_layers_mu[i]/(sigma_2^2 * y_layers_scale_factor));
  }
}
