local stateLog = false

local function exists(item)
    return table.find(config["catalog"], function(value)
        return value.item == item
    end)
end

function signIn(user, pass)
    if (stateLog == true) then
        return outputChatBox("[ #FF0000Erro#FFFFFF ] - Você já está logado.", 255, 255, 255, true)
    end

    if (user == config.account_admin.user and pass == config.account_admin.pass) then
        outputChatBox("[ #00FF00Sucesso#FFFFFF ] - Você logou como administrador.", 255, 255, 255, true)
        stateLog = true
    else
        outputChatBox("[ #FF0000Erro#FFFFFF ] - Informações incorretas.", 255, 255, 255, true)
    end
end

function cLogOut()
    if (stateLog == true) then
        stateLog = false
        outputChatBox("[ #00FF00Sucesso#FFFFFF ] - Você deslogou com sucesso.", 255, 255, 255, true)
        return
    end
end

function newItemCatalog(item, qtd, price)
    if (stateLog == false) then
        return outputChatBox("[ #FF0000Erro#FFFFFF ] - Você precisa está logado como Administrador.", 255, 255, 255, true)
    end

    if (not item or not qtd or not price)  then
        return outputChatBox("[ #FF0000Erro#FFFFFF ] - Digite [/additem] [quantidade] [preço].", 255, 255, 255, true)
    end

    table.insert(config["catalog"], {item = item, qtd = qtd, price = price})
    outputChatBox("[ #00FF00Sucesso#FFFFFF ] - Você adicionou "..qtd.."x "..item.." por $ "..price.." ao catalogo.", 255, 255, 255, true)
end

function remvItemCatalog(item)
    if (stateLog == false) then
        return outputChatBox("[ #FF0000Erro#FFFFFF ] - Você precisa está logado como Administrador.", 255, 255, 255, true)
    end

    local exists = exists(item)

    if (not exists) then
        return outputChatBox("[ #FF0000Erro#FFFFFF ] - Este item não existe no catalogo.", 255, 255, 255, true)
    end

    table.remove(config["catalog"], exists)
    outputChatBox("[ #00FF00Sucesso#FFFFFF ] - Você removeu o item: "..item..".", 255, 255, 255, true)
    return true
end

function listCatalog()
    local itens = getItens()

    if (itens == 0) then
        return outputChatBox("[ #FFFF00Warning#FFFFFF ] - Lista de itens está vazia.", 255, 255, 255, true)
    end

    outputChatBox("[  #00C0FFlistCatalog #FFFFFF] - Existe #00C0FF"..itens.."#FFFFFF itens no catalogo.", 255, 255, 255, true)
    return true
end