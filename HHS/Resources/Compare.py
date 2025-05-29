def compare_data(step, observed, expected) -> str:
    result = f"{step} \nObserved: {observed} \nExpected: {expected}"
    observed = observed.strip()
    expected = expected.strip()
    if observed.endswith('\\r'):
        observed = observed[:-2]
    if expected.endswith('\\r'):
            expected = expected[:-2]
    if "<space>" in expected:
        expected = expected.replace("<space>", " ")
    elif expected == "NoRead" or expected == 'None':
        expected = ""
    elif expected.startswith('|'):
        expected = expected[1:]
    if observed == expected:
        return 'True'
    else:
        diff_chars1 = compare_diff_chars(observed, expected)
        # result = f"{step} \nObserved: {observed} \nExpected: {expected}"
        if "CONTAINS: " in expected:
            expected = expected.replace("CONTAINS: ", '')
            if expected in observed:
                return 'True'
        elif "OR/ " in expected:
            surexp = expected.split(' OR/ ')
            for i in surexp:
                if observed == i:
                    return 'True'
        elif expected.lower() == "anyvalue":
            if observed != "":
                return 'True'
        elif diff_chars1 == {} or diff_chars1 == {'\\', 'r'}:
            return 'True'
        else:
            return result
    return result





def compare_diff_chars(string_one, string_two):
    difference_chars = ''
    if string_one != '' and string_two != '':
        difference_chars = set(string_one) - set(string_two)
        return difference_chars
    return difference_chars


def unicode_cover(observed_result):
    observed_result = observed_result.replace("\u0001", "{SOH}")
    observed_result = observed_result.replace("\0", "{NUL}")
    observed_result = observed_result.replace("\u0001", "{SOH}")
    observed_result = observed_result.replace("\u0002", "{STX}")
    observed_result = observed_result.replace("\u0003", "{ETX}")
    observed_result = observed_result.replace("\u0004", "{EOT}")
    observed_result = observed_result.replace("\u0005", "{ENQ}")
    observed_result = observed_result.replace("\u0006", "{ACK}")
    observed_result = observed_result.replace("\u0007", "{BEL}")
    observed_result = observed_result.replace("\u0008", "{BkSp}")
    observed_result = observed_result.replace("\u0009", "{Tab}")
    observed_result = observed_result.replace("\u000b", "{VT}")
    observed_result = observed_result.replace("\u000c", "{FF}")
    observed_result = observed_result.replace("\u000e", "{SO}")
    observed_result = observed_result.replace("\u000f", "{SI}")
    observed_result = observed_result.replace("\u0010", "{DLE}")
    observed_result = observed_result.replace("\u0011", "{XON}")
    observed_result = observed_result.replace("\u0012", "{DC2}")
    observed_result = observed_result.replace("\u0013", "{XOFF}")
    observed_result = observed_result.replace("\u0014", "{DC4}")
    observed_result = observed_result.replace("\u0015", "{NAK}")
    observed_result = observed_result.replace("\u0016", "{SYN}")
    observed_result = observed_result.replace("\u0017", "{ETB}")
    observed_result = observed_result.replace("\u0018", "{CAN}")
    observed_result = observed_result.replace("\u0019", "{EM}")
    observed_result = observed_result.replace("\u001a", "{EOF}")
    observed_result = observed_result.replace("\u001b", "{Esc}")
    observed_result = observed_result.replace("\u001c", "{FS}")
    observed_result = observed_result.replace("\u001d", "{GS}")
    observed_result = observed_result.replace("\u001e", "{RS}")
    observed_result = observed_result.replace("\u001f", "{US}")
    return observed_result


