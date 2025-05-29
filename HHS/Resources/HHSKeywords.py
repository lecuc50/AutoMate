from testmate.Devices.DL_HHS import DL_HHS
from testmate.Lbl_Displayer import LBL_DISPLAYER
from testmate.General_Purpose import GENERAL_PURPOSE
from testmate.Devices import GENERIC_SERIAL_DUT
import TimeoutSeting
from robot.api.deco import keyword
import time

ROBOT_LIBRARY_SCOPE = 'GLOBAL'
COM_Interface = {'RS232_STD','RS232_WN','RS232_OPOS','USB_COM','USB_CPS'}

hhs = DL_HHS()
display = LBL_DISPLAYER.LBL_DISPLAYER(displayer_type='lcd')
interface_name = 'RS232_STD'

@keyword
def init_connection(device='hhs', interface='RS232_STD_PEGASUS', com='COM2'):
    interface_name = interface
    data = hhs.DL_INIT_DEVICE(device, interface, com)
    data = "Init " + device + " " + str(data) + " " + hhs.DL_OPEN()
    return data


@keyword
def enter_service_port():
    data = hhs.DL_ENTER_SERVICE_MODE()
    return data


@keyword
def exit_service_port():
    data = hhs.DL_EXIT_SERVICE_MODE()
    return data


@keyword
def send_command(command):
    data = hhs.DL_SEND_CUSTOM_COMMAND(command, TimeoutSeting.write_command_timeout)
    if 'Ar' or 'R' in command:
        time.sleep(TimeoutSeting.wait_device_reset)
    return data

@keyword
def read_label(path_file, file_name):
    full_file = path_file + "\\" + file_name + ".jpg"
    try:
        #GENERIC_SERIAL_DUT.DUT_FLUSH_DATA()
        display.DISPLAY_IMG(full_file)
        time.sleep(TimeoutSeting.wait_to_read_label)
        respond = hhs.DL_GET_DATA(TimeoutSeting.wait_to_read_label)
        #respond = hhs.DL_TRIGGER()
        display.CLOSE_IMG()
        return respond
    except:
        pass

@keyword
def set_reading_mode(reading_mode):
    if interface_name in COM_Interface:
        respond= send_command('$S,'+ reading_mode +',Ar')
        time.sleep(TimeoutSeting.wait_device_reset)
        return respond
    else:
        read_label("$P," + reading_mode + ',P')
        return 0

@keyword
def get_firmware_version():
    respond = hhs.DL_GET_FIRMWARE_VERSION()
    return respond
@keyword
def get_testmate_release():
    respond = GENERAL_PURPOSE.GET_TESTMATE_VERSION()
    return respond

@keyword
def close():
    hhs.DL_CLOSE



"""
if __name__ == "__main__":
    init_connection('hhs','USB_COM','COM6')
    enter_service_port()
    exit_service_port()
    path = "C:\\Cong Viec\\Demo\\hhsautomation\\Data\\ULE"
    a = read_label(path,'Code128_ABCabc')
    print(a)"""

# read_label("D:\\task\\HHSAutomation\\Data\\","Code128_ABCabc")

# if __name__ == "__main__":
#     read_label("D:\\image001.png")

"""from time import sleep
# from multiprocessing import Process, Pool
# from testmate.General_Purpose import GENERAL_PURPOSE as GEP
# rom testmate.Lbl_Displayer import LBL_DISPLAYER as LBD

if __name__ == '__main__':
    # a = GEP.GET_TESTMATE_VERSION()
    try:
        # b = LBD.LBL_DISPLAYER()
        display.DISPLAY_IMG("D:\\image001.png")
        time.sleep(3)
        display.CLOSE_IMG()
    except:
        pass"""


"""
pathfile = "D:\\image001.png"
read_label(pathfile)

data = open_connection()
print(data)
data = enter_service_port()
print(data)
data = send_command('$CABEN01')
print(data)
data = exit_service_port()
print(data)"""