import json
import sys

try:
    with open('input.txt', 'r', encoding='utf-8') as f:
        content = f.read().strip()

    if not content:
        print("Empty file")
        sys.exit()

    data = json.loads(content)

    if not isinstance(data, dict) or "list1" not in data or "list2" not in data:
        print("error")
        sys.exit()

    list1 = data["list1"]
    list2 = data["list2"]

    if not isinstance(list1, list) or not isinstance(list2, list):
        print("error")
        sys.exit()

    for item in list1 + list2:
        if not isinstance(item, dict) or "title" not in item or "year" not in item:
            print("error")
            sys.exit()
        if not isinstance(item["year"], int) or isinstance(item["year"], bool):
            print("error")
            sys.exit()

    for i in range(len(list1) - 1):
        if list1[i]["year"] > list1[i + 1]["year"]:
            print("error")
            sys.exit()

    for i in range(len(list2) - 1):
        if list2[i]["year"] > list2[i + 1]["year"]:
            print("error")
            sys.exit()

    merged = []
    i = 0
    j = 0
    while i < len(list1) and j < len(list2):
        if list1[i]["year"] <= list2[j]["year"]:
            merged.append(list1[i])
            i += 1
        else:
            merged.append(list2[j])
            j += 1

    while i < len(list1):
        merged.append(list1[i])
        i += 1

    while j < len(list2):
        merged.append(list2[j])
        j += 1

    output = {"list0": merged}
    print(json.dumps(output, ensure_ascii=False, indent=2))
except Exception:
    print("error")