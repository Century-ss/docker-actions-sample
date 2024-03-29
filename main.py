import os

import datetime as dt


import requests  # noqa We are just importing this to prove the dependency installed correctly


# Set the output value by writing to the outputs in the Environment File, mimicking the behavior defined here:
#  https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#setting-an-output-parameter
def set_github_action_output(output_name, output_value) -> None:
    f = open(os.path.abspath(os.environ["GITHUB_OUTPUT"]), "a")
    f.write(f"{output_name}={output_value}")
    f.close()


# def set_github_action_output(key, value) -> None:
#     with open(os.environ["GITHUB_OUTPUT"], "a") as f:
#         print("{0}={1}".format(key, value), file=f)


def main() -> None:
    print("↓Environment Variables--------------")
    for key, value in os.environ.items():
        print(f"{key}: {value}")
    print("↑Environment Variables--------------")

    response = requests.get("https://example.com/")
    print(f"stats code: {response.status_code}")

    who_to_greet = os.environ.get("INPUT_WHO_TO_GREET")

    print(f"Hello {who_to_greet}")

    time = dt.datetime.now().isoformat()
    set_github_action_output("time", time)


if __name__ == "__main__":
    main()
