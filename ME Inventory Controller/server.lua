local bridge = peripheral.find("meBridge")
local invManager = peripheral.find("inventoryManager")
local myModem = peripheral.find("modem")
myModem.open(86)
local invList = bridge.listItems()
local rItem = ""
local rCount = 1
 
while true do
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    print("Message recieved!"..message)
    print(message)
    local reqItem = message
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    print("Message recieved!"..message)
    local reqCount = message
    print("reqItem is "..reqItem)
    print("reqCount is "..reqCount)
    for slot,item in pairs(invList) do
        if item.displayName == reqItem then
            rItem = item.name
        end
    end
    rCount = tonumber(reqCount)
    print("rItem is "..rItem)      
    bridge.exportItem({name=rItem, count=rCount}, "north")
    freeSlot = invManager.getFreeSlot()
    invManager.addItemToPlayer("east", {name=rItem, toSlot=freeSlot, count=rCount})
end 