# baltim <- read_csv("/users/gpiras/R dev libraries/SpatialRegime/baltimore/baltim.csv")
# nbB <- spdep::read.gal("/users/gpiras/R dev libraries/SpatialRegime/baltimore/baltimore.gal")
# listw1 <- spdep::nb2listw(nbB, style = "W")
# mod1 <- lm(PRICE  ~ AC + AGE + NROOM + PATIO + FIREPL + SQFT + NBATH + GAR + LOTSZ, data = baltim)
# summary(mod1)
# spdep::lm.LMtests(mod1, listw1, test = "all")
#
#
#
#
# form <- PRICE  ~ AC + AGE + NROOM + PATIO + FIREPL + SQFT |
#   NBATH + GAR + LOTSZ - 1
#
# gr1 <- ifelse(baltim$CITCOU == 0, 1, 0)
# gr2 <- ifelse(baltim$CITCOU == 0, 0, 1)
#
# nb1 <- baltim$NBATH * gr1
# nb2 <- baltim$NBATH * gr2
#
# gar1 <- baltim$GAR * gr1
# gar2 <- baltim$GAR * gr2
#
# lt1 <- baltim$LOTSZ * gr1
# lt2 <- baltim$LOTSZ * gr2
#
# mod <- lm(PRICE  ~ AC + AGE + NROOM + PATIO + FIREPL + SQFT + nb1 + nb2 + gar1 + gar2 + lt1 + lt2, data = baltim)
# summary(mod)
# spdep::lm.LMtests(mod, listw1, test = "all")
#
# sigma_1 <- crossprod(residuals(mod)*gr1)/(sum(gr1) - 13)
# sigma_2 <- crossprod(residuals(mod)*gr2)/(sum(gr2) - 13)
# sigma <-  1/(as.numeric(sigma_1) * gr1 + as.numeric(sigma_2) * gr2)
# res <-  lm(PRICE  ~ AC + AGE + NROOM + PATIO + FIREPL + SQFT + nb1 + nb2 + gar1 + gar2 + lt1 + lt2, data = baltim, weights = sigma)
# summary(res)
# residuals(res)
# spdep::lm.LMtests(res, listw1, test = "all")
#
#
# mod <- lm(PRICE  ~ AC + AGE + NROOM + PATIO + FIREPL + SQFT + NBATH + GAR + LOTSZ, data = baltim)
# summary(mod)
# spdep::lm.LMtests(mod, listw1
#                   , test = "all")

# data <- read_csv("/users/gpiras/R dev libraries/SpatialRegime/baltimore/baltim.csv")
# formula <- PRICE ~ NROOM + NBATH + LOTSZ -1 |  PATIO + FIREPL + AGE   |  NROOM + NBATH -1 |GAR + SQFT + AC  + PATIO + FIREPL
# rgv = ~ CITCOU
# mod1 <- ivregimes(formula, data, rgv, vc = "classical")
# summary(mod1)
#########################
########### iv reg #######
# library(readr)
# library(Formula)
# library(dplyr)
# library(sf)
# library(rgeos)
# library(rgdal)
# data <- read_csv("/users/gpiras/R dev libraries/SpatialRegime/baltimore/baltim.csv")
#
# rgv = ~ CITCOU
# formula <- PRICE ~ NROOM + NBATH + LOTSZ |  PATIO + FIREPL + AGE  -1 |  NROOM + NBATH|GAR + SQFT + AC  + PATIO + FIREPL
#
#
# HpH <- crossprod(Hmat)
# HpHi <- solve(HpH)
# Zp <- Hmat %*%crossprod(HpHi, crossprod(Hmat,Zmat))
# solve(crossprod(Zp), crossprod(Zp,y))
