data{

  // number of observations at different hierarchical levels
  int<lower = 1> N_i;
  int<lower = 1> N_j;
  int<lower = 1> k;

  // group indices for sites and layers
  int<lower = 1> id_layers_measurements[N_i];

  // variables
  real y[N_i];
  matrix[N_j, k] X;
  real y_layers_scale_factor;
  //real<lower = 0> ch[N_j];
  //real<lower = 0> hi[N_j];
  //real<lower = 0> ch_hi[N_j];

  //prior parameters
  real mu_beta_0;
  real<lower = 0> sigma_beta_0;
  real<lower = 0>  lambda_2;
  real<lower = 0> lambda_1;
  vector[k] mu_betas;
  vector[k] sigma_betas;
  real<lower = 0> nu_betas;

}
parameters{

  real beta_0;
  vector<lower = 0>[N_j] mu_j;
  real<lower = 0> sigma_2;
  real<lower = 0> sigma_j[N_j];

  // coefficients
  vector[k] betas;

}
transformed parameters{
  real<lower = 0>y_layers_mu[N_j];
  vector<lower = 0>[N_j] mu_j_scaled;
  for(i in 1:N_j) {
    y_layers_mu[i] = exp(beta_0 + X[i, ] * betas);
  }
  mu_j_scaled = mu_j/y_layers_scale_factor;
}
model{

  // global mean
  beta_0 ~ normal(mu_beta_0, sigma_beta_0);

  // layer mean
  sigma_2 ~ exponential(lambda_2);
  for (i in 1:k) {
    betas[i] ~ student_t(nu_betas, mu_betas[i], sigma_betas[i]);
  }
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

  // predicted values for each layer and lik likelihood
  for(i in 1:N_j) {
    mu_j_rep[i] = gamma_rng(y_layers_mu[i]^2/sigma_2^2, y_layers_mu[i]/(sigma_2^2 * y_layers_scale_factor))/y_layers_scale_factor;
    log_lik[i] = gamma_lpdf(mu_j[i] | y_layers_mu[i]^2/sigma_2^2, y_layers_mu[i]/(sigma_2^2 * y_layers_scale_factor));
  }
}
