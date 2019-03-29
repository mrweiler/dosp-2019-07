# ---- generate data
group_a <- rnorm(n = 30, mean = 5, sd = 5)
group_b <- rnorm(n = 30, mean = 25, sd = 5)
df_wide <- data.frame(group_a, group_b)
df_long <- tidyr::gather(
  df_wide, group_a, group_b,
  key = group, value = score)

# ---- show long data
knitr::kable(head(df_long))

# ---- show wide data
knitr::kable(head(df_wide))

# ---- t test long
t.test(formula = score ~ group, data = df_long, var.equal = TRUE)

# ---- t test wide
t.test(x = df_wide$group_a, y = df_wide$group_b, var.equal = TRUE)

# ---- t test unequal variance
t.test(x = df_wide$group_a, y = df_wide$group_b)

# ---- kolmogorov–smirnov test
ks.test(df_wide$group_a, df_wide$group_b)

# ---- correlation
cor.test(x = df_wide$group_a, y = df_wide$group_b)
