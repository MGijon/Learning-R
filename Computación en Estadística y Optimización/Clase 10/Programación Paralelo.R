### ========================================================
### ComputaciÛn en EstadÌstica y en OptimizaciÛn, 26.10.2017
### Group A, R Lecture 10: An example of parallel computing
### ========================================================
## Source: The Biometric Bulletin, April - June 2016
## http://www.biometricsociety.org/wp-content/uploads/2011/05/IBS-Newsletter-2016_AprilJune_FP.pdf

#install.packages("doParallel")
#install.packages("foreach")

library(quantreg)    # For quantile regression function rq()
data(engel)          # The data set which will be used

help(engel)
library(data.table)
data.table(engel)


# Graphical representation
# ------------------------
quartz()
par(font = 2, font.axis = 2, font.lab = 4, las = 1)
plot(foodexp ~ income, data = engel, pch = 16, xlab = "Income",
     ylab = "Food expenditure")
fit1 <- rq(foodexp ~ income, tau = 0.5, data = engel)
abline(fit1)
summary(fit1)


# Objective:
# Bootstrap confidence intervals for the regression parameters
# -------------------------------------------------------------
library(foreach)
library(doParallel)
cl <- makeCluster(2)    # create a cluster with 2 cores
registerDoParallel(cl)  # register the cluster
res <- foreach(i = 1:10000, .combine = "rbind", .packages = "quantreg") %dopar% {
  # Generate a bootstrap sample
  boot_dat <- engel[sample(1:nrow(engel), replace = TRUE), ]
  # Fit the model
  fit1 <- rq(foodexp ~ income, tau = 0.5, data = boot_dat)
  # return the coefficients
  fit1$coef
}
stopCluster(cl) # shut down the cluster
data.table(res)
# The Bootstrap confidence interval
quantile(res[, 2], p = c(.025, .975))


# Comparison of execution times with and without parallel computing
# -----------------------------------------------------------------
# (a) No parallel computing
system.time({
  res <- foreach(i = 1:10000, .combine = "rbind", .packages = "quantreg") %do% {
    boot_dat <- engel[sample(1:nrow(engel), replace = TRUE), ]
    fit1 <- rq(foodexp ~ income, tau = 0.5, data = boot_dat)
    fit1$coef
  }
})

# (b) 2 cores
cl <- makeCluster(2)
registerDoParallel(cl)
system.time({
  res <- foreach(i = 1:10000, .combine = "rbind", .packages = "quantreg") %dopar% {
    boot_dat <- engel[sample(1:nrow(engel), replace = TRUE), ]
    fit1 <- rq(foodexp ~ income, tau = 0.5, data = boot_dat)
    fit1$coef
  }
})
stopCluster(cl)

# (c) 4 cores
cl <- makeCluster(4)
registerDoParallel(cl)
system.time({
  res <- foreach(i = 1:10000, .combine = "rbind", .packages = "quantreg") %dopar% {
    boot_dat <- engel[sample(1:nrow(engel), replace = TRUE), ]
    fit1 <- rq(foodexp ~ income, tau = 0.5, data = boot_dat)
    fit1$coef
  }
})
stopCluster(cl)

