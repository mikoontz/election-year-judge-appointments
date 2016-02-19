Tf <- 80
turnover_rate <- 1/20
turnover_intensity <- Tf * turnover_rate
election_year_prob <- 1/4

num_of_judges <- 0:25

joint_probs <- dpois(num_of_judges, lambda=turnover_intensity) * dbinom(0, num_of_judges, prob=election_year_prob)
sum(joint_probs)

plot(NA, xlim=range(num_of_judges), ylim=c(0, max(joint_probs)), xlab="X = Number of bench vacancies in 80 years", ylab="Pr(no appointments in election year AND X vacancies)")
segments(0:10, y0=0, y1=joint_probs)
title(main=paste0("Probability of no justice appointments in election year in ", Tf, " years: ", round(sum(joint_probs)*100, 2), "%"))