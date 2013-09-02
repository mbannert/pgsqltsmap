setMethod("initialize","metalocalized",function(.Object,li){
  stopifnot(is.list(li))
  if(length(names(li)) == 0) warning ("List does not contain names.")
  
  .Object@nms <- names(li)
  .Object@.Data <- li
  .Object
  })
