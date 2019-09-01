# LosOce_TA
Los Oceanic - Traffic Adjust, Automated deductions based on player count. [38.80% to 10.00%]


### Hypothosis

Using Cron;
Setting an event trigger every five minutes, 
To issue a command for the client to get all active players,
To deduct the overall AI population/density based on a player count.


## Prerequisites

* essentailmode
* es_extended
* LosOce_Cron

As with all thing ESX, please ensure you have loaded your essentialmode and es_extended in the correct order.
From there you need to make sure my little rendition of Cron is running as it uses a 12 hour system, not 24.

```
start LosOce_Cron
...

start essentialmode
...

start es_extended
...

start LosOce_TA
```

**Note: This particular script doesnt actually need ESX. I just have it there by default.**


## The Config.lua

The only place you should need to edit: *unless you want to modify the entire thing to your liking.*

To refine the traffic down to a manageable level, I have used **1000** as the divider, the default for the natives to be called is 1.0, no traffic is 0.0 and double is 2.0.

Based on this I wanted to start at around 40% normal density and scale it down to a manageable 10% when a server is full.

```
Config.TrafficX     = 388   -- 100  -- Do not let the over all calculation 
Config.PedestrianX  = 493   -- 205  -- make this 0 or below, or else you 
Config.ParkedX      = 488   -- 200  -- will suffer a fate far worse 
Config.Divider      = 1000  --      -- than having no bananas... RIP
Config.iPlayers     = 0     --      -- See Client.Lua for the Calculation.
Config.Static       = 2.25  --      -- I believe 2.25 will be ideal for 128 slots. (-288)
Config.Dispatch     = false --      -- Or True???
```
So in this case, *388* would become *0.388*.

Note: Do not let the overall final number be below 0.0!


## License

This project is licensed under the GNU v3.0 License - see the [LICENSE.md](LICENSE) file for details


## Acknowledgments

* [ESX-Org/cron](https://github.com/ESX-Org/cron) - All Contributers
