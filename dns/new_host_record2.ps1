#creating a new dns record with PTR (Reverse Lookup Zone mst be enable)
dnscmd dc1 /recordadd jcloud.com ws3 /createptr A 192.168.1.145

#creating a new dns record without PTR 
dnscmd dc1 /recordadd jcloud.com ws5 A 192.168.1.147
