Tf <- 80 # 80 years
turnover_rate <- 1/(6192/365) * 9 # Based on mean tenure of SC judges that started their term after 1900. Multiply rate by 9 because each seat could turnover.
turnover_intensity <- Tf * turnover_rate
election_year_prob <- 1/4 # Presidential election every 4 years

num_of_judges <- 0:100 # We could go out to infinity to cover the whole support of the Poisson, but the probabilities drop off so significantly, we get a good approximation by stopping way before infinity. Even 25 is probably overkill.

joint_probs <- dpois(num_of_judges, lambda=turnover_intensity) * dbinom(0, num_of_judges, prob=election_year_prob)
sum(joint_probs)

plot(NA, xlim=range(num_of_judges), ylim=c(0, max(joint_probs)), xlab="X = Number of bench vacancies in 80 years", ylab="Pr(no appointments in election year AND X vacancies)")
segments(num_of_judges, y0=0, y1=joint_probs)
title(main=paste0("Probability of no justice appointments in election year\nin ", Tf, " years just by chance: ", round(sum(joint_probs)*100, 2), "%"))