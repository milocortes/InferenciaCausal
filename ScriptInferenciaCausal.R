# clear workspace
rm(list = ls(all = TRUE)) 

# Cargamos las librer?as

library(pcalg)
library(graph)

##### Definimos nuestro diagrama causal

# ED=1,REG=2,IP=3,IND=4,CSP=5,O=6,AI=7,P=8,HP=9,PS=10, PRS=11,AP=12

causal_graph <- new("graphNEL", nodes=c("1", "2","3","4","5","6","7","8","9","10","11","12"), edgemode="directed")

causal_graph<-addEdge("1","3",causal_graph,1)
causal_graph<-addEdge("1","6",causal_graph,1)
causal_graph<-addEdge("1","12",causal_graph,1)
causal_graph<-addEdge("2","1",causal_graph,1)
causal_graph<-addEdge("2","6",causal_graph,1)
causal_graph<-addEdge("2","4",causal_graph,1)
causal_graph<-addEdge("2","5",causal_graph,1)
causal_graph<-addEdge("2","3",causal_graph,1)
causal_graph<-addEdge("2","8",causal_graph,1)
causal_graph<-addEdge("6","11",causal_graph,1)
causal_graph<-addEdge("6","10",causal_graph,1)
causal_graph<-addEdge("6","9",causal_graph,1)
causal_graph<-addEdge("6","7",causal_graph,1)
causal_graph<-addEdge("6","8",causal_graph,1)
causal_graph<-addEdge("4","6",causal_graph,1)
causal_graph<-addEdge("4","8",causal_graph,1)
causal_graph<-addEdge("7","8",causal_graph,1)
causal_graph<-addEdge("9","10",causal_graph,1)
causal_graph<-addEdge("9","8",causal_graph,1)
causal_graph<-addEdge("10","8",causal_graph,1)
causal_graph<-addEdge("11","8",causal_graph,1)
causal_graph<-addEdge("5","8",causal_graph,1)
causal_graph<-addEdge("5","3",causal_graph,1)
causal_graph<-addEdge("3","8",causal_graph,1)
causal_graph<-addEdge("3","12",causal_graph,1)
causal_graph<-addEdge("12","8",causal_graph,1)

## Visualizamos el diagrama
plot(causal_graph)

## Extraemos la matriz de adyacencia de nuestro diagrama que cumple con ser un DAG
true.amat <- (amat <- as(causal_graph, "matrix")) != 0 # TRUE/FALSE <==> 1/0
print.table(1*true.amat, zero.=".") # "visualization"

## Calculamos el critetio back-door:
backdoor(true.amat, 6, 8, type="dag")
