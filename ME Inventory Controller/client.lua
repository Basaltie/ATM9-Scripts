modem = peripheral.find("modem")
local args = {...}
-- args[1] holds item name. args[2] holds item count
modem.open(86)
modem.transmit(86,86,args[1])
sleep(5)
print("The wait is over!")
modem.transmit(86,86,args[2])