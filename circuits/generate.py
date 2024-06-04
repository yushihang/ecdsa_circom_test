import json


def generate_json(n):
    data = {
        "a": ["3"] * n,
        "b": ["2"] * n
    }
    return json.dumps(data, indent=2)


n = 15901
result_json = generate_json(n)
print(result_json)
