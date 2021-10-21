You are given a kali attacker box to access remotely.  From there you must access one target then discover another beyond it and pivot through the first target to reach it.  The access methods are fairly simple - it's the networking that is wonky.  It's clear that these targets exist, but why can't you talk to them?  

The initial hint is this: Your first target IP is 192.168.20.3.  Your second target lies beyond it, and is active on the network.  Both are open on common remote administration ports, with unpriviliged user admin, password testing123!

If you need kali tools you can install them, or run this to install all (it's slow, so we give you the choice).
apt update && apt -y install kali-linux-headless

We'll probably make the access methods a little harder once we get the networking piece hammered out.  Maybe add some privesc on each box before gaining root.  

Attackers will initially scan target1 IP and get all ports filtered.  They may ping it and get no response.  The key realization here is that the subnet is not in the routing table.  It must be manually added, and an IP within that subnet added to the appropriate interface, in order to talk to target1.  

In order to reach target2, attackers must first upload pcap utilities and listen to determine which network interface it exists on.  Note that capturing on the "any" pseudointerface is useful but doesn't tell you which interface a packet was seen on.  Once the ARP requests from target2 are identified, it is a similar process as for target1, adding a new route and IP address to reach it.  However, because this one is a /29 rather than /24, proper subnetting must be done to choose an IP to claim.  Target2 also has an IP that is within target2 routable ranges, but this IP is not listening on remote administration ports.  If attackers scan the entire range rather than taking a pcap they may be thrown off by chasing down this wrong IP.  

This challenge highlights a simple misconception - "the port came back filtered so it must be closed" or "no ping response so the device must be down/unreachable, better give up"
You have to know your routing table, and take packet captures to fully understand unusual network behaviors.  

