const openingBrackets = ['(','[','{']
const closeingBrackets = [')', ']', '}']

proc matching(curr:char, c:char):bool=
    case c:
    of '(':
        curr == ')'
    of '[':
        curr == ']'
    of '{':
        curr == '}'
    else:
        false

proc isPaired* (input: string): bool=
    var heap = newSeq[char]()
    if input.len==0:
        return true
    for c in input:
        if c in openingBrackets:
            heap.add(c)
        if c in closeingBrackets:
            if heap.len == 0:
                return false
            var last = heap[heap.len-1]
            if matching(c, last):
                discard heap.pop()
            else:
                return false
    return heap.len == 0
        

    # proc isPaired*(input: string): bool =
    #     var stack: seq[char] = @[]
    #     for c in input:
    #       case c
    #         of '(': stack.add(')')
    #         of '{': stack.add('}')
    #         of '[': stack.add(']')
    #         of ')', ']', '}':
    #           if stack.len == 0 or stack.pop() != c: return false
    #         else: discard
    #     stack.len == 0