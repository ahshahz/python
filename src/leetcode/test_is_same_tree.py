import pytest


class node:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class is_same_tree:
    def __init__(self, p, q):
        self.p = p
        self.q = q
        self.result = self._walk(p, q)

    def _walk(self, p: node, q: node) -> bool:
        def traverse(n, result):
            if n:
                result.append(n.val)
                traverse(n.left, result)
                traverse(n.right, result)
            else:
                result.append(0)
            return result
        return traverse(p, []) == traverse(q, [])


def test_is_same_tree_true():
    test = is_same_tree(node(3), node(3))
    assert(test.result is True)


def test_is_same_tree_false():
    test = is_same_tree(node(3), node(2))
    assert(test.result is False)


def test_is_same_tree_fails():
    with pytest.raises(AttributeError):
        test = is_same_tree(1, 1)
