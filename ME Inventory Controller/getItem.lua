modem = peripheral.find("modem")
local args = {...}
-- args[1] holds item name. args[2] holds item count
modem.open(86)
print("Transmitting...")
modem.transmit(86,86,"give")
sleep(5)
print("Transmitting...")
modem.transmit(86,86,args[2])
print("Transmitting...")
modem.transmit(86,86,args[3])