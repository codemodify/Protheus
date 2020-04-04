# ![](https://fonts.gstatic.com/s/i/materialiconsoutlined/flare/v1/24px.svg) Protheus

A robust operating system to help prepare for deep AI, bridge the gaps in global sustainability and be ready for the post-quantum world with blockchain at core.

The platform is built around the Linux Kernel. It is designed to motivate innovation at its fullest within open and healthy communities in software engineering and industries that will need a robust core to build and run solutions on.

It empowers researchers, innovators, disruptors, daily users and enterprize to get to the next level.

At the moment to abstract away complexities it leverages the facilities of [Arch Linux](https://www.archlinux.org) in terms of booting, installing initial libraries and the core of the OS.

To give an idea how to describe it in simple words at the moment it features
- Privacy and safety oriented from ground up
- ABS concepts from Arch
- Versioning concepts from Nix OS
- Sanboxing concepts from Qubes OS / Docker / Kubernetes
- Extensibility and development platform for the modern world with best practices in engineering



# ![](https://fonts.gstatic.com/s/i/materialicons/help_outline/v1/24px.svg) Dox - Concepts
The concept works like this
- If you need a change then modify the template and apply it.
- If you need a need a run-time change then use the API to apply the change until next reboot.
- `Templates` is where all the blueprints are set then a system image is generated from.



# ![](https://fonts.gstatic.com/s/i/materialicons/help_outline/v1/24px.svg) Dox - Details
- `/System`
	- Is where the core os binaries and config files reside. A read-only partition/folder.
	- Provides an object model/api to all hardware abstraction layers and runtime configurations to read/write.
- `/SystemData`
	- Is where the system logs and temp files are
- `/Contrib`
	- Is where all the software lands with their configs and data
- `/Templates`
	- `/System`
		- `/Boot`
		- `/Kernel`
		- `/Audio`
		- `/Video`
		- `/Keyboard`
		- `/Mouse`
	- `/SystemData`
		- `Logs`
		- `TempFiles`
	- `/Contrib`
		- `/SystemOverlay`
			- `Arch`
			- `Ubuntu`
			- `FreeBSD`
			- `Windows`
			- `Mac`



# ![](https://fonts.gstatic.com/s/i/materialiconsoutlined/history/v1/24px.svg) Past History

The story goes like this: around 1998 there was a guy dreaming about an integrated platform that will interact with existing radio based network devices in a transparent manner. Overtime the project was an on/off thing and finally was made public here https://github.com/codemodify/freebsddistro while continuing to research about cloud based services for the enterprise in early 2000s as a must have for the platform to exist.

That guy is me and I'm back at it seems.