# blk1 <- matrix(c(0,1,0,1,0,1,0,1,0), 3, 3, byrow = T)
# blk2 <- matrix(c(0,1,0,0,0,0,0,1,1,1,0,1,0,1,0,1,0,0,0,0,0,0,0,1,0), 5, 5, byrow = T)
#
#
# w <- matrix(0,8,8)
# w[1:3,1:3] <- blk1
# w[4:8,4:8] <- blk2
# w <- w /rowSums(w)
# i <- diag(8)
# l <- 0.5
# solve(i- l*w)
# sum(solve(i- l*w))
# sum(diag(solve(i- l*w)))
#
# w1 <- matrix(round(runif(64, 0, 1), digits = 2), 8,8)
# diag(w1) <- 0
# w1 <- w1 /rowSums(w1)
# i <- diag(8)
# l <- 0.5
# solve(i- l*w1)
# sum(solve(i- l*w1))
# sum(diag(solve(i- l*w1)))
