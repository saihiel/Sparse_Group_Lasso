install.packages("pls")
install.packages("grplasso")
install.packages("glmnet")
install.packages("SGL")

library("glmnet")
library("SGL")
library("pls")


propsG <- array(0, c(2,3))
propsL <- array(0, c(2,3))


np <- c(100,400)
lp <- c(50,100)
n <- c(150,200)

groups <- c(1,2,3)

set.seed(100)

qq <- system.time(

for(ii in 1:2){
  for(jj in 1:3)
  {
		p <- rep(lp[ii], np[ii])

		index <- rep(1,p[1])
		index1 <- rep(1,p[1])
		for(i in 2:np[ii]){
		  index <- c(index, rep(i,p[i]))
		  index1 <- c(index1, rep(1,p[i]))
		}

		X <- matrix(rnorm(n[ii]*p[1]), nrow = n[ii])

		for(i in 2:np[ii]){
		  X <- cbind(X, X <- matrix(rnorm(n[ii]*p[i]), nrow = n[ii]))
		}

		X <- stdize(X)

		eta <- 0
		correct <- NULL
		for(i in 1:groups[jj]){
		  eta <- eta + X[,1:5 + (i-1)*lp[ii]]%*%(1:5)
		  correct <- c(correct, 1:5+(i-1)*lp[ii])
		}

		eta <- stdize(eta)

		y <- eta + 0.5*rnorm(n[ii])


		data <- list(x = X, y = y)

		ww <- glmnet(X,y, family = "gaussian", nlam = 1000)

		nonZeroL <- apply(ww$beta, 2, function(x){sum(x!=0)})
		firstIndL <- min(which(nonZeroL >= 5*groups[jj]))

		propCorrectL <- length(intersect(correct,which(ww$beta[,firstIndL] != 0)))/nonZeroL[firstIndL]

		aa <- findNum(data, index, alpha = 0.95, num = groups[jj] * 5, del = 0.9)

		propCorrectG <- length(intersect(correct,which(aa != 0)))/length(which(aa!=0))

		propsG[ii,jj] <- propCorrectG
		propsL[ii,jj] <- propCorrectL

		write(c(ii,jj),"")

	}
})

pcG <- apply(propsG,c(1,2),mean)
pcL <- apply(propsL,c(1,2),mean)
pcG
pcL



