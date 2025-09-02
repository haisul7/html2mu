unsigned.io`Ffff`B222`[ Home `:/page/web.mu`url=https://unsigned.io/../index.html]`b`f | `Ffff`B222`[ Log `:/page/web.mu`url=https://unsigned.io/../log.html]`b`f | `Ffff`B222`[ Guides `:/page/web.mu`url=https://unsigned.io/../guides.html]`b`f | `Ffff`B222`[ Software `:/page/web.mu`url=https://unsigned.io/../software/index.html]`b`f | `Ffff`B222`[ Hardware `:/page/web.mu`url=https://unsigned.io/../hardware/index.html]`b`f | `Ffff`B222`[ Discussions `:/page/web.mu`url=https://github.com/markqvist/Reticulum/discussions]`b`f | `Ffff`B222`[ Shop `:/page/web.mu`url=https://unsigned.io/../shop.html]`b`f | `Ffff`B222`[ Contact Me `:/page/web.mu`url=https://unsigned.io/../contact.html]`b`f | `Ffff`B222`[ Donate `:/page/web.mu`url=https://unsigned.io/../donate.html]`b`f

-

>>> One Year Over

Today, I've released version `=0.9.5`= of Reticulum. This marks the beginning of the very final stretch for the beta phase of Reticulum. About a year ago, I wrote `Ffff`B222`[ a post `:/page/web.mu`url=https://unsigned.io/../articles/2024_05_16_Are_We_There_Yet.html]`b`f talking about the status of Reticulum, the journey so far, how my work on Reticulum was funded, and my thoughts about the future of the project. If you haven't already read it, I encourage you to do so, since it provides necessary context for this post.

Back then, I also announced that the amount of resources I had allocated to developing Reticulum full-time had been exhausted, and that some sort of sustainable funding would need to be acquired if I were to continue to work full-time on Reticulum in the same manner I had done for the past four years.

That `*did`* initially increase the amount of donations a bit, but currently, the recurring donations total â¬96 per month, and I have received on average â¬320 per month in community donations for this past year, with most stemming from single donations. I appreciate all of this so much, and I am very grateful to each and everyone who has believed enough in this to contribute. Thank you so much!

`Ffff`B222`[  `:/page/web.mu`url=https://unsigned.io/../images/ph_sl.webp]`b`fRealistically though, this is not a sustainable way to live, and the primary reason I was able to squeeze in another full year of work, improvements and fast-paced updates was:

`!1)`! Almost inconceivable patience and support from my family and close friends who, for some reason, decided to bear with me for another year, and make sure I was able to carry out the work. I couldn't have done it without this.

`!2)`! One single individual who came forward and covered most of my costs for this time. If you're reading this, thank you. It made all of the below possible, and I hope you find it valuable and worthwhile, in the context of what has been achieved.

The overall result is that version `=1.0.0`= of Reticulum is now closer than ever, and on the horizon for release this year, most likely in July. It's about time. Reticulum has been in beta for `*four years`*, and the project has benefited tremendously from this approach. But it already is (and for a long time has been) much more stable, functional and full-featured than other projects covering just parts of what Reticulum provides, and it even does it in much more general-purpose and robust ways.

To complete the final stretch though, I will have to be realistic about a few things. But before going into details on those, let's have a look at what one year of work on Reticulum has actually yielded.

>>> One Year Of Progress

In the previous status post, I said that I would focus more tightly on the core parts of the project, which is what I really excel at, and that is what I have tried to do. I think the results speak for themselves.

I won't go into a free-form description of every single thing that has been accomplished, since that would make this a very long post, but just a few of the highlights include:

* Massive performance and memory optimizations
* Much faster I/O backend
* Significantly expanded hardware support
* Complete interface modularity
* Migrating to AES-256 encryption for all communication
* A new real-time voice protocol for Reticulum
* Much higher capacity for LXMF propagation networks
* Significant improvements to overall usability and utilities
* A long list of bugs fixed, and real-world usability improvements

I want to point out, that much of this stuff is not just "writing the code". An equal amount of time, if not more, goes into the design and especially testing and verification of everything implemented. A testament to that is how stable and reliable Reticulum already is.

To get an idea of the scope of work carried out in this past year, please expand this aggregated changelog of work, and just give it a quick glance:

`!Changelog`!

* RNS

+ Significantly improved memory utilisation, thread count and performance on nodes with many interfaces or clients
+ Switched local instance communication to run over abstract domain sockets on Linux and Android
+ Switched instance IPC to run over abstract domain sockets on Linux and Android
+ Added support for AES-256 as the default link and packet encryption mode
+ Added kernel event based I/O backend on Linux and Android
+ Added fast BackboneInterface type
+ Added support for XIAO-ESP32S3 to rnodeconf
+ Added interactive shell option to rnsd
+ Added API option to search for identity by identity hash
+ Added option to run TCP and Backbone interfaces in AP mode
+ Added dynamic link keepalive and timeout calculation
+ Added ability to efficiently transfer files as responses in the Request API
+ Added ability to include metadata on Resource transfers
+ Added option to specify Resource auto-compression limits
+ Added option to specify Request response auto-compression limits
+ Added allow overwrite option to rncp
+ Added support for AES-256 mode to links and packets
+ Added dynamic link mode support
+ Added get_mode() method to link API
+ Added instance_name option and description to default config file
+ Improved RNodeMultiInterface host communications specification
+ Improved rncp statistics output
+ Improved link and reverse-table culling
+ Improved hardware MTU auto-configuration
+ Improved handling of file transfers using the Resource API
+ Improved Resource transfer memory consumption
+ Improved memory consumption of applications connected to a shared instance
+ Improved ratchet persist reliability if Reticulum is force killed while persisting ratchets
+ Improved rncp memory consumption for large files
+ Fixed an occasional I/O thread hang on instance shutdown, that would result in an error printed to the console
+ Fixed announce handlers not triggering after shared instance disappearance
+ Fixed various minor interface logging inconsistencies
+ Fixed various minor interface checking inconsistencies
+ Fixed interface string representation for some interfaces
+ Fixed instance name config option being overwritten if option was not last in section
+ Fixed unhandled potential exception on fast-flapping BackboneInterface connections
+ Updated internal configobj implementation
+ Refactored various parts of the transport core code
+ Swicthed to using internal netinfo implementation instead of including full ifaddr library
+ Cleaned out unneeded dependencies
+ Enabled link MTU discovery by default
+ Added on-demand object code compilation and loader shim
+ Added link API methods
+ Added child interface spawning for AutoInterface
+ Fixed corrupt ratchet files not being removed on maintenance cleaning
+ Fixed rnid not waiting for announce timebase tick before announcing
+ Fixed missing RX/TX bytes statistics assignment
+ Fixed potential daemon thread IO buffer deadlock on externally mediated shutdown signal
+ Fixed missing check for path announce emission timestamp in lower hop-count announce processing
+ Added resource reject signalling
+ Added error reporting on configured radio parameter mismatch on Android
+ Improved thread configuration for transport core threads
+ Updated examples
+ Added MTU autoconfiguration on interfaces that support higher MTUs
+ Added link MTU autodiscovery and path clamping
+ Added dynamic SDU calculations based on link MTU to Resource, Channel and Buffer
+ Added resource EIFR continuity to split resource handling
+ Added interference status to RNodeInterface
+ Fixed a display bug in rnstatus
+ Added live traffic stats to rnstatus
+ Added T3S3 support to rnodeconf
+ Added Heltec T114 support to rnodeconf
+ Added LilyGO T-Echo support to rnodeconf
+ Added option to print device configuration to rnodeconf
+ Improved CPU utilisation and memory consumption
+ Improved rnsd restart time on systems with many interfaces
+ Improved rncp status output
+ Improved packet filter performance
+ Improved interface detachment handling
+ Improved resource transfer timing and performance
+ Improved Transport core efficiency
+ Improved reliability of ratchet reloads if I/O conflicts occur
+ Improved logging
+ Improved built-in profiler
+ Fixed a potential deadlock in logging
+ Fixed time formatters not handling negative times
+ Updated example code
+ Added noise floor output to rnstatus for supported interfaces
+ Added channel noise floor and CSMA parameter reporting to RNodeInterface
+ Added ability to set display rotation in rnodeconf
+ Added ability to configure interference avoidance to rnodeconf
+ Fixed missing console image install on Heltec V3 in rnodeconf
+ Allow announce handlers to receive announce packet hash
+ Fix packet RSSI/SNR/Q cache not being available on standalone instances
+ Added support for packaging RNS to OpenWRT
+ Added ability to run rnstatus as application-local imported module
+ Added ability to reflect RNS log output to app-internal log handler callback
+ Added display read functionality to RNodeInterface
+ Fixed a regression in RNodeMultiInterface caused by earlier refactoring
+ Imrpoved documentation
+ Added ability to load and configure custom, user-supplied interfaces
+ Added IPv6 support to TCPClientInterface and TCPServerInterface
+ Added an init option to the API for requiring an existing shared instance
+ Changed rnstatus behaviour to only show status if Reticulum is already running
+ Fixed KISSInterface beacon length for compatibility with software modems
+ Fixed interface client count sometimes reporting incorrect values on TCP and I2P interfaces
+ Refactored and improved interface initialisation and configuration handling
+ Refactored interface code to be more consistent
+ Refactored various deprecated references and names
+ Updated documentation and manual
+ Fixed missing close of file handles
+ Fixed invalid values returned from get_snr() and get_q() physical layer stats API functions
+ Improved RNode BLE reconnection realiability
+ Added RNode battery state to rnstatus output
+ Fixed resource transfer hanging for a long time over slow links if proof packet is lost
+ Fixed missing import on Android
+ Fixed a bug in resource transfer progress calculations
+ Added physical layer transfer rate output option to rncp
+ Added save directory option to rncp
+ Improved path handling for the fetch-jail option of of rncp
+ Added error detection for modem communication timeouts on connected RNode devices
+ Added support for T-Beam Supreme devices to rnodeconf
+ Added support for T3S3 devices to rnodeconf
+ Added support for T-Deck devices to rnodeconf
+ Added support for new hardware error codes from connected RNodes
+ Added the ability to control the display on nRF52-based RNodes
+ Improved resource transfers over very slow links, by adding more suitable MAX_WINDOW cap if link speed is continously below threshold.
+ Improved rnodeconf flashing so manual resets for some devices are no longer required
+ Added edge case handling for receiving a link proof after the link had timed out and been closed, but before it having been purged from active links table
+ Updated supported hardware section of the manual with new boards
+ Tuned path request timing for roaming instances
+ Fixed a bug that caused RNS to fail to initialise in Termux on Android
+ Fixed a bug in RNodeInterface firmware version comparison
+ Fixed a bug in the serial framing of RNodeMultiInterface
+ Fixed a bug in sub-interface spawning of RNodeMultiInterface
+ Added Bluetooth Low Energy support to RNodeInterface
+ Added RNode battery information to rnstatus output
+ Added display blanking configuration to rnodeconf
+ Added NeoPixel intensity configuration to rnodeconf
+ Added additional information to interface statistics
+ Updated documentation
+ Added handling of a transport edge-case
+ Added interface prioritisation according to reported bitrate
+ Added support for openCom XL to rnodeconf
+ Added performance profiler to built-in debugging tools
+ Tuned link traffic timeouts
+ Fixed a module import error in AX25KissInterface
+ Fixed a missing exception on erroneous destination initialisation
+ Added key ratchet rotation and signalling
+ Added ratchet API to documentation
+ Added initial support for flashing T-Echo devices to rnodeconf
+ Added remote management config options to example config
+ Added automtic integration tests to source repository
+ Fixed a regression that caused RNS not to work on Python versions lower than 3.10
+ Fixed missing establishment_rate property init on Link objects
+ Added support for RNode Multi interfaces
+ Added initial support for remote management of Reticulum instances
+ Improved resource transfer performance for large resources
+ Improved path rediscovery in topologies with roaming transport nodes
+ Fixed incorrect TX power limit on Android RNode interfaces
+ Added ability to fetch remote files to rncp
+ Added fetch request jail option to rncp
+ Improved rncp status display output
+ Added link table statistics to rnstatus
+ Fixed rnstatus JSON output bug when IFAC was enabled on an interface
+ Added remote instance interface status to rnstatus
+ Added ability to query path- and rate-tables on remote instances with rnpath
+ Added JSON output option to rnpath utility
+ Added max hops filter to rnpath path-table out
+ Added link age getter to API
+ Added request concluded status to API
+ Fixed invalid resource progress reported in some cases
+ Fixed rnodeconf failure to set firmware hash for NRF52 boards on macOS
+ Fixed broken --rom command line option in rnodeconf
+ Fixed various typos in documentation
+ Updated documentation with new API functions and features
+ Added support for AutoInterface on Windows
+ Added support for recursive path resolution for clients on roaming-mode interfaces
+ Added RAK4631 support to rnodeconf
+ Added LilyGO T3S3 support to rnodeconf
+ Added ability to get target and calculated hashes via rnodeconf
+ Fixed DTR timing making flashing fail on Windows in rnodeconf
+ Fixed various output and menu bugs in rnodeconf
+ Added support for flashing and autoinstalling Heltec V3 boards to rnodeconf
+ Added custom EEPROM bootstrapping capabilities to rnodeconf
+ Added ability to load identities from file to Echo and Link examples
+ Added ability to specify multicast address type in AutoInterface configuration
+ Added link getter to resource advertisement class
+ Improved path response logic and timing
+ Improved path request timing
+ Fixed a bug in Link Request proof delivery on unknown hop count paths
+ Fixed broken link packet routing in topologies where transport packets leak to non-intended instances in the link chain
+ Fixed typos in documentation

* LXMF

+ Improved memory consumption for propagation nodes
+ Improved propagation node sync efficiency by sorting peers according to STR
+ Improved handling of message queues for peers with low transfer limits
+ Redesigned peer rotation to be much faster and more responsive to real-time network conditions
+ Added ability to cancel outbound messages
+ Added message rejection signalling if message exceeds transfer limit
+ Added sync transfer rate to propagation node peer stats
+ Added handling of corrupted transient ID cache
+ Added ability to configure static peers
+ Added ability to specify maximum number of peers
+ Added lxmd status query API function
+ Fixed a potential division by zero bug
+ Added options to the default configuration file
+ Added message ingest API option
+ Improved duplicate message detection over longer timeframes
+ Added propagation node announce data validation to announce handler
+ Fixed missing byteorder argument on stamp value calculation
+ Fixed incorrect progress value on path waiting for outbound messages
+ Fixed a bug in inbound ticket cleaning
+ Fixed a bug that could cause propagation node peer destinations to be created before identity was resolved
+ Fixed a bug that could cause existing propagation node links to be torn down if the propagation node address was updated with the same address
+ Improved opportunistic delivery performance
+ Added path rediscovery during opportunistic delivery if path fails
+ Added backchannel delivery over already established links
+ Improved opportunistic delivery logic and performance
+ Improved logging
+ Fixed a bug in the stamp cost extractor function
+ Fixed a bug that would prevent running multiple LXMRouter instances within the same program.
+ Enabled Reticulum key ratchets for LXMF
+ Added stamp generation, validation and automatic signalling
+ Added delivery ticket functionality, for allowing trusted senders to bypass stamp requirements
+ Fixed a bug in opportunistic delivery queue processing
+ Updated LXMF fields
+ Updated field specification
+ Added fields custom data types, as well as for development, testing and debugging
+ Added audio mode specifications for audio fields
+ Fixed a bug that sometimes caused delivery proofs to be sent too late

* LXST

+ Designed and implemented Lightweight Extensible Signals Transport, a secure general-purpose, real-time audio and signals transport protocol for Reticulum, allowing developers to easily create secure telephony, audio and voice communications systems

* RNode Firmware

+ Added support for SeeedStudio XIAO-ESP32S3
+ Added support for Heltec T114
+ Added support for LilyGO T-Echo
+ Added support for Heltec T114
+ Added support for LilyGO T3S3 SX1280 with PA
+ Added support for Heltec32 V3 boards
+ Added support for LilyGO T3 boards with TCXO
+ Added support for T-Beam Supreme devices
+ Added support for T3S3 devices with SX127x and SX126x modems
+ Added support for T-Deck devices
+ Added battery status reporting over BLE
+ Added battery monitoring on T3S3
+ Added ability to configure display rotation
+ Added ability to configure interference avoidance
+ Added noise-floor monitoring and reporting to host
+ Added ability to specify per-board transceiver OCP limit
+ Added support for flashing T3S3 boards
+ Improved CSMA perfomance and packet handling
+ Improved BLE pairing on ESP32 boards
+ Improved BLE pairing on nRF boards
+ Improved display handling on Heltec T114
+ Added signalling of detected interference to the host
+ Implemented a fix for an intermittent hardware bug in SX126x and SX128x transceiver chips that caused interference avoidance and RSSI detection to hang
+ Added "Missing Config" graphic instead of "Hardware Failure"
+ Fixed single-byte configuration changes not being saved on nRF-based boards
+ Reworked preamble and slot timing calculations
+ Improved BLE reliability on RAK4631
+ Fixed a firmware provisioning bug on RAK4631
+ Improves BLE on RAK4631
+ Adds graceful BLE disconnect on device sleep
+ Fixes intermittent packet corruption on RAK4631
+ Fixes incorrect preamble calculation on SX1280
+ Improves CSMA parameters and P-curve
+ Updated console image to include latest packages
+ Fixed display sleep on T3S3
+ Improved BLE pairing
+ Added RAK4631 firmware to build artifacts
+ Added display support on RAK4631 devices
+ Added indication of outgoing packets to waterfall display
+ Added user button input handling to all devices with a built-in user button
+ Added free memory monitoring and indication to connected host device on low memory
+ Improved inbound packet handling on ESP32 and nRF52 devices, fixing a potential packet corruption bug
+ Improved flashing procedure for devices with CDC serial drivers, so manual resets and bootloader modes are no longer necessary to flash and update
+ Added support for Bluetooth Low Energy connections on supported devices
+ Added input button actions for boards with a built-in button.
+ Added battery status and bootstrap console support to Heltec V3 boards
+ Added ability to configure NeoPixel intensity from rnodeconf
+ Added ability to configure display blanking timeout from rnodeconf
+ Updated makefile to use specific version of ESP-IDF
+ Improved battery calculations on devices without dedicated PMU
+ Fixed display intensity configuration regression
+ Fixed ESP32 bluetooth RX and TX buffers
+ Added deep sleep support on T3S3
+ Various quality updates for nRF / RAK4631
+ Fixed a bug with antenna switch utilisation on RAK4631
+ Updated console image to include latest packages
+ Added button input and deep sleep for supported boards
+ Fixed TRX switch pin init for SX1280 chips
+ Use hardware RNG for CSMA r-value seed on ESP32

* Sideband

+ Added the ability to make and receive LXST voice calls
+ Added basic voice call UI
+ Added option to configure audio devices for LXST voice calls
+ Added option to block non-trusted callers
+ Added support for sharing any file type as attachment on Android
+ Added link stats to object details
+ Added a BME280 telemetry plugin example
+ Added button on Android to quickly go to full RNS interface status
+ Improved map initialisation time
+ Fixed audio messages sometimes inadverdently playing on swipe back on Android
+ Fixed an intermittent error on telemetry plugin initialisation
+ Added ability to export telemetry to MQTT brokers
+ Added MQTT renderers for all telemetry types
+ Added LXMF Propagation Node statistics sensor type to Telemeter
+ Added RNS Transport statistics sensor type to Telemeter
+ Added Connection Map sensor type to Telemeter
+ Added periodic cleaning of old telemetry data from the database
+ Improved the overall performance and reliability of the telemetry engine
+ Improved markdown rendering
+ Updated plugin examples
+ Fixed a bug that would cause the announce stream to stop working due to missing signal icon specification
+ Added ability to cancel outgoing messages
+ Added ability to render messages formatted with markdown
+ Added ability to compose messages with markdown
+ Added ability to query peer telemetry from the map by right-clicking on the peer
+ Added auto-switching of message mode on attachment
+ Added indication if receiver rejects message
+ Added support for SX1280 bandwidth options to RNode configuration
+ Added ability to launch RNode flasher directly from utilities
+ Added error message display if the configured RNode parameters were not validated by the radio
+ Improved BBCode markup rendering
+ Improved UI feedback when adding attachments
+ Improved notification formatting
+ Updated RNode flasher to latest version
+ Fixed formatting of repository server URLs when device has multiple IP addresses
+ Fixed a stray newline character in repo URLs
+ Fixed a bug that caused invalid SSL certificate generation on Android
+ Fixed a bug that caused invalid GPS data struct packing in some situations
+ Fixed a bug in propagation node detection in daemon mode
+ Fixed a bug that caused attachment names not to display while sending
+ Added Liam Cottle's RNode flasher to the internal repository
+ Updated message color scheme for better readability and theme consistency
+ Added option to switch back to classic message colors
+ Updated theme and user interface defaults for new installations
+ Added signal stats to the announce stream (if available from interface)
+ Added ability to render rich markup in messages
+ Added BBCode syntax for formatting
+ Ability to render simple graphics and layouts with monospaced and terminal fonts
+ Ability to use all glyphs and icons included in Nerd Fonts
+ Added per-object live-tracking mode for telemetry-enabled peers
+ Added ability to add any number of interfaces via the Advanced RNS Configuration option
+ Added Utilities section
+ Added full rnstatus output to utilities
+ Added a log viewer to utilities
+ Added RNode flasher to utilities
+ Added advanced RNS configuration to utilities
+ Added support for the repository server on desktop operating systems
+ Added RNode firmwares to the repository content updater
+ Added serving the repository over HTTPS, with a self-signed certificate
+ Fixed desktop entry icon reference for Raspberry Pi OS
+ Added ability to add message attachments from sharing intent on Android
+ Added ability to add message attachments with drag-and-drop on desktop
+ Added user interface scaling option
+ Various minor UI tweaks and improvements
+ Updated RNS and LXMF to latest versions
+ Fixed a bug causing a completely black user interface after resume on Android
+ Fixed incorrect stamp cost display in announce stream
+ Fixed incorrect GPS speed being reported to the telemetry engine
+ Fixed stamp generation status not being displayed correctly in some cases
+ Added support for connecting to RNodes over BLE
+ Added RNode battery info to connectivity status dialog
+ Fixed a bug in service/frontend communication on Android
+ Fixed invalid automatic telemetry request scheduling timebase
+ Added option to use high-quality voice for PTT
+ Improved notification handling
+ Tapping notifications on Android now goes directly to the relevant conversation
+ Allow predictive text input on Android by default
+ Added option to block predictive text input
+ Automatically ask user for background service permission on Android
+ Fixed notifications not appearing on some Android versions
+ Fixed file and image attachments not working on Android 10
+ Added automatic path rediscovery during opportunistic delivery if a path fails
+ Fixed notifications not being displayed on some devices
+ Significantly improved message delivery performance and efficiency
+ Send messages opportunistically if destination ratchets are available
+ Added delivery method icons to message view
+ Improved announce details display
+ Improved feedback when closing app on desktop
+ Various UI improvements
+ Tuned announce intervals
+ Dispatch messages via background service on Android
+ Fixed a bug that caused undecodable messages to fail conversation loading
+ Added configuration option for ignoring messages with invalid stamps
+ Added outbound stamp cost handling and generation
+ Added inbound stamp cost settings to preferences
+ Added message details dialog
+ Added message encryption information to message details
+ Added ratchet information to object details
+ Added stamp cost information to object details
+ Added delivery ticket information to object details
+ Sideband will now automatically include delivery tickets to trusted peers
+ Fixed dialog sizing on mobile devices
+ Fixed a bug that caused attempted notification delivery when running in daemon mode
+ Fixed a bug that caused PTT button not to be hidden on conversations with PTT disabled
+ Fixed a bug in periodic random announce interval calculation
+ Added outbound stamp cost handling and generation
+ Added inbound stamp cost settings to preferences
+ Added message details dialog
+ Added message encryption information to message details
+ Added ratchet information to object details
+ Added stamp cost information to object details
+ Added delivery ticket information to object details
+ Sideband will now automatically include delivery tickets to trusted peers
+ Fixed dialog sizing on mobile devices
+ Fixed a bug that caused attempted notification delivery when running in daemon mode
+ Fixed a bug that caused PTT button not to be hidden on conversations with PTT disabled
+ Fixed a bug in periodic random announce interval calculation
+ Added inbound PTT audio queue
+ Added PTT playback block when recording a message
+ Added PTT activation by space key
+ Added battery temperature to telemetry
+ Improved database transaction concurrency handling on Android
+ Added PTT mode for audio messages
+ Added command-line options to import and export Sideband settings for changing configuration on daemon-mode Sideband instances
+ Improved telemetry processing and sending
+ Improved notification handling
+ Fixed a bug that would sometimes cause scheduled telemetry to be delayed
+ Fixed Sideband not detecting RAK4631-based boards over USB
+ Fixed Sideband not detecting LilyGO T3S3 boards over USB
+ Added Linux desktop integration regardless of installation source
+ Added install instructions for Raspberry Pi
+ Updated installation instructions for some platforms
+ Updated dependencies to mitigate numpy/codec2 incompatibilities
+ Fixed error display and audio player on missing codec2 library
+ Fixed various minor audio bugs
+ Fixed an invalid import bug
+ Fixed invalid category in desktop entry
+ Added Objects & Devices view
+ Added audio messaging in Codec2 and Opus encoding (currently supported on Linux and Android 10 and above)
+ Improved emoji support
+ Added keyboard shortcuts and documented them in the guide
+ Added CPU, storage and RAM sensors to telemetry system
+ Added tank sensor type to telemetry system
+ Added fuel level sensor type to telemetry system
+ Added proximity, gravity, magnetics and angular velocity to telemetry system
+ Added custom sensors to telemetry system
+ Updated telemetry plugin examples
+ Added audio processing subsystem on supported platforms
+ Improved system and navigation bar handling on Android
+ Improved functionality of cross-platform device API handling
+ Improved message display on attachment-only messages
+ Improved Preferences screen layout
+ Updated build system to target newer Android SDK
+ Fixed a bug that could cause the Send button to not work
+ Fixed LXMF delivery limits not getting applied until after app restart
+ Fixed a bug that would allow empty commands to be sent
+ Added desktop and application launcher integration on Linux
+ Added ability to focus message input field by pressing tab
+ Added network stats to object details
+ Improved example plugins
+ Linux GPSd plugin now retains location even when some fields are occassionally missing
+ Fixed bugs that caused routing and path request issues over shared radio mediums

>>> A Realistic Path Forward

There are technical features, that I very much personally wished to be part of the first production release of Reticulum, such as full network-wide multicast support, anonymous destination proxies and a comprehensive and developer-oriented application framework full of examples and basic projects to build your own protocols and applications on. The manual and documentation, while already quite comprehensive, could also benefit from updates and additions in many sections.

All of these are nice and valuable to have, but to be honest, a few of them were mostly included on my wish-list because they are very cool and incredibly interesting to experiment with from a networking perspective. But in terms of actual utility value, right now, they are not very important. Having a stable, functional and complete reference release of Reticulum is a lot more pressing, even though it's hard to resist the constant temptation of adding more advanced features. As such, I think this is the most sensible way forward.

Reticulum `=1.0.0`= will release with the general structure, feature set and API of version `=0.9.6`= (which will be the release migrating completely to AES-256 by default). That will be the last release before `=1.0.0`= to add any changes to general functionality, the wire format or the API. The core functionality, routing, API and security architecture is now in-place, fully implemented and very well tested in real-world usage. Any potential subsequent releases until `=1.0.0`= will solely be maintenance and bugfix releases.

Once the `=1.0.0`= release has happened, additional advanced features can be worked on, at a more considered pace. Realistically, these things will take significant time and resources to implement and test sufficiently, and the project should not be held up in waiting for that, since they do not offer a lot of important value right now.

In this context, I'd like to address a misconception that I've seen pop up a few times, namely that LXMF group messaging support will require native multicast to be implemented in Reticulum. This is not the case, and the current working design I have for LXMF group messaging functionality does not rely on multicast support, even though it will definitely benefit from it, once it is available.

>>> Potential Knows No Limits, Resources Are Always Finite

Ideas are a dime a dozen, while keeping the right ones, and throwing out the rest, is an uncertain art. From there, the rest is "just" the grind to actually `*get things done`*, and persist until they work reliably. The idea behind Reticulum - `*a truly distributed, secure and universal communications layer`* - is not new. It has existed in some shape or form at least since the very early days of the current Internet, and several exploratory efforts have attempted to capture this foundational idea into workable form.

Of course, Reticulum itself is also such an `*attempt`* at realizing a deeper idea. I don't know if it will succeed, or fall short in some unexpected way. But at least it knows what foundational substance it is aiming for. For me personally, this idea started taking residence in my mind around 2011, developed into the first early prototypes and explorations in 2013 and 2014, and in 2016 finally saw the beginning of an earnest and dedicated implementation I could believe in. Then, I held my nose and jumped.

From the beginning, Reticulum has been a long-term project, and still very much is. In many ways, what happens in the next year or two is not as important as what happens in the next ten or twenty, and that is the timescales I usually try to think in when making decisions about it.

For good reasons, it's pretty hard to understand, from first glance, just how much work, and how much of my life I personally put into making Reticulum a reality, and for it to not just remain an idea in a drawer. For context, here's a breakdown of additions made to the Reticulum repository, by contributor:

This is only the core Reticulum reference implementation repository, and does not include any of the auxiliary projects, protocols or clients that I have been the primary implementer of. Of all additions to the code, I committed `!97.9%`!. The second and third most active contributors come in at `!0.87%`! and `!0.75%`!, respectively. The remaining `!0.48%`! are accounted for by 31 other contributors.

I'm definitely not displaying this to make anyone's contributions seem small, `!because they are not`!. Everything has been important, and very much so. I'm trying to illustrate that this was a project that required almost `*fourteen years`* of deliberation and constant engagement in some form to realize, and that I personally took on the brunt of that work, risking more or less everything and going it alone, with the very real possibility that it might just be a complete flop. It still `*might`* of course, although I don't really think so anymore.

Fourteen years of engagement with any kind of project will take its toll on anyone. Especially so, when a substantial part of that required sacrificing a lot of important things to make it happen, living under uncertain conditions, and sometimes putting myself under much higher loads than was kind. To put it simply, I'm exhausted, and I need to recover. That will mean cutting away the things that are most taxing for me, and keeping only the things that are most important.

Before going into what that means, I'll just need to get the following out of the way. If it doesn't apply to you, please disregard, but some of you guys are really not very good at respecting the rather clear request to `*not`* email, message or call me privately with technical questions, support or help requests about Reticulum. As I've said before, you will not receive an answer, as there is literally no point in doing so.

Any questions can be much better answered on the various publicly accessible channels, where other people will also have the opportunity to benefit from the answers in the future (and people won't have to answer the same questions again and again). I'm not saying this to be mean or annoying, but simply because anything else is counter-productive to `*everyone`*.

There's some great and very knowledgeable people in the Reticulum community, who are incredibly helpful and well-informed about how everything works, and the service they have performed here is invaluable. To those people: You know who you are, and holy crap, you've saved my sanity more times than I can count. So, if you're new here: Use these amazing people, and help each other. And `*please`*: Treat everyone kindly and with respect, because everyone helping you is doing this out of their own time and good hearts.

>>> A Line In The Sand

Reading this, some might be inclined to think I won't be working much on Reticulum for the foreseeable future. That would be an incorrect assumption. I don't think I `*can`* stop working on it. But I will do this in my own time, at my own pace, according to the right way. As I write this, I can hear the thunder rolling in the distance, out in the mountains. I miss that. I miss being there with my family, and it's been way too long now.

There are people in my live that have given me so much, and waited so patiently for me. I don't want to keep them waiting any longer. One thing I've learned from this whole mad and exciting adventure, and already wrote a bit about in `Ffff`B222`[ the previous post `:/page/web.mu`url=https://unsigned.io/../articles/2024_05_16_Are_We_There_Yet.html]`b`f, is that there's things I excel at, and things I don't.

Participating actively in a large online community, and interacting with a lot of different people over the Internet all the time is one of the things that drain me. I've tried, and accepted defeat. I'm simply `Ffff`B222`[ not wired for it `:/page/web.mu`url=https://unsigned.io/../articles/2024_05_16_Are_We_There_Yet.html#a-fork-in-the-road]`b`f, and there is no changing that.

So, that kind of interaction is the first thing that will have to go, unfortunately. It's often been fun, but it's too much. For now, expect that I will not interact very much, if at all with the wider community. I still like you, I just need some peace in my head. With time, I think this will allow me to recover to a point where I can keep track of things from the sideline, and collect all kinds of questions and information requirements from the community into more generalized, long-form responses, documentation updates and code examples that will be beneficial to everyone. But don't expect that to happen in the near future at all, it won't. I'm out. I'm off on the zip-lines, baby.

Likewise, anything that is not related to the final stretch of getting Reticulum `=1.0.0`= complete and released will simply be put on hold for now, until I am fully ready to dedicate myself to it, and have some kind of financial means to dedicate to the work.

I've deliberated quite a bit about whether I should say this, since I'd hate being seen as seeking pity. But ultimately, it feels right to just be open about it, since it's also a large part of what I've dealt with for the last years. I live with a physical condition that causes me progressively worsening pain in more or less half of my body. Quite ironically, but unsurprisingly, sitting in front of a computer and working for 12 hours straight makes it a lot worse. I've stretched this `*way`* further than I should have, but all in all, it was probably worth it. We ain't come this far just to give up on the finish line. But I won't stretch it any further than this. It's time to heal a bit now.

When `=1.0.0`= is out, I am going to take a long break from everything. I'll go bury myself in sand and hug trees for a year straight or something. Eat cake in a bathtub. Slice all my bread with a katana. Dress up as Salvador DalÃ­ and sing Inuit folk songs. That sorta thing. That should also provide some time to potentially collect donations for meaningful periods of focused work. Let's see what happens.

Hopefully, I'll find myself back in a place, sooner rather than later, where my reality looks more like it did a few years ago. Not being completely exhausted and in constant pain, but more like this:

`Ffff`B222`[ Image `:/page/web.mu`url=https://unsigned.io/../images/psl0846.webp]`b`f

That's the kind of place I need to find again, and if I do, I'll come back better than before. As Jung said:`*"What you deny submits you, what you accept transforms you."`*

Just remember: `*"So long"`* isn't a goodbye. But just `*how`* long before we'll meet again, I don't know. Till' then:Take good care of everything, and especially each other.

â¥ï¸

`*PS: You've got this. Almost everything is ready now. It may not be perfect, it never will be, but it's more than good enough to build on. `!Don't wait for permission`!. Go build something - `!now`! - that helps people, something that grants a bit more freedom to someone, something that lets people communicate and associate freely without being manipulated, monitored or turned into assets by corrupt corporations and governments:**Something that creates a new place to stand, and to plant ideas and real human exchanges.`*

`*Reticulum is Unstoppable Networks For The People. That means `!the people`! need to build those networks and the applications running on them. That's not my job, `!it's yours`!. Don't wait for a corporation or someone else to do it for you! Don't wait for someone to write a story about it! Don't just stare into space and imagine it! `!Do it`!. Forget about the odds, and especially the profits. There are none, and in the end, even the thought of them is pointless.`*

`*If you want freedom in the world, build it. If you want rights for people, grant them. Don't expect `!anyone`! else to do it. Do it yourself, or as a group. Doesn't matter.`* `*Just do it**.`*

`*It was never the point for me to provide a complete solution to everything, and nobody should wait for that. My goal was to provide a set of tools that could build any kind of communications system, while protecting the sovereignty, dignity and humanity of its users. I also tried very hard to design that tool, such that those building would be required to think outside of the tiny box, which has created many of the limitations we currently face.`*

`*Forget what you know about "servers" and "clients", about "OSI models" and RFCs. You're not in Kansas anymore. Start from scratch, and take this in your hands as something that doesn't demand a particular way of working. If you try to squeeze it into what you already know about networked systems, nothing will make sense, and you might as well use it as a paperweight. Try to see it with clear eyes, and you'll get it. Once you do, you'll have something that is very easy to build some amazing things with.`*

-

`*This website is running on a 100% solar powered server`*

âï¸

`*Unless otherwise noted, everything here is put into the world under a `Ffff`B222`[ CC BY-NC-SA 4.0 `:/page/web.mu`url=https://unsigned.io/../LICENSE.txt]`b`f license.  
Feel free to share and remix, just remember the attribution.`*  
Contribute to keeping information on Free & Open Communications systems available for all.  
You can donate directly to `!unsigned.io`! by using one of the following QR codes:

`Ffff`B222`[  `:/page/web.mu`url=https://unsigned.io/../gfx/donate_xmr.png]`b`f  
Monero`Ffff`B222`[  `:/page/web.mu`url=https://unsigned.io/../gfx/donate_btc.png]`b`f  
Bitcoin`Ffff`B222`[  `:/page/web.mu`url=https://unsigned.io/../gfx/donate_eth.png]`b`f  
Ethereum
