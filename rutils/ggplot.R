source('https://raw.githubusercontent.com/RealAshrafAhmed/games/main/rutils/fun.R')

heatmap <- function(data) {
  g <- ggplot(data=data, aes(x=x, y=t)) + 
    geom_raster(aes(fill=f)) + scale_fill_distiller(palette="Spectral")
  return(g)
}


eval_together <- function(tlimit=c(0,10), dt = 0.05, xlimit=c(-2,10), dx=0.1, theta_init_seq, fun){
  grid_df = expand.grid(t=seq(tlimit[1], tlimit[2], dt), x=seq(xlimit[1], xlimit[2], dx))
  grid_df$f = apply(grid_df, 1, fun_zero)
  
  for(theta_init_index in seq(1, dim(theta_init_seq)[2])) {
    theta_init = theta_init_seq[,theta_init_index]
    grid_df$f = grid_df$f + apply(grid_df, 1, fun_eval(fun(theta_init=theta_init)))
  }
  
  return(grid_df)
}