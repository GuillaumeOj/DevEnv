"""Update user's python dependencies.

Used with a crontab for a daily update
"""
import os
import string
import subprocess


HOME_DIR = "/home/guillaume"


def update_requirements_list():
    requirements_file = f"{HOME_DIR}/DevEnv/requirements.txt"
    requirements_backup = f"{HOME_DIR}/DevEnv/requirements.bak"

    if os.path.exists(requirements_file):
        subprocess.run(["mv", requirements_file, requirements_backup], check=True)

    requirements_process = subprocess.run(
        ["pip", "freeze"],
        capture_output=True,
        check=True,
    )

    requirements = requirements_process.stdout.decode()

    with open(requirements_file, mode="w") as file:
        file.write(requirements)


def dependencies_for_all() -> None:
    if versions := _get_pyenv_versions():
        for version in versions:
            install_command = [
                f"{HOME_DIR}/.pyenv/shims/pip{version}",
                "install",
                "-U",
                "pip",
            ]
            subprocess.run(install_command, check=True)

            try:
                requirements_process = subprocess.run(
                    ["cat", "requirements.txt"], capture_output=True, check=True
                )
            except subprocess.CalledProcessError:
                update_requirements_list()
                return None

            requirements = _get_requirements(requirements_process)

            install_command.extend(requirements)

            try:
                subprocess.run(install_command, check=True)
            except subprocess.CalledProcessError:
                continue


def _get_requirements(requirements_process: subprocess.CompletedProcess) -> list:
    locked_requirements = requirements_process.stdout.decode()

    return [
        requirement.split(sep="==")[0]
        for requirement in locked_requirements.split(sep="\n")
        if requirement
    ]


def _get_pyenv_versions() -> set:
    completed_process = subprocess.run(
        ["pyenv", "global"],
        capture_output=True,
        check=True,
    )

    result = completed_process.stdout.decode()

    return set(
        version.rpartition(".")[0]  # keep only the two first digits
        for version in result.split(sep="\n")
        if _is_allowed(version)
    )


def _is_allowed(version: str) -> bool:
    if not version:
        return False

    for letter in string.ascii_lowercase:
        if letter in version:
            return False

    for deprecated_version in ["2.7", "3.5"]:
        if deprecated_version in version:
            return False

    return True


if __name__ == "__main__":
    dependencies_for_all()
    update_requirements_list()
