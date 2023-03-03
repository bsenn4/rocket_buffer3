addCommandHandler("clog", function(_, user, pass)
    signIn(user, pass)
end)

addCommandHandler("clogout", function()
    cLogOut()
end)

addCommandHandler("additem", function(_, item, qtd, price)
    newItemCatalog(item, qtd, price)
end)

addCommandHandler("remvitem", function(_, item)
    remvItemCatalog(item)
end)

addCommandHandler("listcatalog", function()
    listCatalog()
end)