local bridge = peripheral.find("meBridge")
local invManager = peripheral.find("inventoryManager")
local myModem = peripheral.find("modem")
myModem.open(86)


local rItem = ""
local rCount = 1
 
while true do
    local meList = bridge.listItems()
    local invList = invManager.getItems()
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    print("Command recieved!"..message)
    print(message)
    local reqCommand = message
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    print("Item recieved!"..message)
    print(message)
    local reqItem = message
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    print("Count recieved!"..message)
    local reqCount = message
    print("reqItem is "..reqItem)
    print("reqCount is "..reqCount)
    if reqCommand == "give" then
        for slot,item in pairs(meList) do
            if item.displayName == reqItem then
                rItem = item.name
            end
        end
        rCount = tonumber(reqCount)
        print("rItem is "..rItem)      
        bridge.exportItem({name=rItem, count=rCount}, "north")
        freeSlot = invManager.getFreeSlot()
        invManager.addItemToPlayer("east", {name=rItem, toSlot=freeSlot, count=rCount})
    elseif reqCommand == "recieve"
        for slot,item in pairs(invList) do
            if item.displayName == reqItem then
                rItem = item.name
                local rSlot = tonumber(item.slot)
            end
        
         end
         invManager.removeItemFromPlayer("east", {name=rItem, fromSlot=rSlot, count=rCount})
         bridge.importItem({name=rItem, count=rCount}, "south")
    end

    
end 