ipfw delete 8810
ipfw delete 8811
ipfw delete 8821
ipfw delete 8822
ipfw delete 8840
ipfw delete 8845

ilan="vlan102"
# UA-IX-in
ipfw add 8810 count ip from table\(1\) to any via vlan86 in

# word-in
ipfw add 8840 count ip from any to any via vlan86 in

ilan="vlan86"
# All-in
#ipfw add 8810 count ip from any to 176.124.138.0/24 via vlan86 in

# All-out
#ipfw add 8181 count ip from 176.124.138.0/24 to any via vlan86 out

# Skip ua-x
#ipfw add 8821 skipto 65000 ip from table\(1\) to any via vlan86 in
#ipfw add 8822 skipto 65000 ip from any to table\(1\) via vlan86 out

# word-in, world-out
#ipfw add 8840 count ip from any to 176.124.138.0/24 via vlan86 in
#ipfw add 8845 count ip from 176.124.138.0/24 to any via vlan86 out

