# DCMTK/SSL issue with latest version

I had some DCMTK client code that worked when compiling against Debian Stretch, but broker against Debian Buster.

When I wrote the client code, I found a suitable command pair from dcmtk that enabled tls. That command was:

```bash
storescp --log-level trace --enable-tls /work/domain.key /work/domain.crt -ic 104
echoscu +tla -ic localhost 104
```

When I got this working, I looked at ```echoscu```'s source code and did exactly the same TLS setup in my client code. And all was great.

But then, after compiling against dcmtk 3.6.4 (Debian Buster), my client code broke.

I ran the two commands above again, and now I was getting connection issues.

If I can establish a client-side command that works, I can re-work my dcmtk client code to minimick exactly what ```echoscu``` is doing as of 3.6.4. But I can't...

Running the above commands, I get this error on Debian Buster (dcmtk 3.6.4):

```
E: ETLS client handshake failed: 
Receiving Association failed: 0006:031e DUL secure transport layer: no suitable signature algorithm
F: Association Request Failed: 0006:031b Failed to establish association
F: 0006:0317 Peer aborted Association (or never connected)
F: 0006:031e DUL secure transport layer: sslv3 alert handshake failure
```

The full logs can be found here: [Stretch](./stretch.log) and [Buster](./buster.log)

You can test this yourself by running either ```./buster.sh``` or ```./stretch.sh```. Update ```./run.sh``` to fiddle with the ```echoscu``` parameters between runs.
