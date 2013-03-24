# nan ignoring methods

for(nam, func) = ((:nanmax, :max), (:nanmin, :min), (:nansum, :sum),
                   (:nanmean, :mean), (:nanmedian, :median), (:nanvar, :var),
                   (:nanstd, :std), (:nanskewness, :skewness), (:nankurtosis, :kurtosis))
  @eval begin
    function ($nam)(x::Array)
      newa = typeof(x[1])[]
      for i in 1:length(x)
        if x[i] < Inf
        push!(newa, x[i])
      end
    end
    ($func)(newa)
    end
  end
end


#######################################
#######################################
#######################################
#######################################
#######################################

function removeNaN(x::Array)
  newa = typeof(x[1])[]
  for i in 1:length(x)
    if x[i] <= max(x)
      push!(newa, x[i])
    end
  end
  newa
end

# preliminary attempts to create NaN ignoring methods

function removeNaN_sum(x::Array)      
  newa = typeof(x[1])[]
    for i in 1:length(x)
      if x[i] <= max(x)
       push!(newa, x[i])
       end
    end
  sum(newa)
end
function doremoveNaN_sum(x::Array)
  sum(x) do x  
    isnan(x) ? 0 : x  
  end
end
