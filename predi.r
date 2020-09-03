#!/usr/local/bin/rscript

setwd('~/Programmation/R/')
obj <- load('./athle.RData')

print(obj)     # length names

tf = tailleF       
pf = performanceF  
tg = tailleG       
pg = performanceG  

ntf = names(tf)   # 23
npf = names(pf)   # 26
ntg = names(tg)   # 23
npg = names(pg)   # 24

# Switching x and y leads to different result (order or length)!
uf = union(ntf, npf)        # 28
ug = union(ntg, npg)        # 27
cf = intersect(ntf, npf)    # 21
cg = intersect(ntg, npg)    # 20
df = setdiff(ntf, npf)      # 2    (5)
dg = setdiff(ntg, npg)      # 3    (4)
iF = ntf %in% npf           # 23   (26)
ig = ntg %in% npg           # 23   (24)

tf2 = tf[cf]
pf2 = pf[cf]
tg2 = tg[cg]
pg2 = pg[cg]

of = order(tf2)   # sort
og = order(tg2)

tf3 = tf2[of]
pf3 = pf2[of]
tg3 = tg2[og]
pg3 = pg2[og]

cor(tf3, pf3)
cor(tg3, pg3)

lm(pf3 ~ tf3)   # y ~ ax + b
lm(pg3 ~ tg3)

cor.test(tf3, pf3)
cor.test(tg3, pg3)

wilcox.test(pg3, pf3)
