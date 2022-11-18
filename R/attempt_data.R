# rm(list=ls())
# library(readr)
# library(Formula)
# library(dplyr)
# ?distinct
# baltim <- read_csv("/Users/gpiras/SpatialRegime/baltimore/baltim.csv")
#
# data = baltim
#
# #spatial weights
# crd <- cbind(baltim$X, baltim$Y)
# knn4 <- spdep::knearneigh(crd, k=4)
# wmat <- sphet::listw2dgCMatrix(spdep::nb2listw(spdep::knn2nb(knn4)))
# splitv = ~ baltim$CITCOU
# form = PRICE  ~ NROOM + NBATH + PATIO + FIREPL +AC + GAR + AGE +LOTSZ +SQFT
# fom <- PRICE  ~  NROOM + NBATH +PATIO + FIREPL +AC + GAR + AGE +LOTSZ +SQFT
# formula <- fom
#
#
#
# splitvar <- as.matrix(lm(splitv, data, method="model.frame"))
# sv <- length(unique(splitvar))
# nobsg <- table(splitvar)
# csnobsg <- cumsum(nobsg)
# cnt <-  c(1,table(splitvar)+1)[-(sv+1)]
#
# f1 <- Formula(formula)
# mt <- terms(f1, data = data)
# mf1 <- model.frame(f1, data = data)
# mf1 <- mf1[order(splitvar),]
#
# y <- model.response(mf1)
# names(y) <- "y"
#
# if(length(f1)[2L] == 2L){
#   x1 <- model.matrix(f1, data = mf1, rhs = 1)
#   namesx1 <- colnames(x1)
#   x2 <- model.matrix(f1, data = mf1, rhs = 2)
#   n <- dim(x1)[1]
#   k1 <- dim(x1)[2]
#   k2 <- dim(x2)[2]
#   namesx <- colnames(x2)
#   namesxr <- paste(namesx,rep(1:sv,each = k2), sep = "_")
#   totr <- sv*k2
#   k <- k1 + totr
#   xr <- matrix(0, ncol = totr, nrow = n)
#   seq_1 <- seq(1, totr, k2)
#   seq_2 <- seq(k2, totr,  k2)
#   for(i in 1:length(nobsg))
#     xr[(cnt[i]:csnobsg[i]),seq_1[i]:seq_2[i]] <- x2[(cnt[i]):csnobsg[i], ]
#     x <- data.frame(x1,xr)
#     colnames(x) <- c(namesx1, namesxr)
#     data <- data.frame(y,x)
#     form <- as.formula(paste("y ~", paste(names(data)[2:(k+1)], collapse =  " + "), "-1"))
# }
# else{
#   x <- model.matrix(f1, data = mf1, rhs = 1)
#   n <- dim(x)[1]
#   k <- dim(x)[2]
#   namesx <- colnames(x)
#   namesxr <- paste(namesx,rep(1:sv,each = k), sep = "_")
#   totr <- sv*k
#   xr <- matrix(0, ncol = totr, nrow = n)
#   seq_1 <- seq(1, totr, k)
#   seq_2 <- seq(k, totr,  k)
#   for(i in 1:length(nobsg))
#     xr[(cnt[i]:csnobsg[i]),seq_1[i]:seq_2[i]] <- x[(cnt[i]):csnobsg[i], ]
#   x <- data.frame(xr)
#   colnames(x) <- c(namesxr)
#   data <- data.frame(y,x)
# if("(Intercept)" %in% namesx)  form <- as.formula(paste("y ~", paste(names(data)[2:(totr+1)], collapse =  " + "), "-1"))
# else form <- as.formula(paste("y ~", paste(names(data)[2:(totr+1)], collapse =  " + ")))
# }
#
#
#
# res <- lm(form, data = data )
# summary(res)
# vcov(res)
#
#
#
#
