#!/usr/bin/env python3

import iterm2
import re
from subprocess import check_output


def GetTemp():
    return check_output(["/usr/local/bin/osx-cpu-temp"]).decode("utf-8").rstrip('\n')


def GetFan():
    fans = re.findall(r"(\d{1,4}) RPM", check_output(["/usr/local/bin/osx-cpu-temp", "-f"]).decode("utf-8").replace("\n", " "))
    # On Catalina , the fan speed is not yet managed by "/usr/local/bin/osx-cpu-temp" see https://github.com/lavoiesl/osx-cpu-temp/issues/28
    if len(fans) >= 1 :
        avg = int(sum(map(int, fans)) / len(fans))
        return str(avg) + " RPM"
    else :
        return "Unknown"


async def main(connection):
    app = await iterm2.async_get_app(connection)

    widget = iterm2.StatusBarComponent(
        short_description="Temp CPU",
        detailed_description="Shows the temperature of the CPU",
        knobs=[],
        exemplar=GetTemp(),
        update_cadence=5,
        identifier="com.iterm2.example.cpu-temp")

    @iterm2.StatusBarRPC
    async def coro(knobs, cputemp=iterm2.Reference("iterm2.user.cputemp?")):
        return "Temp:" + GetTemp() + " Fan:" + GetFan()

    # Register the component.
    await widget.async_register(connection, coro)


iterm2.run_forever(main)
