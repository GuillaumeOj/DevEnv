"""Update user's python dependencies.

Used with a crontab for a daily update
"""
import subprocess

completed_process = subprocess.run(
    ["pip", "freeze"],
    capture_output=True,
    check=True,
)

result = completed_process.stdout.decode()

update_command = ["pip", "install", "-U"]

requirements = [
    requirement.split(sep="==")[0]
    for requirement in result.split(sep="\n")
    if requirement
]

update_command.extend(requirements)

subprocess.run(update_command, check=True)
