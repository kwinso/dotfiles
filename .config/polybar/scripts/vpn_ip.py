from netifaces import AF_INET
import netifaces as ni
import subprocess

try:
    subprocess.check_output("pgrep openvpn", shell=True)
    vpn_running = True
    vpn_iface = ni.ifaddresses("tun0")
except:
    vpn_running = False



if vpn_running and vpn_iface:
    ip = ni.ifaddresses('tun0')[AF_INET][0]["addr"]
    print("VPN: ", ip)
else:
    print("VPN: none")
